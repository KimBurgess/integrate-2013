PROGRAM_NAME='User'


define_type

structure UserData {
	char uid[64];
	char name[64];
	char email[256];
}


define_variable

volatile UserData nullUser;


/**
 * Compares two userData objects for equality.
 *
 * @param	user1
 * @param	user2
 * @return				a boolean, true if user1 is equivalent to user2
 */
define_function char userIsEqual(UserData user1, UserData user2) {
	return user1.uid == user2.uid &&
			user1.name == user2.name &&
			user1.email == user2.email;
}

/**
 * Check if a userData object is null.
 *
 * @param	user		the userData variable to check
 * @return				a boolean, true if user is null
 */
define_function char userIsNull(userData user) {
	return userIsEqual(user, nullUser);
}
