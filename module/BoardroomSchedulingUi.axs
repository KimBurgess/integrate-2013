MODULE_NAME='BoardroomSchedulingUi'(dev vdvRMS, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_ENDED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_STARTED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK
#DEFINE INCLUDE_TP_NFC_TAG_READ_CALLBACK


#INCLUDE 'TPApi'
#INCLUDE 'TpEventListener'
#INCLUDE 'TimeUtil'
#INCLUDE 'User'
#INCLUDE 'RmsBookingUserAssociation'
#INCLUDE 'RmsAssetLocationTracker'
#INCLUDE 'RmsSchedulingApi'
#INCLUDE 'RmsSchedulingEventListener'


define_type

structure locationInfo {
	char isInUse;
	RmsEventBookingResponse activeBooking;
	RmsEventBookingResponse nextBooking;
}


define_variable

constant integer MEET_NOW_TIME = 10; // minutes

constant integer MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer MEETING_TIME_VIEW_ADDRESS = 3;
constant integer MEETING_TIME_DELTA_VIEW_ADDRESS = 4;
constant integer MEETING_DETAILS_VIEW_ADDRESS = 5;
constant integer MEETING_HEADER_VIEW_ADDRESS = 6;
constant integer NFC_LOGOUT_VIEW_ADDRESS = 10;
constant integer NFC_USER_WELCOME_VIEW_ADDRESS = 11;
constant integer NFC_MEET_NOW_VIEW_ADDRESS = 20;

constant char RMS_SCHEDULING_PAGE[] = 'rmsSchedulingPage';
constant char OFFLINE_PAGE[] = 'offline';
constant char CONNECTED_PAGE[] = 'connected';
constant char MEETING_INFO_VIEW_NAME[] = 'rmsMeetingInfoCard';
constant char IN_USE_INDICATOR_VIEW_NAME[] = 'rmsInUseIndicator';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = 'rmsAvailabilityGuide';
constant char NFC_TOUCH_ON_VIEW_NAME[] = 'nfcTouchOn';
constant char NFC_USER_WELCOME_VIEW_NAME[] = 'nfcWelcome';
constant char NFC_LOGOUT_VIEW_NAME[] = 'nfcLogOut';
constant char NFC_HOME_VIEW_NAME[] = 'nfcHome';
constant char RMS_MEET_NOW_VIEW_NAME[] = 'rmsMeetNow';
constant char RMS_CALENDAR_VIEW_NAME[] = 'rmsCalendar';
constant char RMS_MEETING_DETAILS_VIEW_NAME[] = 'rmsMeetingDetails';
constant char RMS_MEETING_DOES_NOT_EXIST_VIEW_NAME[] = 'rmsMeetingDoesNotExist';
constant char RMS_MEETING_REQUEST_VIEW_NAME[] = 'rmsMeetingRequest';
constant char RMS_MESSAGE_VIEW_NAME[] = 'rmsMessage';

volatile locationInfo uiLocation;

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
	local_var integer lastUser;

	// No user currently authed
	if (!activeUser) {

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

			active (!uiLocation.isInUse && !uiLocationHasMoreBookings()): {
				hidePopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			}

			active (!uiLocation.isInUse): {
				updateMeetingInfoView(uiLocation.nextBooking, true);
				showPopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			}
		}

	// We have a human (or a goat with an NFC chip)
	} else {

		// Only update this view on a user change to prevent issue with popup
		// ordering
		if (lastUser && (activeUser == lastUser)) {
			return;
		}

		// Hide all the general access elements
		hidePopupEx(dvTpBase, AVAILABILITY_GUIDE_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, NFC_TOUCH_ON_VIEW_NAME, RMS_SCHEDULING_PAGE);
		hidePopupEx(dvTpBase, IN_USE_INDICATOR_VIEW_NAME, RMS_SCHEDULING_PAGE);

		updateUserInfoView(activeUser);

		// And show the authed content
		showPopupEx(dvTpBase, NFC_LOGOUT_VIEW_NAME, RMS_SCHEDULING_PAGE);

		// If we've got time for a 'meet now' before the next meeting give the
		// option, otherwise just skip straight to the calendar
		if ((uiLocation.nextBooking.minutesUntilStart > MEET_NOW_TIME ||
				!uiLocationHasMoreBookings()) &&
				!uiLocation.isInUse) {
			showPopupEx(dvTpBase, NFC_HOME_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopupEx(dvTpBase, NFC_USER_WELCOME_VIEW_NAME, RMS_SCHEDULING_PAGE);
		} else {
			showPopupEx(dvTpBase, RMS_CALENDAR_VIEW_NAME, RMS_SCHEDULING_PAGE);
		}
	}

	lastUser = activeUser;
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
 * @param	userId		the user system userId to update with
 */
define_function updateUserInfoView(integer userId) {
	stack_var char nameParts[3][50];

	explode(' ', getUserName(userId), nameParts, 3);

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
	stack_var integer userId;

	userId = getUserIdFromNfcUid(uid);

	if (!userExists(userId)) {
		playSound(dvTpBase, 'invalid-id.wav');
		return;
	}

	playSound(dvTpBase, 'valid-id.wav');

	activeUser = userId;

	redraw();

	// TODO start timeline and auto log out after 45 seconds of no activity
}

/**
 * Deauth any currently logged in users.
 */
define_function logout() {
	activeUser = 0;

	redraw();
}

/**
 * Create an adhoc apointment for right now.
 */
define_function meetNow() {
	RmsBookingCreate(LDATE,
			TIME,
			MEET_NOW_TIME,
			'Ad-hoc meeting',
			insertUserDetails('', activeUser),
			locationTracker.location.id);

	// TODO show 'Requesting Reservation popup'
}

/**
 * Sends a meeting confirmation to a specific user.
 *
 * @param	userId		the user to send to
 * @param	booking		the booking to confirm
 */
define_function sendBookingConfirmation(integer userId,
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
			'  ', time12Hour(booking.startTime), ' - ', time12Hour(booking.endTime), CRLF,
			'  ', string_date_invert(booking.startDate), CRLF,
			CRLF,
			'This booking was created from the touch panel booking system. If ',
			'you did not create this please contact your system administrator.'";

	RmsEmail(getUserEmail(userId), subject, msg, '', '');
}

/**
 * Check if there are any more known bookings within the scheduling sync window
 * for the ui location.
 *
 * @return				a boolean, true if there is another known booking
 */
define_function char uiLocationHasMoreBookings() {
	return (uiLocation.nextBooking.bookingId != uiLocation.activeBooking.bookingId) &&
			uiLocation.nextBooking.bookingId = '';
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
		if (eventBookingResponse.isSuccessful && activeUser) {
			extractUserDetails(eventBookingResponse);
			sendBookingConfirmation(activeUser, eventBookingResponse);
		}

	}
}


// NFC callbacks

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
		setPageAnimated(dvTpBase, CONNECTED_PAGE, 'fade', 0, 2);
		redraw();
		wait 20 'display' {
			setPageAnimated(dvTpBase, RMS_SCHEDULING_PAGE, 'fade', 0, 40);
		}
	}
	
	off: {
		cancel_wait 'display';
		setPageAnimated(dvTpBase, OFFLINE_PAGE, 'fade', 0, 20);
	}

}

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

button_event[dvTp, NFC_MEET_NOW_VIEW_ADDRESS] {

	push: {
		meetNow();
	}

}
