MODULE_NAME='RmsDemoUi'(dev vdvRMS, dev vdvRmsGui, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#INCLUDE 'TPApi'
#INCLUDE 'RmsApi'
#INCLUDE 'RmsAssetLocationTracker'


define_variable

// Page names
constant char BLANK_PAGE[] = 'blank'
constant char CONNECTED_PAGE[] = 'connected';
constant char CONNECTING_PAGE[] = 'connecting'
constant char CALENDAR_PAGE[] = 'rmsSchedulingPage';

// Button addresses
constant integer SUBMIT_HELP_REQUEST_VIEW_ADDRESS = 1;
constant integer SUBMIT_MaINTENANCE_REQUEST_VEW_ADDRESS = 2;


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
	setPageAnimated(dvTpBase, CALENDAR_PAGE, 'fade', 0, 2);
	showPopupEx(dvTpBase, 'rmsHotlistTable', CALENDAR_PAGE);
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

}

button_event[dvTp, SUBMIT_HELP_REQUEST_VIEW_ADDRESS] {

	push: {
		RmsSendHelpRequest('Help me!');
	}

}

button_event[dvTp, SUBMIT_HELP_REQUEST_VIEW_ADDRESS] {

	push: {
		RmsSendMaintenanceRequest('Room maintenance required.');
	}

}
