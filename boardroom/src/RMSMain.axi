	PROGRAM_NAME='RMSMain'

//#DEFINE INCLUDE_RMS_EVENT_SYSTEM_MODE_CALLBACK // tell 'RmsEventListener' to call the function RmsEventSystemModeChanged()
//#DEFINE INCLUDE_RMS_CUSTOM_EVENT_CLIENT_RESPONSE_CALLBACK

#DEFINE INCLUDE_RMS_EVENT_ASSETS_REGISTER_CALLBACK
#DEFINE INCLUDE_RMS_EVENT_ASSET_REGISTERED_CALLBACK

include 'RmsSchedulingApi'
include 'RmsGuiApi'
//INCLUDE 'RmsSourceUsage'
#INCLUDE 'RmsSchedulingEventListener'
INCLUDE 'RmsEventListener' // 'RmsApi.axi' is defined in here

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

DEV dvRMS_TP[] = { dvTpBoardroomTableRMS, dvTpWelcomeRmsGui }
DEV dvRMS_TP_Base[] = { dvTpBoardroomTableMain, dvTpWelcomeRmsBase } // read TP keyboard on this dev

integer nLocationIdBoardroom = 29
char cLocationNameBoardroom[] = 'Integrate Boardroom'

URL_STRUCT uRMS_URL

CHAR sPC1_Name[] = 'Laptop 1';
CHAR sPC1_Description[] = 'Dell';

DEV dvPowerMonitoredAssets[][] =
{
	{
		dvSystem,				// outlet 1
		dvMonitorLeft,	// outlet 2
		dvMonitorRight,	// outlet 3
		vdvEnzo,			  // outlet 4
		vdvDTV,  	 		  // outlet 5
		vdvSignage,  	  // outlet 6
		vdvCamera,   		// outlet 7
		vdvMPL 		      // outlet 8
	},
	{
		vdvRouter_01,		// outlet 1
		dvTpWallMain,		// outlet 2
		dvLight,     // outlet 3
		vdvLaptop,	// outlet 4
		dvIrBluray, // outlet 5
		vdvRouter_02,	// outlet 6
		dvTpBoardroomTableMain, // outlet 7
		dvNull    	// outlet 8
	}
}

CHAR temperatureSensorName[][16] = 
{
	'Temp sensor 1',
	'Temp sensor 2'
}	

CHAR powerOutletNames[][][16] =
{
	{
		'DVX',					// outlet 1
		'Monitor Left',	// outlet 2
		'Monitor Right',// outlet 3
		'Enzo',					// outlet 4
		'DTV-RX02-HD',	// outlet 5
		'IS-SPX-1300',	// outlet 6
		'Camera',				// outlet 7
		'AXM-MPL',			// outlet 8
		'all outlets'		// all outlets
	},
	{
		'NXA-ENET8-POE',// outlet 1
		'MXD-1000',			// outlet 2
		'Lights',				// outlet 3
		'Table power',	// outlet 4
		'Bluray',				// outlet 5
		'NXA-ENET8-POE',// outlet 6
		'MXT-1900',			// outlet 7
		'Spare',				// outlet 8
		'all outlets'		// all outlets
	}
}

