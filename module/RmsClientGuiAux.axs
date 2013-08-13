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


define_variable

constant integer NEXT_MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer NEXT_MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer NEXT_MEETING_START_TIME_VIEW_ADDRESS = 3;
constant integer NEXT_MEETING_END_TIME_VIEW_ADDRESS = 4;
constant integer NEXT_MEETING_TIME_UNTIL_START_VIEW_ADDRESS = 5;
constant integer NEXT_MEETING_DETAILS_VIEW_ADDREss = 6;
constant integer CURRENT_MEETING_SUBJECT_VIEW_ADDRESS = 11;
constant integer CURRENT_MEETING_ORGANISER_VIEW_ADDRESS = 12;
constant integer CURRENT_MEETING_START_TIME_VIEW_ADDRESS = 13;
constant integer CURRENT_MEETING_END_TIME_VIEW_ADDRESS = 14;
constant integer CURRENT_MEETING_TIME_REMAINING_VIEW_ADDRESS = 15;
constant integer CURRENT_MEETING_DETAILS_VIEW_ADDREss = 16;

constant char ACTIVE_MEETING_INFO[] = '_rmsActiveMeetingInfo';
constant char NEXT_MEETING_INFO[] = '_rmsNextMeetingInfo';

volatile char tpClientKey[50];
volatile long locationId = 0;



/**
 * Initialise module variables that can be assisgned at compile time.
 */
define_function init() {
	tpClientKey = RmsDevToString(dvTpBase);
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
	setButtonText(dvTp, NEXT_MEETING_START_TIME_VIEW_ADDRESS, booking.startTime);
	setButtonText(dvTp, NEXT_MEETING_END_TIME_VIEW_ADDRESS, booking.endTime);
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
define_function updateCurrentMeetingDetails(RmsEventBookingResponse booking) {
	setButtonText(dvTp, CURRENT_MEETING_SUBJECT_VIEW_ADDRESS, booking.subject);
	setButtonText(dvTp, CURRENT_MEETING_ORGANISER_VIEW_ADDRESS, booking.organizer);
	setButtonText(dvTp, CURRENT_MEETING_START_TIME_VIEW_ADDRESS, booking.startTime);
	setButtonText(dvTp, CURRENT_MEETING_END_TIME_VIEW_ADDRESS, booking.endTime);
	setButtonText(dvTp, NEXT_MEETING_TIME_UNTIL_START_VIEW_ADDRESS,
			"'Ends ', fuzzyTime(booking.remainingMinutes)");
	setButtonText(dvTp, CURRENT_MEETING_DETAILS_VIEW_ADDREss, booking.details);
}

define_function setAvailable(char isAvailable) {
	if (isAvailable) {
		showPopup(dvTp, NEXT_MEETING_INFO);
	} else {
		showPopup(dvTp, ACTIVE_MEETING_INFO);
	}
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
		updateCurrentMeetingDetails(eventBookingResponse);
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
		updateCurrentMeetingDetails(eventBookingResponse);
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
	locationId = initialLocation
}


define_start

init();
