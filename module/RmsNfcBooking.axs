MODULE_NAME='RmsNfcBooking'(dev vdvRMS, dev dvTp, dev dvTpBase, integer tempLocationId, char tempLocationName[50])


#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK
#DEFINE INCLUDE_NFC_TAG_READ_CALLBACK


#INCLUDE 'TPUtil'
#INCLUDE 'string'
#INCLUDE 'RmsBookingUserAssociation'
#INCLUDE 'RmsAssetLocationTracker'
#INCLUDE 'RmsSchedulingEventListener'
#INCLUDE 'NfcListener'


define_variable

constant char NFC_PAGE_NAME[] = 'nfcAuthed';
constant char RMS_PAGE_NAME[] = 'rmsSchedulingPage';

constant char CALENDAR_VIEW_NAME[] = 'rmsCalendar';

volatile UserData activeUser;


/**
 * Initialise module variables that can be assisgned at compile time.
 */
define_function init() {
	setLocationTrackerAsset(RmsDevToString(dvTpBase));
}

define_function redraw() {
	select {
	
		// someone nobody logged in
		active (userIsNull(activeUser)): {
			setPageAnimated(dvTpBase, RMS_PAGE_NAME, 'fade', 0, 2);
		}
	
		// we have an authed user
		active (!userIsNull(activeUser)): {
			setPageAnimated(dvTpBase, NFC_PAGE_NAME, 'fade', 0, 2);
			showPopup(dvTpBase, CALENDAR_VIEW_NAME, NFC_PAGE_NAME);
		}
	
	}
}

define_function authenticate(char uid[]) {
	stack_var UserData testUser;

	testUser.uid = '1234';
	testUser.name = 'Kim Burgess';
	testUser.email = 'kim.burgess@amxaustralia.com.au';

	activeUser = testUser;

	redraw();
}

define_function logout() {
	activeUser = nullUser;

	redraw();
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
	
	RmsEmail(user.email, subject, msg, '', '');
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


// NFC callbacks

define_function NfcTagRead(integer tagType, char uid[], integer uidLength) {
	if (userIsNull(activeUser)) {
		authenticate(uid);
	}
}


define_start

init();


define_event

button_event[dvTp, 1] {

	push: {
		logout();
	}

}