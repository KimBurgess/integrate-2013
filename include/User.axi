PROGRAM_NAME='User'


define_type

structure userData {
	char uid[64];
	char firstName[32];
	char lastName[32];
	char email[128];
}


define_variable

volatile userData nullUser;


/**
 * Compares two userData objects for equality.
 *
 * @param	user1
 * @param	user2
 * @return				a boolean, true if user1 is equivalent to user2
 */
define_function char userEqual(userData user1, userData user2) {
	return user1.uid == user2.uid &&
			user1.firstName == user2.firstName &&
			user1.lastName == user2.lastName &&
			user1.email == user2.email;
}

/**
 * Check if a userData object is null.
 *
 * @param	user		the userData variable to check
 * @return				a boolean, true if user is null
 */
define_function char userIsNull(userData user) {
	return userEqual(user, nullUser);
}
