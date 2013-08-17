MODULE_NAME='RmsNfcBooking'(dev vdvRMS, dev dvTp, dev dvTpBase, long initialLocation)


#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK


#INCLUDE 'TPUtil'
#INCLUDE 'RmsBookingUserAssociation'
#INCLUDE 'RmsAssetLocationTracker'
#INCLUDE 'RmsSchedulingEventListener'


define_variable

volatile UserData activeUser;


/**
 * Initialise module variables that can be assisgned at compile time.
 */
define_function init() {
	setLocationTrackerAsset(RmsDevToString(dvTpBase));
}

define_function sendBookingConfirmation(char emailAddress[],
		RmsEventBookingResponse booking) {
	RmsEmail(emailAddress,
			'RMS Room Booking Confirmation',
			"'This is some placeholder text. But I can tell you your booking was called: ', booking.subject, '.'",
			'',
			'');
}


// RMS callbacks

define_function RmsEventSchedulingCreateResponse(char isDefaultLocation,
		char responseText[],
		RmsEventBookingResponse eventBookingResponse) {
	if (eventBookingResponse.location = locationTracker.locationId) {

		if (eventBookingResponse.isSuccessful && !userIsNull(activeUser)) {
			sendBookingConfirmation(activeUser.email, eventBookingResponse);
		}

	}
}


define_start

init();
