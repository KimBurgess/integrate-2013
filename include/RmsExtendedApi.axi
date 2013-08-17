PROGRAM_NAME='RmsExtendedApi'


#IF_NOT_DEFINED __RMS_EXTENDED_API__
#DEFINE __RMS_EXTENDED_API__


#INCLUDE 'RmsApi'


define_constant

RMS_EVENT_ASSET_LOCATION = 'ASSET.LOCATION';


/**
 * Queries the current location of an asset.
 *
 * @param	assetClientKey	a string containing the client key query
 * @return					a boolean, true if the query was successful
 */
define_function char RmsAssetLocationRequest(char assetClientKey[]) {
	stack_var char rmsCommand[RMS_MAX_CMD_LEN];

	if (assetClientKey == '') {
		send_string 0, '>>>> RMS EXTENDED API ERROR <RmsAssetLocationRequest> :: missing asset client key';
		return false;
	}

	rmsCommand = RmsPackCmdHeader('?ASSET.LOCATION');
	rmsCommand = RmsPackCmdParam(rmsCommand,assetClientKey);
	send_command vdvRMS, rmsCommand;

	return true;
}

/**
 * Sends an email with the RMS email service.
 *
 * @param	address			the email address to send to
 * @param	subject			the subject line
 * @param	body			the message body
 * @param	cc				carbon copy address list
 * @param	bcc				blind carbon copy address list
 * @return					a boolean, true if the message was sent
 */
define_function char RmsEmail(char address[],
		char subject[],
		char body[],
		char cc[],
		char bcc[]) {
	stack_var char rmsCommand[RMS_MAX_CMD_LEN];

	if (address == '') {
		send_string 0, '>>>> RMS EXTENDED API ERROR <RmsEmail> :: missing address';
		return false;
	}

	if (subject == '') {
		send_string 0, '>>>> RMS EXTENDED API ERROR <RmsEmail> :: missing subject';
		return false;
	}

	if (body == '') {
		send_string 0, '>>>> RMS EXTENDED API ERROR <RmsEmail> :: missing body';
		return false;
	}

	// submit the email
	rmsCommand = RmsPackCmdHeader('MESSAGE.EMAIL');
	rmsCommand = RmsPackCmdParam(rmsCommand,address);
	rmsCommand = RmsPackCmdParam(rmsCommand,subject);
	rmsCommand = RmsPackCmdParam(rmsCommand,body);
	rmsCommand = RmsPackCmdParam(rmsCommand,cc);
	rmsCommand = RmsPackCmdParam(rmsCommand,bcc);
	send_command vdvRMS, rmsCommand;

	return true;
}


/**
 * Force the RMS client to immediately retrieve and process all pending
 * client-destined messages from the RMS server.
 *
 * @return			a boolean, true if successful
 */
define_function char RmsRetrieveClientMessages() {
	stack_var char rmsCommand[RMS_MAX_CMD_LEN];

	if (![vdvRMS, RMS_CHANNEL_CLIENT_ONLINE]) {
		send_string 0, '>>>> RMS EXTENDED API ERROR <RmsRetrieveClientMessages> :: client is currently offline';
		return false;
	}

	send_command vdvRMS, 'CLIENT.MESSAGES.RETRIEVE';

	return true;
}


#END_IF // __RMS_EXTENDED_API__