CHAR axLinkBusNames[][][12] =
{
	{
		'outlet 1',		// outlet 1
		'outlet 2',		// outlet 2
		'all outlets'		// all outlets
	},
	{
		'outlet 1',		// outlet 1
		'outlet 2',		// outlet 2
		'all outlets'		// all outlets
	}
}
(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
/*DEFINE_FUNCTION	rmsInit()
{
	IF(!LENGTH_STRING(uRMS_URL.URL))
	{
		uRMS_URL.URL = 'rms.amxaustralia.com.au';
		uRMS_URL.Password = 'password';
		uRMS_URL.User = 'Boardroom'; // name. Too lazy to creatre a new variable or structure type
		uRMS_URL.Flags = TRUE; // enabled. Too lazy to creatre a new variable or structure type
	}
}

DEFINE_FUNCTION	rmsConnect()
{
	// announce yourself to RMS server. 
	// This can be done in the NI master web page > system > manage system > device options > device configuration pages if desired
	SEND_COMMAND vdvRMS, "'CONFIG.CLIENT.NAME-', uRMS_URL.User";
	/SEND_COMMAND vdvRMS, "'CONFIG.SERVER.URL-http://', uRMS_URL.URL, '/rms'";
	SEND_COMMAND vdvRMS, "'CONFIG.SERVER.PASSWORD-', uRMS_URL.Password";
	SEND_COMMAND vdvRMS, "'CONFIG.CLIENT.ENABLED-', ITOA(uRMS_URL.Flags)";
}*/

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

//rmsInit();

// RMS general
DEFINE_MODULE 'RmsNetLinxAdapter_dr4_0_0' modRMS1(vdvRMS) // instantiate the Netlinx adaptor module which will start the RMS client

// params
DEFINE_MODULE 'RmsControlSystemMonitor' modRMSsysMon1(vdvRMS, dvSystem) // add the control system as an assett
DEFINE_MODULE 'RmsSystemPowerMonitor' modRMSPwrMon1(vdvRMS, dvSystem) 	// monitor power of the system
// gui
DEFINE_MODULE 'RmsClientGui_dr4_0_0' modRMSClient1(vdvRMSGui, dvRMS_TP, dvRMS_TP_Base)

// Monitor the Touch panel in RMS-E
DEFINE_MODULE 'RmsTouchPanelMonitor' modRMS_GUI1(vdvRMS, dvTpBoardroomTableRMS)
DEFINE_MODULE 'RmsTouchPanelMonitor' modRMS_GUI2(vdvRMS, dvTpWelcomeRmsBase)
DEFINE_MODULE 'BoardroomSchedulingUi' BoardroomSchedulingUi (vdvRMS, vdvRmsGui, dvTpWelcomeRmsGuiExtended, dvTpWelcomeRmsBase, nLocationIdBoardroom, cLocationNameBoardroom)


// devices

// Monitor the Power Distribution Units in RMS-E
//DEFINE_MODULE 'RmsPowerDistributionUnitMonitor_Custom' modRMS_Powa1(vdvRMS, dvPDU_01, dvPowerMonitoredAssets[1], temperatureSensorName[1],  powerOutletNames[1], axLinkBusNames[1])
//DEFINE_MODULE 'RmsPowerDistributionUnitMonitor_Custom' modRMS_Powa2(vdvRMS, dvPDU_02, dvPowerMonitoredAssets[2], temperatureSensorName[2],  powerOutletNames[2], axLinkBusNames[2])

// Monitor the NEC displays in RMS-E
//DEFINE_MODULE 'RmsDuetMonitorMonitor' modRms_DisplayLeft (vdvRMS, vdvMonitorLeft, dvMonitorLeft)
//DEFINE_MODULE 'RmsDuetMonitorMonitor' modRms_DisplayRight (vdvRMS, vdvMonitorRight, dvMonitorRight)


// Enzo RMS monitoring
//DEFINE_MODULE 'RmsGenericNetLinxDeviceMonitor' modRMS_Enzo(vdvRMS, dvEnzo)

// MFTX RMS monitoring
//DEFINE_MODULE 'RmsGenericNetLinxDeviceMonitor' modRMS_DxlinkMftx(vdvRMS, dvDxlinkMfTxLaptopMain)

// DVX RMS Monitor
//DEFINE_MODULE 'RmsDvxSwitcherMonitor' modRms_DvxSwitcher(vdvRMS);

// Kim's module to speed up polling between master and RMS
DEFINE_MODULE 'RmsHeartAttack' modRMS_HeartAttack(vdvRMS)



// This function will get called when RMS is ready to register assets
// as long as 'RmsEventListener' is included and the 
// INCLUDE_RMS_CUSTOM_EVENT_CLIENT_RESPONSE_CALLBACK compiler directive is 
// defined above the line on which 'RmsEventListener' is included.
//#DEFINE INCLUDE_RMS_EVENT_ASSETS_REGISTER_CALLBACK
DEFINE_FUNCTION RmsEventRegisterAssets()
{
	// Call RmsAssetRegister() function to register an asset with RMS
	
	stack_var RmsAsset rmsAssetDtvRx
	
	rmsAssetDtvRx.assetType = RMS_ASSET_TYPE_SETTOP_BOX
	rmsAssetDtvRx.clientKey = cIpTvRxAddressBoardroom
	rmsAssetDtvRx.globalKey = ''
	rmsAssetDtvRx.name = 'TV Receiver'
	rmsAssetDtvRx.description = 'High Definition Receiver, Ethernet, with integrated IR and Serial control'
	rmsAssetDtvRx.manufacturerName = 'AMX'
	rmsAssetDtvRx.manufacturerUrl = 'http://www.amx.com'
	rmsAssetDtvRx.modelName = 'DTV-RX02HD'
	rmsAssetDtvRx.modelUrl = 'http://www.amx.com/products/DTV-RX02-HD.asp'
	rmsAssetDtvRx.serialNumber = ''
	rmsAssetDtvRx.firmwareVersion = ''

							  /*CHAR assetType[50];
							  CHAR clientKey[30];
							  CHAR globalKey[150];
							  CHAR name[50];
							  CHAR description[250];
							  CHAR manufacturerName[50];
							  CHAR manufacturerUrl[250];
							  CHAR modelName[50];
							  CHAR modelUrl[250];
							  CHAR serialNumber[100];
							  CHAR firmwareVersion[30];*/
	
	//RmsAssetRegister(vdvIpTv, rmsAssetDtvRx)
}




//#DEFINE INCLUDE_RMS_EVENT_ASSET_REGISTERED_CALLBACK
DEFINE_FUNCTION RmsEventAssetRegistered(CHAR assetClientKey[], LONG assetId, CHAR newAssetRegistration)
{
	switch (assetClientKey)
	{
		case cIpTvRxAddressBoardroom:
		{
			/*
			RmsAssetParameterEnqueueString(	CHAR assetClientKey[],
											CHAR parameterKey[],
											CHAR parameterName[],
											CHAR parameterDescription[],
											CHAR reportingType[],
											CHAR initialValue[],
											CHAR units[],
											CHAR allowReset,
											CHAR resetValue[],
											CHAR trackChanges )
			*/
			RmsAssetParameterEnqueueString(assetClientKey,
											'Channel',
											'Channel',
											'Current Channel',
											RMS_ASSET_PARAM_TYPE_NONE,
											'',
											'',
											FALSE,
											'',
											FALSE)
			
			//RmsAssetParameterSubmit(assetClientKey)
		}
	}
}

(***********************************************************)                                                                                                          
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

DATA_EVENT[vdvRMS]
{
	ONLINE: 
	{
		send_command vdvRMS, '@CONFIG.CLIENT.HEARTATTACK-TRUE,1'
		//rmsConnect();
		//RmsPruneDocCamMonitoring();
		RmsSetInternalPanel(dvTpBoardroomTableMain, dvTpBoardroomTableRMS)
	}
}


