PROGRAM_NAME='User'


#IF_NOT_DEFINED __USER_AUTH__
#DEFINE __USER_AUTH__


#INCLUDE 'string'


define_constant

USER_MAX_USER_ACCOUNTS = 50;

USER_NFC_UID_MAX_LENGTH = 64;
USER_NAME_MAX_LENGTH = 64;
USER_EMAIL_MAX_LENGTH = 128;

define_type

structure UserData {
	char nfcUid[USER_NFC_UID_MAX_LENGTH];
	char name[USER_NAME_MAX_LENGTH];
	char email[USER_EMAIL_MAX_LENGTH];
}


define_variable

volatile userData systemUsers[USER_MAX_USER_ACCOUNTS];


/**
 * Compares two userData objects for equality.
 *
 * @param	user1
 * @param	user2
 * @return				a boolean, true if user1 is equivalent to user2
 */
define_function char userIsEqual(UserData user1, UserData user2) {
	return user1.nfcUid == user2.nfcUid &&
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
	stack_var userData nullUser;
	nullUser.nfcUid = '';
	nullUser.name = '';
	nullUser.email = '';
	return userIsEqual(user, nullUser);
}

/**
 * Check if an internal user id is valid.
 *
 * @param	id			the id to check
 # @return				a boolean, true if the user is found
 */
define_function char userExists(integer id) {
	if (!id) {
		return false;
	}
	return !userIsNull(systemUsers[id]);
}

/**
 * Get a user name for an internal user id.
 *
 * @param	id			the user id
 * @return				a string containing the user name
 */
define_function char[USER_NFC_UID_MAX_LENGTH] getUserNfcUid(integer id) {
	if (id > USER_MAX_USER_ACCOUNTS || id == 0) {
		return '';
	}

	return systemUsers[id].nfcUid;
}

/**
 * Get a user name for an internal user id.
 *
 * @param	id			the user id
 * @return				a string containing the user name
 */
define_function char[USER_NAME_MAX_LENGTH] getUserName(integer id) {
	if (id > USER_MAX_USER_ACCOUNTS || id == 0) {
		return '';
	}

	return systemUsers[id].name;
}

/**
 * Gets the email address for an internal user id.
 *
 * @param	id			the user id
 * @return				the users email address
 */
define_function char[USER_EMAIL_MAX_LENGTH] getUserEmail(integer id) {
	if (id > USER_MAX_USER_ACCOUNTS || id == 0) {
		return '';
	}

	return systemUsers[id].email;
}

/**
 * Gets the UID associated with a specified user name.
 *
 * @param	name		the user name to search for
 * @return				the users UID
 */
define_function integer getUserIdFromNfcUid(char nfcUid[USER_NFC_UID_MAX_LENGTH]) {
	stack_var integer id;

	for (id = 1; id <= USER_MAX_USER_ACCOUNTS; id++) {
		if (getUserNfcUid(id) == nfcUid) {
			return id;
		}
	}

	return 0;
}

/**
 * Gets the UID associated with a specified user name.
 *
 * Note: user names are assumed unique - which is bad, but will do for this
 * demo. If multi users have the same name this will return the first instance
 * found.
 *
 * @param	name		the user name to search for
 * @return				the users UID
 */
define_function integer getUserIdFromName(char name[USER_NAME_MAX_LENGTH]) {
	stack_var integer id;

	for (id = 1; id <= USER_MAX_USER_ACCOUNTS; id++) {
		if (getUserName(id) == name) {
			return id;
		}
	}

	return 0;
}

/**
 * Gets the UID associated with a specified user email address.
 *
 * @param	name		the user email to search for
 * @return				the users UID
 */
define_function integer getUserIdFromEmail(char email[USER_EMAIL_MAX_LENGTH]) {
	stack_var integer id;

	for (id = 1; id <= USER_MAX_USER_ACCOUNTS; id++) {
		if (getUserEmail(id) == email) {
			return id;
		}
	}

	return 0;
}

/**
 * Creates a new user in the system users array.
 *
 * @param	nfcUid		the nfcUid to associated with the user
 * @param	name		the user's name
 * @param	email		the user's email address
 * @return				the internal user id, 0 if we're all full
 */
define_function integer createUser(char nfcUid[USER_NFC_UID_MAX_LENGTH],
		char name[USER_NAME_MAX_LENGTH],
		char email[USER_EMAIL_MAX_LENGTH]) {
	stack_var integer id;

	// Find the next available user slot and store
	for (id = 1; id <= USER_MAX_USER_ACCOUNTS; id++) {
		if (!userExists(id)) {
			systemUsers[id].nfcUid = upper_string(trim(nfcUid));
			systemUsers[id].name = trim(name);
			systemUsers[id].email = trim(email);
			send_string 0, "'User created [id:', itoa(id), ', nfcUid:',
					nfcUid, ', name:', name, ', email:', email, ']'";
			return id;
		}
	}

	return 0;
}

/**
 * Load the system users from a CSV file in the format <nfcUid>,<name>,<email>.
 * Empty lines and lines beginning with '#' will be ignored.
 *
 * @param	filename	the file containing the userdata
 * @return				a boolean, true if load was successfull
 */
define_function char loadSystemUsersFromFile(char filename[]) {
	stack_var slong fileHandle;
	stack_var char buff[256];
	stack_var slong	readLength;
	stack_var char params[3][128];

	send_string 0, "'Loading NFC user data from ', filename";

	// Open file for reading
	fileHandle = file_open(filename, FILE_READ_ONLY);
	if (fileHandle <= 0) {
		send_string 0, "'Could not open ', filename, '. Error (', itoa(fileHandle), ').'";
		return false;
	}

	// Read in the file line by line
	readLength = file_read_line(fileHandle, buff, max_length_array(buff));
	while (readLength >= 0) {

		buff = trim(buff);

		// ignore comments and empty lines
		if (length_array(buff) && left_string(buff, 1) != '#') {
			explode(',', buff, params, 3);
			createUser(params[1], params[2], params[3]);
		}

		readLength = file_read_line(fileHandle, buff, max_length_array(buff));

		send_string 0, "'>>>>> readLength = ', itoa(readLength)";
	}

	// Last line was not read correct (-9 is EOF)
	if (readLength < 0 && readLength != -9) {
		send_string 0, "'Error reading ', filename, '. Error (', itoa(readLength), ').'";
		file_close(fileHandle);
		return false;
	}

	send_string 0, 'NFC user data loaded';

	file_close(fileHandle);

	return true;
}



define_start

loadSystemUsersFromFile('users.txt');

#END_IF // __USER_AUTH__
