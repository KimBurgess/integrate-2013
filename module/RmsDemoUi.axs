MODULE_NAME='RmsDemoUi'(dev vdvRMS, dev vdvRmsGui, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#DEFINE INCLUDE_TP_NFC_TAG_READ_CALLBACK


#INCLUDE 'User'
#INCLUDE 'string'
#INCLUDE 'TpApi'
#INCLUDE 'TpEventListener'
#INCLUDE 'RmsApi'
#INCLUDE 'RmsGuiApi'
#INCLUDE 'RmsAssetLocationTracker'


define_variable

// Page names
constant char BLANK_PAGE[] = 'blank'
constant char CONNECTED_PAGE[] = 'connected';
constant char CONNECTING_PAGE[] = 'connecting'
constant char STANDBY_PAGE[] = 'standby';
constant char MAIN_PAGE[] = 'rmsSchedulingPage';
constant char TECH_PAGE[] = 'tech'

// Button addresses
constant integer START_VIEW_ADDRESS = 1;
constant integer END_VIEW_ADDRESS = 2;
constant integer HELP_REQUEST_VIEW_ADDRESS = 10;

// Keyboard messages
constant char MAINTENANCE_REQUEST_RETURN = 'MAINT.REQUEST';

volatile char systemInUse;

volatile integer activeUser;


/**
 * Initialise module variables that can be assisgned at compile time.
 */
define_function init() {
	setLocationTrackerAsset(RmsDevToString(dvTpBase));
}


/**
 * Render the appropriate popups and page elements for the current system state.
 */
define_function redraw() {
	select {

		// System standby
		active (!systemInUse): {
			setPageAnimated(dvTpBase, STANDBY_PAGE, 'fade', 0, 2);
		}

		active (systemInUse && activeUser): {
			setPageAnimated(dvTpBase, TECH_PAGE, 'fade', 0, 1);
		}

		active (systemInUse && !activeUser): {
			setPageAnimated(dvTpBase, MAIN_PAGE, 'fade', 0, 1);
		}

	}
}


/**
 * Sets the system state.
 *
 * @param	isOnLine	a boolean, true if we are good to go
 */
define_function setOnline(char isOnline) {
	if (isOnline) {

		cancel_wait 'systemOnlineAnimSequence';
		setPageAnimated(dvTpBase, CONNECTED_PAGE, 'fade', 0, 2);
		wait 10 'systemOnlineAnimSequence' {
			setPageAnimated(dvTpBase, BLANK_PAGE, 'fade', 0, 10);
			wait 10 'systemOnlineAnimSequence' {
				redraw();
			}
		}

	} else {

		cancel_wait 'systemOnlineAnimSequence';
		setPageAnimated(dvTpBase, BLANK_PAGE, 'fade', 0, 10);
		wait 10 'systemOnlineAnimSequence' {
			setPageAnimated(dvTpBase, CONNECTING_PAGE, 'fade', 0, 20);
		}

	}
}

/**
 * Sets the system in use state.
 *
 * @param	isInUse			a boolean, true if we've got a demo going
 */
define_function setInUse(char isInUse) {
	systemInUse = isInUse;
	redraw();
}


/**
 * Attempt to authenticate an NFC user.
 *
 * @param	uid			the captured uid
 */
define_function authenticate(char uid[]) {
	stack_var integer userId;

	userId = getUserIdFromNfcUid(uid);

	if (!userExists(userId)) {
		playSound(dvTpBase, 'invalid-id.wav');
		return;
	}

	playSound(dvTpBase, 'valid-id.wav');

	activeUser = userId;
	
	RmsSetDefaultEventBookingSubject(getAdHocBookingSubject(activeUser));
	RmsSetDefaultEventBookingBody(getAdHocBookingDetails(activeUser));

	redraw();
}

/**
 * Submits and RMS maintenance request on behalf of a system user.
 *
 * @param	userID		the userId to log the request against
 * @param	msg			the request message
 */
define_function submitMaintenanceRequest(integer userId, char msg[]) {
	RmsSendMaintenanceRequest("msg,
			'. [submitted by ', getUserName(userId), ']'")
}


// TP callbacks

define_function NfcTagRead(integer tagType, char uid[], integer uidLength) {
	if (!activeUser) {
		authenticate(uid);
	}
}



define_start

init();


define_event

channel_event[vdvRMS, RMS_CHANNEL_CLIENT_REGISTERED] {

	on: {
		setOnline(true);
	}

	off: {
		setOnline(false);
	}

}

data_event[dvTp] {

	online: {
		setOnline([vdvRMS, RMS_CHANNEL_CLIENT_REGISTERED]);
	}

	string: {
		stack_var char key[64];
		stack_var char value[512];


		key = string_get_key(data.text);
		value = string_get_value(data.text);
		
		select {
			
			active (key = MAINTENANCE_REQUEST_RETURN): {
				submitMaintenanceRequest(activeUser, value);
			}
			
		}
	}

}

button_event[dvTp, START_VIEW_ADDRESS] {

	push: {
		setInUse(true);
	}

}

button_event[dvTp, END_VIEW_ADDRESS] {

	push: {
		setInUse(false);
	}

}

button_event[dvTp, SUBMIT_HELP_REQUEST_VIEW_ADDRESS] {

	push: {
		RmsSendHelpRequest('Help me!');
	}

}
