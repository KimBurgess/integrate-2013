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


#INCLUDE 'TPUtil'
#INCLUDE 'TimeUtil'
#INCLUDE 'RmsEventListener'
#INCLUDE 'RmsSchedulingApi'
#INCLUDE 'RmsSchedulingEventListener'
#INCLUDE 'RmsEventListenerAux'
#INCLUDE 'User'


define_type

structure locationInfo {
	long id;
	char isAvailable;
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

constant char MEETING_INFO_VIEW_NAME[] = '_rmsMeetingInfo';
constant char IN_USE_INDICATOR_VIEW_NAME[] = '_rmsInUseIndicator';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = '_rmsAvailabilityGuide';
constant char CALENDAR_VIEW_NAME[] = '_rmsCalendar';
constant char NFC_TOUCH_ON_VIEW_NAME[] = 'nfcTouchOn';

constant long TL_BOOKING_INFO_POLL = 1;

volatile char tpClientKey[50];

volatile locationInfo uiLocation;

volatile userData activeUser



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

		active (userIsNull(activeUser) && uiLocation.isAvailable): {
			updateMeetingInfoView(uiLocation.nextBooking, true);
			
			hidePopup(dvTp, CALENDAR_VIEW_NAME);
			
			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, MEETING_INFO_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}

		active (userIsNull(activeUser) && !uiLocation.isAvailable): {
			updateMeetingInfoView(uiLocation.activeBooking, false);

			hidePopup(dvTp, CALENDAR_VIEW_NAME);

			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, MEETING_INFO_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}

		active (1): {
			hidePopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			hidePopup(dvTp, MEETING_INFO_VIEW_NAME);
			hidePopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);

			showPopup(dvTp, CALENDAR_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			// TODO show user image
			// TODO show user welcome
		}

	}
}

/**
 * Updates the meeting details card on the touch panel.
 *
 * @param	booking			an RmsEventBookingResponse containing the booking
 *							data.
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
 * @param	isAvailable		a boolean, true if the room should show as available
 */
define_function setAvailable(char isAvailable) {
	uiLocation.isAvailable = isAvailable;
	render();
}

/**
 * Sets the active meeting info for the touch pane location.
 *
 * @param	booking		an RmsEventBookingResponse containing the active meeting
 *						data
 */
define_function setActiveMeetingInfo(RmsEventBookingResponse booking) {
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
		setAvailable(false);
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
		setAvailable(false);
	}
}

define_function RmsEventSchedulingEventEnded(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setAvailable(true);
	}
}

define_function RmsEventSchedulingEventStarted(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == uiLocation.id) {
		setAvailable(false);
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




#WARN 'Temporary render() trigger for debugging'
define_event
button_event[dvTp,999] {
	push: render();
}
