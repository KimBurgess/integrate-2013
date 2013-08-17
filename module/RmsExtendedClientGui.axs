MODULE_NAME='RmsExtendedClientGui'(dev vdvRMS, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_ENDED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_STARTED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK
#DEFINE INCLUDE_NFC_TAG_READ_CALLBACK


#INCLUDE 'TPUtil'
#INCLUDE 'TimeUtil'
#INCLUDE 'User'
#INCLUDE 'RmsBookingUserAssociation'
#INCLUDE 'RmsAssetLocationTracker'
#INCLUDE 'RmsSchedulingApi'
#INCLUDE 'RmsSchedulingEventListener'
#INCLUDE 'NfcListener'


define_type

structure locationInfo {
	char isInUse;
	RmsEventBookingResponse activeBooking;
	RmsEventBookingResponse nextBooking;
}


define_variable

constant integer MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer MEETING_TIME_VIEW_ADDRESS = 3;
constant integer MEETING_TIME_DELTA_VIEW_ADDRESS = 4;
constant integer MEETING_DETAILS_VIEW_ADDRESS = 5;
constant integer MEETING_HEADER_VIEW_ADDRESS = 6;
constant integer NFC_LOGOUT_VIEW_ADDRESS = 10;
constant integer NFC_USER_WELCOME_VIEW_ADDRESS = 11;

constant char RMS_SCHEDULING_PAGE[] = 'rmsSchedulingPage';
constant char MEETING_INFO_VIEW_NAME[] = 'rmsMeetingInfoCard';
constant char IN_USE_INDICATOR_VIEW_NAME[] = 'rmsInUseIndicator';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = 'rmsAvailabilityGuide';
constant char NFC_TOUCH_ON_VIEW_NAME[] = 'nfcTouchOn';
constant char NFC_USER_WELCOME_VIEW_NAME[] = 'nfcWelcome';
constant char NFC_LOGOUT_VIEW_NAME[] = 'nfcLogOut';
constant char RMS_CALENDAR_VIEW_NAME[] = 'rmsCalendar';
constant char RMS_MEETING_DETAILS_VIEW_NAME[] = 'rmsMeetingDetails';
constant char RMS_MEETING_DOES_NOT_EXIST_VIEW_NAME[] = 'rmsMeetingDoesNotExist';
constant char RMS_MEETING_REQUEST_VIEW_NAME[] = 'rmsMeetingRequest';
constant char RMS_MESSAGE_VIEW_NAME[] = 'rmsMessage';

volatile locationInfo uiLocation;

volatile UserData activeUser;


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

	// No user currently authed
	if (userIsNull(activeUser)) {
	
		// Hide all the stuff you need to be authed for
		hidePopupEx(dvTpBase, RMS_CALENDAR_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, RMS_MEETING_DETAILS_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, RMS_MEETING_DOES_NOT_EXIST_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, RMS_MEETING_REQUEST_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, RMS_MESSAGE_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, NFC_LOGOUT_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, NFC_USER_WELCOME_VIEW_NAME, RMS_SCHEDULING_PAGE);

		// Show the persistant elements
		showPopupEx(dvTpBase, NFC_TOUCH_ON_VIEW_NAME, RMS_SCHEDULING_PAGE);
		showPopupEx(dvTpBase, IN_USE_INDICATOR_VIEW_NAME, RMS_SCHEDULING_PAGE);
		showPopupEx(dvTpBase, AVAILABILITY_GUIDE_VIEW_NAME, RMS_SCHEDULING_PAGE);

		// Show the meeting info card if there's any data of interest
		select {

			active (uiLocation.isInUse): {
				updateMeetingInfoView(uiLocation.activeBooking, false);
				showPopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			}

			active (!uiLocation.isInUse &&
				uiLocation.nextBooking.bookingId != uiLocation.activeBooking.bookingId): {
				updateMeetingInfoView(uiLocation.nextBooking, true);
				showPopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			}
			
			active (1): {
				hidePopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			}
		}

	// We have a human (or a goat with an NFC chip)
	} else {
	
		// Hide all the general access elements
		hidePopupEx(dvTpBase, AVAILABILITY_GUIDE_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, NFC_TOUCH_ON_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, IN_USE_INDICATOR_VIEW_NAME, RMS_SCHEDULING_PAGE);

		updateUserInfoView(activeUser);

		// And show the authed content
		showPopupEx(dvTpBase, NFC_LOGOUT_VIEW_NAME, RMS_SCHEDULING_PAGE);
		showPopupEx(dvTpBase, RMS_CALENDAR_VIEW_NAME, RMS_SCHEDULING_PAGE);
		showPopupEx(dvTpBase, NFC_USER_WELCOME_VIEW_NAME, RMS_SCHEDULING_PAGE);
	}
}

/**
 * Updates the meeting details card on the touch panel.
 *
 * @param	booking			an RmsEventBookingResponse containing the booking
 *							data
 * @param	isFutureEvent	a boolean, true if 'booking' is in the future
 */
