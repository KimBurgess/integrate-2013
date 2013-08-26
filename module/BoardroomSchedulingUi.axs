MODULE_NAME='BoardroomSchedulingUi'(dev vdvRms, dev vdvRmsGui, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


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
#INCLUDE 'RmsGuiApi'
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

constant integer AUTO_LOGOUT_DELAY = 40; // seconds

// Button addresses
constant integer MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer MEETING_TIME_VIEW_ADDRESS = 3;
constant integer MEETING_TIME_DELTA_VIEW_ADDRESS = 4;
constant integer MEETING_DETAILS_VIEW_ADDRESS = 5;
constant integer MEETING_HEADER_VIEW_ADDRESS = 6;
constant integer NFC_LOGOUT_VIEW_ADDRESS = 10;
constant integer NFC_USER_WELCOME_VIEW_ADDRESS = 11;
constant integer NFC_USER_IMAGE_VIEW_ADDRESS = 12;
constant integer NFC_MEET_NOW_VIEW_ADDRESS = 20;
constant integer NFC_BOOK_NEXT_VIEW_ADDRESS = 21;

// Page names
constant char BLANK_PAGE[] = 'blank'
constant char CONNECTED_PAGE[] = 'connected';
constant char CONNECTING_PAGE[] = 'connecting'
constant char NFC_HOME_PAGE[] = 'nfcHome';
constant char CALENDAR_PAGE[] = 'rmsSchedulingPage';
constant char ROOM_STATUS_PAGE[] = 'roomStatus';

// Popups
constant char MEETING_INFO_VIEW_NAME[] = 'rmsMeetingInfoCard';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = 'rmsAvailabilityGuide';
constant char NFC_USER_WELCOME_VIEW_NAME[] = 'nfcUserWelcome';
constant char NFC_RESERVE_FAIL_VIEW_NAME[] = 'nfcFeedbackFail';
constant char NFC_RESERVE_REQUESTING_VIEW_NAME[] = 'nfcFeedbackRequesting';
constant char NFC_RESERVE_SUCCESS_VIEW_NAME[] = 'nfcFeedbackSuccess';
constant char NFC_BOOK_NEXT_VIEW_NAME[] = 'nfcBookNext';
constant char NFC_BOOK_NOW_VIEW_NAME[] = 'nfcBookNow';
constant char RMS_MEETING_DETAILS_VIEW_NAME[] = 'rmsMeetingDetails';
constant char RMS_MEETING_DOES_NOT_EXIST_VIEW_NAME[] = 'rmsMeetingDoesNotExist';
constant char RMS_MESSAGE_VIEW_NAME[] = 'rmsMessage';

constant long AUTO_LOGOUT_TL = 1;

volatile locationInfo uiLocation;

volatile integer activeUser;

volatile char lastBookingRequestDate[10];
volatile char lastBookingRequestTime[8];


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

	select {

		// We've got a new user signed on
		active (activeUser && activeUser != lastUser): {
			updateUserInfoView(activeUser);

			showPopupEx(dvTpBase, NFC_USER_WELCOME_VIEW_NAME, NFC_HOME_PAGE);

			// If we've got time for a 'meet now' before the next meeting give
			// the option, otherwise just skip straight to the calendar
			if ((uiLocation.nextBooking.minutesUntilStart > MEET_NOW_TIME ||
					!uiLocationHasMoreBookings()) &&
					!uiLocation.isInUse) {
				showPopupEx(dvTpBase, NFC_BOOK_NOW_VIEW_NAME, NFC_HOME_PAGE);
			} else {
				showPopupEx(dvTpBase, NFC_BOOK_NEXT_VIEW_NAME, NFC_HOME_PAGE);
			}

			setPageAnimated(dvTpBase, NFC_HOME_PAGE, 'fade', 0, 1);
		}

		// The same user is still logged in
		active (activeUser): {
			// Nothing to see here. User may be browsing on the
			// rmsSchedulingPage so we'll just leave them alone.
		}

		// Nobody is around or seems to care to just show the room status info
		active (1): {
			showPopupEx(dvTpBase, AVAILABILITY_GUIDE_VIEW_NAME, ROOM_STATUS_PAGE);

			// Show the meeting info card if there's any data of interest
			select {

				active (uiLocation.isInUse): {
					updateMeetingInfoView(uiLocation.activeBooking, false);
					showPopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, ROOM_STATUS_PAGE);
				}

				active (!uiLocation.isInUse && !uiLocationHasMoreBookings()): {
					hidePopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, ROOM_STATUS_PAGE);
				}

				active (!uiLocation.isInUse): {
					updateMeetingInfoView(uiLocation.nextBooking, true);
					showPopupEx(dvTpBase, MEETING_INFO_VIEW_NAME, ROOM_STATUS_PAGE);
				}
			}

			setPageAnimated(dvTpBase, ROOM_STATUS_PAGE, 'fade', 0, 2);
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
	stack_var char nameParts[5][50];

	explode(' ', getUserName(userId), nameParts, 3);

	setButtonText(dvTp, NFC_USER_WELCOME_VIEW_ADDRESS,
			"'Welcome, ', nameParts[1]");

	setButtonImage(dvTp, NFC_USER_IMAGE_VIEW_ADDRESS,
			"'profile-', getUserName(userId), '.jpg'");
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

	RmsSetDefaultEventBookingSubject(getAdHocBookingSubject(activeUser));
	RmsSetDefaultEventBookingBody(getAdHocBookingDetails(activeUser));

	redraw();

	restartAutoLogOutTimer();
}

