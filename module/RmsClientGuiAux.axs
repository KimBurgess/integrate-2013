MODULE_NAME='RmsClientGuiAux'(dev vdvRMS, dev dvTp, dev dvTpBase, integer initialLocation)


#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_RMS_EVENT_ASSET_REGISTERED_CALLBACK
#DEFINE INCLUDE_RMS_EVENT_ASSET_RELOCATED_CALLBACK
#DEFINE INCLUDE_RMS_EVENT_ASSET_LOCATION_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_ENDED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_STARTED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK


#INCLUDE 'TPUtil'
#INCLUDE 'TimeUtil'
#INCLUDE 'string'
#INCLUDE 'RmsEventListener'
#INCLUDE 'RmsSchedulingApi'
#INCLUDE 'RmsSchedulingEventListener'
#INCLUDE 'RmsEventListenerAux'
#INCLUDE 'User'


define_type

structure locationInfo {
	long id;
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

constant char MEETING_INFO_VIEW_NAME[] = 'rmsMeetingInfoCard';
constant char IN_USE_INDICATOR_VIEW_NAME[] = 'rmsInUseIndicator';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = 'rmsAvailabilityGuide';
constant char CALENDAR_VIEW_NAME[] = 'rmsCalendar';
constant char NFC_TOUCH_ON_VIEW_NAME[] = 'nfcTouchOn';

constant char NFC_BOOKING_NAME_PLACEHOLDER[] = '<name>';
constant char NFC_BOOKING_DESCRIPTION_EXTERNAL[] = 'Ad-hoc meeting created by <name> from the touch panel.';
constant char NFC_BOOKING_DESCRIPTION_INTERNAL[] = 'Ad-hoc meeting';

constant long TL_BOOKING_INFO_POLL = 1;

volatile char tpClientKey[50];

volatile locationInfo uiLocation;

volatile userData activeUser;



/**
 * Initialise module variables that can be assisgned at compile time.
 */
define_function init() {
	tpClientKey = RmsDevToString(dvTpBase);
}

/**
 * Render the appropriate popups and page elements for the current system state.
 */
define_function render() {
	select {

		active (userIsNull(activeUser) && uiLocation.isInUse): {
			updateMeetingInfoView(uiLocation.activeBooking, false);

			hidePopup(dvTp, CALENDAR_VIEW_NAME);

			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, MEETING_INFO_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}

		active (userIsNull(activeUser) &&
				!uiLocation.isInUse &&
				uiLocation.nextBooking.bookingId == uiLocation.activeBooking.bookingId): {
			hidePopup(dvTp, CALENDAR_VIEW_NAME);
			hidePopup(dvTp, MEETING_INFO_VIEW_NAME);
			
			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}

		active (userIsNull(activeUser) && !uiLocation.isInUse): {
			updateMeetingInfoView(uiLocation.nextBooking, true);
			
			hidePopup(dvTp, CALENDAR_VIEW_NAME);
			
			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, MEETING_INFO_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}

		active (1): {
			hidePopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			hidePopup(dvTp, MEETING_INFO_VIEW_NAME);
			hidePopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			hidePopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);

			showPopup(dvTp, CALENDAR_VIEW_NAME);
			// TODO nuke all this from here and just show the calendar popup
			// as a component of the NFC login process
			
			// TODO show user image
			// TODO show user welcome
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

define_function sendBookingConfirmation(char emailAddress[],
		RmsEventBookingResponse booking) {
	RmsEmail(emailAddress,
			'RMS Room Booking Confirmation',
			"'This is some placeholder text. But I can tell you your booking was called: ', booking.subject, '.'",
			'',
			'');
}

/**
 * Extract the addition RMS user information that is iserted into a booking
 * description for reservations made with an NFC card.
 *
 * WARNING: as RMS cannot return type this function has a side effect on the
 * passed booking object.
 *
 * @param	booking			an RmsEventBookingResponse containing the booking
 *							data
 * @return					a boolean, true if a user was extracted
 */
define_function char extractRmsUser(RmsEventBookingResponse booking) {
	stack_var char left[256];
	stack_var char right[256];
	stack_var char name[64];

	left = string_get_key(NFC_BOOKING_DESCRIPTION_EXTERNAL,
			NFC_BOOKING_NAME_PLACEHOLDER);
	right = string_get_value(NFC_BOOKING_DESCRIPTION_EXTERNAL,
			NFC_BOOKING_NAME_PLACEHOLDER);
	name = string_get_between(booking.details, left, right);

	if (name == '') {
		return false;
	}
	
	booking.organizer = name;
	booking.details = NFC_BOOKING_DESCRIPTION_INTERNAL;

	return true;
}

/**
 * Sets the room available state.
 *
 * @param	isInUse		a boolean, true if the room is in use
 */
define_function setInUse(char isInUse) {
	uiLocation.isInUse = isInUse;
	render();
}

/**
 * Sets the active meeting info for the touch pane location.
 *
 * @param	booking		an RmsEventBookingResponse containing the active meeting
 *						data
 */
define_function setActiveMeetingInfo(RmsEventBookingResponse booking) {
	extractRmsUser(booking);
	uiLocation.activeBooking = booking;
	render();
}

/**
 * Sets the next meeting info for the touch panel location.
 *
 * @param	booking		an RmsEventBookingResponse containing the next meeting
 *						data
 */
define_function setNextMeetingInfo(RmsEventBookingResponse booking) {
	extractRmsUser(booking);
	uiLocation.nextBooking = booking;
	render();
}


// RMS callbacks

define_function RmsEventSchedulingNextActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setNextMeetingInfo(eventBookingResponse);
	}
}

define_function RmsEventSchedulingActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setActiveMeetingInfo(eventBookingResponse);
		setInUse(true);
	}
}

define_function RmsEventSchedulingNextActiveUpdated(char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setNextMeetingInfo(eventBookingResponse);
	}
}

define_function RmsEventSchedulingActiveUpdated(char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setActiveMeetingInfo(eventBookingResponse);
		setInUse(true);
	}
}

define_function RmsEventSchedulingEventEnded(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setInUse(false);
	}
}

define_function RmsEventSchedulingEventStarted(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setInUse(true);
	}
}

define_function RmsEventSchedulingCreateResponse(char isDefaultLocation,
		char responseText[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location = uiLocation.id) {
	
		if (eventBookingResponse.isSuccessful && !userIsNull(activeUser)) {
			sendBookingConfirmation(activeUser.email, eventBookingResponse);
		}

	// TODO as this fires waaaaaay before any of the next meeting update
	// events check if this replaces the next active event and update the UI
	// accordingly.
	}
}

define_function RmsEventAssetRegistered(char registeredAssetClientKey[],
		long assetId,
		char newAssetRegistration) {
	if (registeredAssetClientKey == tpClientKey) {
		RmsAssetLocationRequest(tpClientKey)
	}
}

define_function RmsEventAssetRelocated(char assetClientKey[],
		long assetId,
		long newLocationId) {
	if (assetClientKey == tpClientKey) {
		uiLocation.id = newLocationId;
	}
}

define_function RmsEventAssetLocation(char assetClientKey[], RmsLocation location) {
	/*if (assetClientKey == tpClientKey) {
		uiLocation.id = location.id;
	}*/
	#WARN 'As we cannot currently associate an ?ASSET.LOCATION response with a device this is a hard coded hack'
	uiLocation.id = initialLocation;
}


define_start

init();


define_event

data_event[dvTp] {

	online: {
		render();
	}

}




#WARN 'Temporary render() trigger for debugging'
define_event
button_event[dvTp,999] {
	push: render();
}
