PROGRAM_NAME='RmsApiAux'


#IF_NOT_DEFINED __RMS_API_AUX__
#DEFINE __RMS_API_AUX__

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

	// ensure an asset client key has been provided
	if (assetClientKey == '') {
		send_string 0, '>>>> RMS API AUX ERROR <RmsAssetLocationRequest> :: missing asset client key';
		return false;
	}

	// submit the asset location query
	rmsCommand = RmsPackCmdHeader('?ASSET.LOCATION');
	rmsCommand = RmsPackCmdParam(rmsCommand,assetClientKey);
	send_command vdvRMS, rmsCommand;

	return true;
}


#END_IF // __RMS_API_AUX__