/**
 * Deauth any currently logged in users.
 */
define_function logout() {
	activeUser = 0;

	// Tidy up any of the old status / meeting create popups from the seesion
	hidePopupEx(dvTpBase, NFC_RESERVE_REQUESTING_VIEW_NAME, NFC_HOME_PAGE);
	hidePopupEx(dvTpBase, RMS_MEETING_DETAILS_VIEW_NAME, CALENDAR_PAGE);

	redraw();
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
	return !((uiLocation.nextBooking.bookingId == uiLocation.activeBooking.bookingId) ||
			uiLocation.nextBooking.bookingId = '');
}


/**
 * Requests an ad-hoc meeting reservation for the active user.
 *
 * @param	startDate		the meeting start date (LDATE format)
 * @param	startTime		the meeting start time (TIME format)
 * @param	length			the meeting length in minutes
 */
define_function createAdHocBooking(char startDate[10],
		char startTime[8],
		integer length) {
	if (!activeUser) {
		return;
	}

	RmsBookingCreate(startDate,
			startTime,
			length,
			getAdHocBookingSubject(activeUser),
			getAdHocBookingDetails(activeUser),
			locationTracker.location.id);

	lastBookingRequestDate = startDate

	// This is required as all booking responses will come back with the seconds
	// at 00 which will screw up our string matching.
	lastBookingRequestTime = "left_string(startTime, 6), '00'";
}

/**
 * Restarts the auto-logout timer.
 */
define_function restartAutoLogOutTimer() {
	stack_var long times[1];
	
	times[1] = AUTO_LOGOUT_DELAY * 1000;
	
	if (timeline_active(AUTO_LOGOUT_TL)) {
		timeline_kill(AUTO_LOGOUT_TL);
	}
	
	timeline_create(AUTO_LOGOUT_TL, times, 1, TIMELINE_ABSOLUTE, TIMELINE_ONCE);
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

		// Make sure(ish) that this a response to something that was requested
		// from this UI.
		if (activeUser &&
				eventBookingResponse.startTime == lastBookingRequestTime &&
				eventBookingResponse.startDate == lastBookingRequestDate) {
			if (eventBookingResponse.isSuccessful) {
				showPopupEx(dvTpBase, NFC_RESERVE_SUCCESS_VIEW_NAME, NFC_HOME_PAGE);
			} else {
				showPopupEx(dvTpBase, NFC_RESERVE_FAIL_VIEW_NAME, NFC_HOME_PAGE);
			}
		}
		
		if (eventBookingResponse.isSuccessful) {
			// This need to be handled seperately to allow the functionality
			// provided by the stock UI to also shoot of confirmation emails.
			// Unfortunately this also means that if a user is currently authed
			// and a booking is made form another panel on this same client
			// for the same location (e.g. an in room panel) the user will get
			// a confirmation email.
			// FIXME
			if (activeUser) {
				sendBookingConfirmation(activeUser, eventBookingResponse);
			}

			// Update the active meeting info if the booking is for now
			if (eventBookingResponse.startDate == LDATE &&
					!timeIsInFuture(eventBookingResponse.startTime)) {
				setActiveMeetingInfo(eventBookingResponse);
			}
		}
	}
}


// NFC callbacks

define_function NfcTagRead(integer tagType, char uid[], integer uidLength) {
	if (!activeUser) {

		// Check for an updated users.txt 
		if (!getUserIdFromNfcUid(uid)) {
			loadSystemUsersFromFile('users.txt');
		}
	
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
		logout();
		setOnline(false);
	}

}

data_event[dvTp] {

	online: {
		setOnline([vdvRMS, RMS_CHANNEL_CLIENT_REGISTERED]);
	}

	offline: {
		logout();
	}

}

button_event[dvTp, NFC_LOGOUT_VIEW_ADDRESS] {

	push: {
		logout();
	}

}

button_event[dvTp, NFC_MEET_NOW_VIEW_ADDRESS] {

	push: {
		createAdHocBooking(LDATE,
				TIME,
				MEET_NOW_TIME);
	}

}

button_event[dvTp, NFC_BOOK_NEXT_VIEW_ADDRESS] {

	push: {
		createAdHocBooking(uiLocation.activeBooking.endDate,
				nextMinute(uiLocation.activeBooking.endTime),
				MEET_NOW_TIME);
	}

}

button_event[dvTp, 0] {

	push: {
		restartAutoLogOutTimer();
	}

}

// This is super, super hacky but will make sure that interactions with the
// stock Rms Gui module control elements also reset the timer. If you are
// reading this / having to deal with any consequences of it, sorry. I'll buy
// you a beer some time.
button_event[dvTp.number:9:dvTp.system, 0] {

	push: {
		restartAutoLogOutTimer();
	}

}

timeline_event[AUTO_LOGOUT_TL] {
	if (activeUser) {
		logout();
	}
}