define_function updateMeetingInfoView(RmsEventBookingResponse booking,
		char isFutureEvent) {
	stack_var char header[50]
	stack_var char timeDelta[50]

	if (isFutureEvent) {
		header = 'Next Meeting';
		timeDelta = "'Starts ', fuzzyTime(booking.minutesUntilStart)";
	} else {
		header = 'Meeting Details';
		timeDelta = "'Ends ', fuzzyTime(booking.remainingMinutes)";
	}

	setButtonText(dvTp, MEETING_HEADER_VIEW_ADDREss, header);
	setButtonText(dvTp, MEETING_SUBJECT_VIEW_ADDRESS, booking.subject);
	setButtonText(dvTp, MEETING_ORGANISER_VIEW_ADDRESS, booking.organizer);
	setButtonText(dvTp, MEETING_TIME_VIEW_ADDRESS,
			"time12Hour(booking.startTime), ' - ', time12Hour(booking.endTime)");
	setButtonText(dvTp, MEETING_TIME_DELTA_VIEW_ADDRESS, timeDelta);
	setButtonText(dvTp, MEETING_DETAILS_VIEW_ADDREss, booking.details);

}

/**
 * Updates customised user content (name, photo etc.).
 *
 * @param	user		the user data to update with
 */
define_function updateUserInfoView(UserData user) {
	stack_var char nameParts[3][50];

	explode(' ', user.name, nameParts, 3);

	setButtonText(dvTp, NFC_USER_WELCOME_VIEW_ADDRESS,
			"'Welcome, ', nameParts[1]");

	// TODO set photo here
}

/**
 * Sets the room available state.
 *
 * @param	isInUse		a boolean, true if the room is in use
 */
define_function setInUse(char isInUse) {
	uiLocation.isInUse = isInUse;
	redraw();
}

/**
 * Sets the active meeting info for the touch pane location.
 *
 * @param	booking		an RmsEventBookingResponse containing the active meeting
 *						data
 */
define_function setActiveMeetingInfo(RmsEventBookingResponse booking) {
	extractUserDetails(booking);
	uiLocation.activeBooking = booking;
	redraw();
}

/**
 * Sets the next meeting info for the touch panel location.
 *
 * @param	booking		an RmsEventBookingResponse containing the next meeting
 *						data
 */
define_function setNextMeetingInfo(RmsEventBookingResponse booking) {
	extractUserDetails(booking);
	uiLocation.nextBooking = booking;
	redraw();
}

/**
 * Attempt to authenticate an NFC user.
 *
 * @param	uid			the captured uid
 */
define_function authenticate(char uid[]) {
	stack_var UserData testUser;

	testUser.uid = '1234';
	testUser.name = 'Kim Burgess';
	testUser.email = 'kim.burgess@amxaustralia.com.au';

	activeUser = testUser;

	redraw();
}

/**
 * Deauth any currently logged in users.
 */
define_function logout() {
	activeUser = nullUser;

	redraw();
}

/**
 * Sends a meeting confirmation to a specific user.
 *
 * @param	user		the user to send to
 * @param	booking		the booking to confirm
 */
define_function sendBookingConfirmation(UserData user,
		RmsEventBookingResponse booking) {
	stack_var char CRLF[2];
	stack_var char msg[1024];
	stack_var char subject[256];
	
	CRLF = "$0D, $0A";
	
	subject = 'RMS Room Booking Confirmation';
	
	msg = "'You', $27 , 're booking for ', locationTracker.location.name, ' has been confirmed.', CRLF,
			CRLF,
			'Booking details:', CRLF,
			'  ', booking.subject, CRLF,
			'  ', booking.startTime, ' - ', booking.endTime, CRLF,
			'  ', string_date_invert(booking.startDate), CRLF,
			CRLF,
			'This booking was created from the scheduling touch panel. If you ',
			'did not create this please contact your system administrator.'";
	
	RmsEmail(user.email, subject, msg, '', '');
}


// RMS callbacks

define_function RmsEventSchedulingNextActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationTracker.location.id) {
		setNextMeetingInfo(eventBookingResponse);
	}
}

define_function RmsEventSchedulingActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationTracker.location.id) {
		setActiveMeetingInfo(eventBookingResponse);
		setInUse(true);
	}
}

define_function RmsEventSchedulingNextActiveUpdated(char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationTracker.location.id) {
		setNextMeetingInfo(eventBookingResponse);
	}
}

define_function RmsEventSchedulingActiveUpdated(char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationTracker.location.id) {
		setActiveMeetingInfo(eventBookingResponse);
		setInUse(true);
	}
}

define_function RmsEventSchedulingEventEnded(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationTracker.location.id) {
		setInUse(false);
	}
}

define_function RmsEventSchedulingEventStarted(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationTracker.location.id) {
		setInUse(true);
	}
}

define_function RmsEventSchedulingCreateResponse(char isDefaultLocation,
		char responseText[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location = locationTracker.location.id) {

		if (eventBookingResponse.isSuccessful && !userIsNull(activeUser)) {
			extractUserDetails(eventBookingResponse);
			sendBookingConfirmation(activeUser, eventBookingResponse);
		}

	}
}

 
// NFC callbacks

define_function NfcTagRead(integer tagType, char uid[], integer uidLength) {
	if (userIsNull(activeUser)) {
		authenticate(uid);
	}
}


define_start

init();


define_event

data_event[dvTp] {

	online: {
		redraw();
	}

}

button_event[dvTp, NFC_LOGOUT_VIEW_ADDRESS] {

	push: {
		logout();
	}

}
