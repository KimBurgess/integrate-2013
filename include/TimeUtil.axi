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
			ret = "itoa(minutes), ' minutes'";
		}
		active (minutes <= 40 * TIME_MINUTE): {
			ret = 'half an hour';
		}
		active (minutes < 90 * TIME_MINUTE): {
			ret = '1 hour';
		}
		active (minutes < 24 * TIME_HOUR): {
			ret = "itoa(minutes / TIME_HOUR), ' hours'";
		}
		active (minutes < 2 * TIME_DAY): {
			ret = '1 day';
		}
		active (minutes < 30 * TIME_DAY): {
			ret = "itoa(minutes / TIME_DAY), ' days'";
		}
		active (minutes < 2 * TIME_MONTH): {
			ret = '1 month';
		}
		active (minutes < 12 * TIME_MONTH): {
			ret = "itoa(minutes / TIME_MONTH), ' months'";
		}
		active (1): {
			ret = 'a long time from now';
		}
	}

	return ret;
}
