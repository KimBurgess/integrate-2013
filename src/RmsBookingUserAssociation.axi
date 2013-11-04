PROGRAM_NAME='RmsBookingUserAssociation'


#IF_NOT_DEFINED __RMS_BOOKING_USER_ASSOCIATION__
#DEFINE __RMS_BOOKING_USER_ASSOCIATION__


#INCLUDE 'User'
#INCLUDE 'string'
#INCLUDE 'RmsSchedulingApi'


define_variable

constant char NFC_BOOKING_NAME_PLACEHOLDER[] = '<name>';
constant char NFC_BOOKING_SUBJECT_EXTERNAL[] = '<name> (ad-hoc meeting)';
constant char NFC_BOOKING_SUBJECT_INTERNAL[] = 'Ad-hoc meeting';
constant char NFC_BOOKING_DESCRIPTION[] = 'Ad-hoc meeting created from touch panel booking system.';


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
	stack_var integer start;
	stack_var integer end;
	stack_var char name[64];

	if (!bookingHasUserEmbedded(booking)) {
		return false;
	}

	start = find_string(NFC_BOOKING_SUBJECT_EXTERNAL,
			NFC_BOOKING_NAME_PLACEHOLDER,
			1);
	end = length_string(booking.subject) + 1 -
			find_string(string_reverse(NFC_BOOKING_SUBJECT_EXTERNAL),
					string_reverse(NFC_BOOKING_NAME_PLACEHOLDER),
					1);
	name = mid_string(booking.subject,
			start,
			end - start + 1);

	booking.organizer = name;
	booking.subject = NFC_BOOKING_SUBJECT_INTERNAL;

	return true;
}

/**
 * Check to see if an RmsEventBookingResponse has embedded user details.
 *
 * @param	booking			the RmsEventBookingResponse to check
 * @return					a boolean, true if there's something of interest
 */
define_function char bookingHasUserEmbedded(RmsEventBookingResponse booking) {
	// FIXME This is a little hacky as it will break if we change the format of 
	// NFC_BOOKING_SUBJECT_EXTERNAL however it will get us up and going for the
	// show.
	if (find_string(booking.subject,
			string_replace(NFC_BOOKING_SUBJECT_EXTERNAL, NFC_BOOKING_NAME_PLACEHOLDER, ''),
			1)) {
		return true;
	} else {
		return false;
	}
}

/**
 * Gets the contents of a subject field to use when creating ad-hoc bookings.
 *
 * @param	userId			the system user id to associate with the booking
 * @return					a string to use in the subject for the booking
 *							request
 */
define_function char[250] getAdHocBookingSubject(integer userId) {
	return string_replace(NFC_BOOKING_SUBJECT_EXTERNAL,
			NFC_BOOKING_NAME_PLACEHOLDER,
			getUserName(userId));
}

/**
 * Gets the contents of a details field to use when creating ad-hoc bookings.
 *
 * @param	userId			the system user id to associate with the booking
 * @return					a string to use in the details for the booking
 *							request
 */
define_function char[250] getAdHocBookingDetails(integer userId) {
	return NFC_BOOKING_DESCRIPTION;
}

#END_IF // __RMS_BOOKING_USER_ASSOCIATION__
