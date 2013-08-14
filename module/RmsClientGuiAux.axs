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


define_variable

constant integer NEXT_MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer NEXT_MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer NEXT_MEETING_TIME_VIEW_ADDRESS = 3;
constant integer NEXT_MEETING_TIME_UNTIL_START_VIEW_ADDRESS = 4;
constant integer NEXT_MEETING_DETAILS_VIEW_ADDREss = 5;
constant integer ACTIVE_MEETING_SUBJECT_VIEW_ADDRESS = 11;
constant integer ACTIVE_MEETING_ORGANISER_VIEW_ADDRESS = 12;
constant integer ACTIVE_MEETING_TIME_VIEW_ADDRESS = 13;
constant integer ACTIVE_MEETING_TIME_REMAINING_VIEW_ADDRESS = 14;
constant integer ACTIVE_MEETING_DETAILS_VIEW_ADDREss = 15;

constant char ACTIVE_MEETING_INFO_VIEW_NAME[] = '_rmsActiveMeetingInfo';
constant char NEXT_MEETING_INFO_VIEW_NAME[] = '_rmsNextMeetingInfo';
constant char IN_USE_INDICATOR_VIEW_NAME[] = '_rmsInUseIndicator';
constant char AVAILABILITY_GUIDE_VIEW_NAME[] = '_rmsAvailabilityGuide';
constant char CALENDAR_VIEW_NAME[] = '_rmsCalendar';
constant char NFC_TOUCH_ON_VIEW_NAME[] = 'nfcTouchOn';

constant long TL_BOOKING_INFO_POLL = 1;

volatile char tpClientKey[50];
volatile long locationId = 0;

volatile char locationIsAvailable;

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
	
		active (userIsNull(activeUser) && locationIsAvailable): {
			hidePopup(dvTp, CALENDAR_VIEW_NAME);
			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, NEXT_MEETING_INFO_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}
		
		active (userIsNull(activeUser) && !locationIsAvailable): {
			hidePopup(dvTp, CALENDAR_VIEW_NAME);
			showPopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			showPopup(dvTp, ACTIVE_MEETING_INFO_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			showPopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
		}
		
		active (1): {
			hidePopup(dvTp, IN_USE_INDICATOR_VIEW_NAME);
			hidePopup(dvTp, ACTIVE_MEETING_INFO_VIEW_NAME);
			hidePopup(dvTp, NFC_TOUCH_ON_VIEW_NAME);
			showPopup(dvTp, CALENDAR_VIEW_NAME);
			showPopup(dvTp, AVAILABILITY_GUIDE_VIEW_NAME);
			// TODO show user image
			// TODO show user welcome
		}
	
	}
}

/**
 * Updates the 'next meeting' info on the touch panel.
 *
 * @param		booking		an RmsEventBookingResponse containing the booking
 *							data.
 */
define_function updateNextMeetingDetails(RmsEventBookingResponse booking) {
	setButtonText(dvTp, NEXT_MEETING_SUBJECT_VIEW_ADDRESS, booking.subject);
	setButtonText(dvTp, NEXT_MEETING_ORGANISER_VIEW_ADDRESS, booking.organizer);
	setButtonText(dvTp, NEXT_MEETING_TIME_VIEW_ADDRESS,
			"time12Hour(booking.startTime), ' - ', time12Hour(booking.endTime)");
	setButtonText(dvTp, NEXT_MEETING_TIME_UNTIL_START_VIEW_ADDRESS,
			"'Starts ', fuzzyTime(booking.minutesUntilStart)");
	setButtonText(dvTp, NEXT_MEETING_DETAILS_VIEW_ADDREss, booking.details);
}

/**
 * Updates the 'current meeting' info on the touch panel.
 *
 * @param		booking		an RmsEventBookingResponse containing the booking
 *							data.
 */
define_function updateActiveMeetingDetails(RmsEventBookingResponse booking) {
	setButtonText(dvTp, ACTIVE_MEETING_SUBJECT_VIEW_ADDRESS, booking.subject);
	setButtonText(dvTp, ACTIVE_MEETING_ORGANISER_VIEW_ADDRESS, booking.organizer);
	setButtonText(dvTp, ACTIVE_MEETING_TIME_VIEW_ADDRESS,
			"time12Hour(booking.startTime), ' - ', time12Hour(booking.endTime)");
	setButtonText(dvTp, ACTIVE_MEETING_TIME_REMAINING_VIEW_ADDRESS,
			"'Ends ', fuzzyTime(booking.remainingMinutes)");
	setButtonText(dvTp, ACTIVE_MEETING_DETAILS_VIEW_ADDREss, booking.details);
}

/**
 * Sets the room available state.
 *
 * @param	isAvailable		a boolean, true if the room should show as available
 */
define_function setAvailable(char isAvailable) {
	locationIsAvailable = isAvailable;
	render();
}


// RMS callbacks

define_function RmsEventSchedulingNextActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationId) {
		updateNextMeetingDetails(eventBookingResponse);
	}
}

define_function RmsEventSchedulingActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationId) {
		updateActiveMeetingDetails(eventBookingResponse);
		setAvailable(false);
	}
}

define_function RmsEventSchedulingNextActiveUpdated(char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationId) {
		updateNextMeetingDetails(eventBookingResponse);
	}
}

define_function RmsEventSchedulingActiveUpdated(char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationId) {
		updateActiveMeetingDetails(eventBookingResponse);
		setAvailable(false);
	}
}

define_function RmsEventSchedulingEventEnded(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationId) {
		setAvailable(true);
	}
}

define_function RmsEventSchedulingEventStarted(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location == locationId) {
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
		locationId = newLocationId;
	}
}

define_function RmsEventAssetLocation(char assetClientKey[], RmsLocation location) {
	/*if (assetClientKey == tpClientKey) {
		locationId = location.id;
	}*/
	#WARN 'As we cannot currently associate an ?ASSET.LOCATION response with a device this is a hard coded hack'
	locationId = initialLocation;
}


define_start

init();




#WARN 'Temporary render() trigger for debugging'
define_event
button_event[dvTp,999] {
	push: render();
}
