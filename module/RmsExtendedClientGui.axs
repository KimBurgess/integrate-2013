MODULE_NAME='RmsExtendedClientGui'(dev vdvRMS, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_ENDED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_STARTED_CALLBACK


#INCLUDE 'TPUtil'
#INCLUDE 'TimeUtil'
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

constant integer MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer MEETING_TIME_VIEW_ADDRESS = 3;
constant integer MEETING_TIME_DELTA_VIEW_ADDRESS = 4;
constant integer MEETING_DETAILS_VIEW_ADDREss = 5;
constant integer MEETING_HEADER_VIEW_ADDREss = 6;

constant char RMS_SCHEDULING_PAGE[] = 'rmsSchedulingPage';
constant char MEETING_INFO_VIEW_NAME[] = 'rmsMeetingInfoCard';
constant char IN_USE_INDICATOR_VIEW_NAME[] = 'rmsInUseIndicator';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = 'rmsAvailabilityGuide';
constant char CALENDAR_VIEW_NAME[] = 'rmsCalendar';
constant char NFC_TOUCH_ON_VIEW_NAME[] = 'nfcTouchOn';

volatile locationInfo uiLocation;


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

		// Active meeting
		active (uiLocation.isInUse): {
			updateMeetingInfoView(uiLocation.activeBooking, false);

			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME, RMS_SCHEDULING_PAGE);
		}

		// No meeting and no more bookings in the calendar
		active (!uiLocation.isInUse &&
				uiLocation.nextBooking.bookingId == uiLocation.activeBooking.bookingId): {
			hidePopup(dvTp, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);

			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME, RMS_SCHEDULING_PAGE);
		}

		// Room available
		active (!uiLocation.isInUse): {
			updateMeetingInfoView(uiLocation.nextBooking, true);

			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, MEETING_INFO_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME, RMS_SCHEDULING_PAGE);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME, RMS_SCHEDULING_PAGE);
		}

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


define_start

init();


define_event

data_event[dvTp] {

	online: {
		redraw();
	}

}
