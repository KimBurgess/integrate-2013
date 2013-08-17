PROGRAM_NAME='RmsBookingUserAssociation'


#INCLUDE 'User'
#INCLUDE 'string'
#INCLUDE 'RmsSchedulingApi'


define_variable

constant char NFC_BOOKING_NAME_PLACEHOLDER[] = '<name>';
constant char NFC_BOOKING_DESCRIPTION_EXTERNAL[] = 'Ad-hoc meeting created by <name> from the touch panel.';
constant char NFC_BOOKING_DESCRIPTION_INTERNAL[] = 'Ad-hoc meeting';



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
define_function char extractUserDetails(RmsEventBookingResponse booking) {
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

define_function char insertUserDetails(RmsEventBookingResponse booking, UserData user) {
	// TODO inject user info into booking
	return false;
}
