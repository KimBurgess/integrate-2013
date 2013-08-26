PROGRAM_NAME='TimeUtil'


define_variable

constant long TIME_MINUTE = 1;
constant long TIME_HOUR = 60 * TIME_MINUTE;
constant long TIME_DAY = 24 * TIME_HOUR;
constant long TIME_MONTH = 30 * TIME_DAY;


/**
 * Convert a number of minutes into a human readable (and easilly
 * understandable) string.
 *
 * @param	minutes		the number of minutes of time to represent
 * @return				a string containing the time represented in a nice,
 *						readble way
 */
define_function char[32] fuzzyTime(long minutes) {
	stack_var char ret[32];

	select {
		active (minutes <= 3 * TIME_MINUTE): {
			ret = 'now';
		}
		active (minutes <= 25 * TIME_MINUTE): {
			ret = "'in ', itoa(minutes), ' minutes'";
		}
		active (minutes <= 40 * TIME_MINUTE): {
			ret = 'in half an hour';
		}
		active (minutes < 80 * TIME_MINUTE): {
			ret = 'in 1 hour';
		}
		active (minutes <  105 * TIME_MINUTE): {
			ret = 'in 1 and a half hours';
		}
		active (minutes < 2 * TIME_HOUR): {
			ret = 'in 2 hours';
		}
		active (minutes < 20 * TIME_HOUR): {
			ret = "'in ', itoa(minutes / TIME_HOUR), ' hours'";
		}
		active (minutes < 30 * TIME_HOUR): {
			ret = 'in 1 day';
		}
		active (minutes < 40 * TIME_HOUR): {
			ret = 'in 1 and a half days';
		}
		active (minutes < 2 * TIME_DAY): {
			ret = 'in 2 days';
		}
		active (minutes < 30 * TIME_DAY): {
			ret = "'in ', itoa(minutes / TIME_DAY), ' days'";
		}
		active (minutes < 40 * TIME_MONTH): {
			ret = 'in 1 month';
		}
		active (minutes < 50 * TIME_DAY): {
			ret = 'in 1 and a half months';
		}
		active (minutes < 2 * TIME_MONTH): {
			ret = 'in 2 months';
		}
		active (minutes < 12 * TIME_MONTH): {
			ret = "'in ', itoa(minutes / TIME_MONTH), ' months'";
		}
		active (1): {
			ret = 'a long time from now';
		}
	}

	return ret;
}

/**
 * Converts a string representing time in a hh:mm:ss format to hh:mm[am/pm]
 *
 * @param	timeStr		the time to convert in 24 hour format
 * @return				the passed time in 12 hour format
 */
define_function char[7] time12Hour(char timeStr[8]) {
	sinteger hours;
	sinteger minutes;
	char period[2];

	hours = time_to_hour(timeStr);
	minutes = time_to_minute(timeStr);

	if (hours == -1 || minutes == -1) {
		return 'error';
	}

	if (hours > 11) {
		period = 'pm';
		hours = hours - 12;
	} else {
		period = 'am'
	}

	if (hours == 0) {
		hours = 12;
	}

	return "format('%d', hours), ':', format('%02d', minutes), period";
}

define_function char[8] nextMinute(char timeStr[8]) {
	sinteger hours;
	sinteger minutes;
	sinteger seconds;

	hours = time_to_hour(timeStr);
	minutes = time_to_minute(timeStr);
	seconds = time_to_second(timeStr);

	minutes = minutes + 1;
	if (minutes >= 60) {
		minutes = 0;
		hours = hours + 1;
		if (hours >= 24) {
			hours = 0;
		}
	}

	return "format('%02d', hours), ':', format('%02d', minutes), ':', format('%02d', seconds)";
}

define_function char timeIsInFuture(char timeStr[8]) {
	sinteger hours;
	sinteger minutes;
	sinteger seconds;
	sinteger nowHours;
	sinteger nowMinutes;
	sinteger nowSeconds;

	hours = time_to_hour(timeStr);
	minutes = time_to_minute(timeStr);
	seconds = time_to_second(timeStr);
	nowHours = time_to_hour(TIME);
	nowMinutes = time_to_minute(TIME);
	nowSeconds = time_to_second(TIME);

	if (nowHours > hours) {
		return true;
	} else if (nowHours == hours) {
		if(nowMinutes > minutes) {
			return true;
		} else if (nowMinutes == minutes) {
			if (nowSeconds > nowSeconds) {
				return true;
			}
		}
	}
	
	return false;
}
