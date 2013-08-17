MODULE_NAME='RmsNfcBooking'(dev vdvRMS, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK


#INCLUDE 'TPUtil'
#INCLUDE 'string'
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
	
	RmsEmail(user.emailAddress, subject, msg, '', '');
}


// RMS callbacks

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


define_start

init();
