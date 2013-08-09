MODULE_NAME='RmsClientGuiAux'(dev vdvRMS, dev dvTp, dev dvTpBase)


define_variable

constant integer NEXT_MEETING_SUBJECT_VIEW_ADDRESS = 1;
constant integer NEXT_MEETING_ORGANISER_VIEW_ADDRESS = 2;
constant integer NEXT_MEETING_START_TIME_VIEW_ADDRESS = 3;
constant integer NEXT_MEETING_END_TIME_VIEW_ADDRESS = 4;
constant integer NEXT_MEETING_DETAILS_VIEW_ADDREss = 5;
constant integer CURRENT_MEETING_SUBJECT_VIEW_ADDRESS = 11;
constant integer CURRENT_MEETING_ORGANISER_VIEW_ADDRESS = 12;
constant integer CURRENT_MEETING_START_TIME_VIEW_ADDRESS = 13;
constant integer CURRENT_MEETING_END_TIME_VIEW_ADDRESS = 14;
constant integer CURRENT_MEETING_DETAILS_VIEW_ADDREss = 15;

volatile integer locationID = 0;


include 'TPUtil'
include 'RmsSchedulingApi'


#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
define_function RmsEventSchedulingNextActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	updateNextMeetingDetails(eventBookingResponse);
}

#DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
define_function RmsEventSchedulingActiveResponse(char isDefaultLocation,
		integer recordIndex,
		integer recordCount,
		char bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	updateCurrentMeetingDetails(eventBookingResponse);
}

#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_UPDATED_CALLBACK
define_function RmsEventSchedulingNextActiveUpdated(CHAR bookingId[],
		RmsEventBookingResponse eventBookingResponse) {
	amx_log(4, '****************')
	amx_log(4, "'Meeting subject: ', eventBookingResponse.subject")
	amx_log(4, '****************')
}

/**
 * Updates the 'next meeting' info on the touch panel.
 *
 * @param		booking		an RmsEventBookingResponse containing the booking
 *							data.
 */
define_function updateNextMeetingDetails(RmsEventBookingResponse booking) {
	setButtonText(dvTP, NEXT_MEETING_SUBJECT_VIEW_ADDRESS, booking.subject);
	setButtonText(dvTP, NEXT_MEETING_ORGANISER_VIEW_ADDRESS, booking.organizer);
	setButtonText(dvTP, NEXT_MEETING_START_TIME_VIEW_ADDRESS, booking.startTime);
	setButtonText(dvTP, NEXT_MEETING_END_TIME_VIEW_ADDRESS, booking.endTime);
	setButtonText(dvTP, NEXT_MEETING_DETAILS_VIEW_ADDREss, booking.details);
}

/**
 * Updates the 'current meeting' info on the touch panel.
 *
 * @param		booking		an RmsEventBookingResponse containing the booking
 *							data.
 */
define_function updateCurrentMeetingDetails(RmsEventBookingResponse booking) {
	setButtonText(dvTP, CURRENT_MEETING_SUBJECT_VIEW_ADDRESS, booking.subject);
	setButtonText(dvTP, CURRENT_MEETING_ORGANISER_VIEW_ADDRESS, booking.organizer);
	setButtonText(dvTP, CURRENT_MEETING_START_TIME_VIEW_ADDRESS, booking.startTime);
	setButtonText(dvTP, CURRENT_MEETING_END_TIME_VIEW_ADDRESS, booking.endTime);
	setButtonText(dvTP, CURRENT_MEETING_DETAILS_VIEW_ADDREss, booking.details);
}


include 'RmsSchedulingEventListener'


// TODO listen for RMS coonect / device register / location change

// TODO query with RmsBookingNextActiveRequest and locationId
