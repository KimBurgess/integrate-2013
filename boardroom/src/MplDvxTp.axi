PROGRAM_NAME='MplDvxTp'


#if_not_defined __MPL_DVX_TP__
#define __MPL_DVX_TP__



INCLUDE 'DvxApi'
INCLUDE 'DvxControl'


DEFINE_DEVICE


#if_not_defined dvDvxPort1
dvDvxPort1 = 5002:1:0
#end_if

#if_not_defined dvDvxVidOutMplInput
dvDvxVidOutMplInput = 5002:2:0
#end_if

#if_not_defined dvTpPreview
//dvTpPreview = 10001:1:0
dvTpPreview = 10001:2:0
#end_if



DEFINE_CONSTANT

LONG lnMplTimeLineId = 1

INTEGER nMAX_NUM_OF_DVX_INPUTS_FOR_MPL = 10

integer nOneThousandMilliSeconds = 1000

DEFINE_VARIABLE

#if_not_defined dvDvxVidInPortsForMpl
dev dvDvxVidInPortsForMpl[nMAX_NUM_OF_DVX_INPUTS_FOR_MPL] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0, 5002:5:0, 5002:6:0, 5002:7:0, 5002:8:0, 5002:9:0, 5002:10:0}
#end_if


#if_not_defined nAdrPreviewButtons
//integer nAdrPreviewButtons[nMAX_NUM_OF_DVX_INPUTS_FOR_MPL] = {201, 202, 203, 204, 205, 206, 207, 208, 209, 210}
integer nAdrPreviewButtons[nMAX_NUM_OF_DVX_INPUTS_FOR_MPL] = {201, 202, 203, 204, 205, 206, 207, 208, 209, 210}
#end_if




DEFINE_VARIABLE

//char cDvxVideoInputSignalStatus[nNUM_OF_SOURCES_TO_SELECT][20] = {cDVX_SIGNAL_STATUS_UNKNOWN, cDVX_SIGNAL_STATUS_UNKNOWN, cDVX_SIGNAL_STATUS_UNKNOWN, cDVX_SIGNAL_STATUS_UNKNOWN}
char cDvxVideoInputSignalStatus[nNUM_OF_SOURCES_TO_SELECT][20] = {'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN'}
integer nDvxVideoInputSignalStatus[nNUM_OF_SOURCES_TO_SELECT] = {0,0,0,0,0,0,0,0,0,0}

integer nMplSwitchTimeMs = nOneThousandMilliSeconds


integer nTempDvxOutputForMpl = 4


//LONG lnMplTimeLineTimes[] = {2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000}	// every 2 seconds
//LONG lnMplTimeLineTimes[] = {1500, 1500, 1500, 1500, 1500, 1500, 1500, 1500, 1500, 1500}	// every 1.5 seconds
LONG lnMplTimeLineTimes[nMAX_NUM_OF_DVX_INPUTS_FOR_MPL] = {nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds, nOneThousandMilliSeconds}	// every 1 second


integer nMplDvxTpDebugToggle

integer nWaitTimeMplSnapShot = 8

char cMplCurrentMode[30] = cMPL_MODE_SNAPSHOT



define_function fnMplPreviewNotifyDvxVideoInputSignalStatus(dev dvDvxVidIn, char cSignalStatus[])
{
	stack_var integer iIdx
	
	for(iIdx = 1; iIdx <= max_length_array(lnMplTimeLineTimes); iIdx++)
	{
		if( dvDvxVidIn == dvDvxVidInPorts[iIdx] )
		{
			switch(cSignalStatus)
			{
				case cDVX_SIGNAL_STATUS_NO_SIGNAL:
				{
					lnMplTimeLineTimes[iIdx] = 0
				}
				case cDVX_SIGNAL_STATUS_VALID_SIGNAL:
				{
					lnMplTimeLineTimes[iIdx] = nMplSwitchTimeMs
				}
			}
			timeline_reload(lnMplTimeLineId, lnMplTimeLineTimes, max_length_array(dvDvxVidInPortsForMpl))
			break
		}
	}
}


define_function fnMplDvxTpPreviewCycleStart()
{
	if( !timeline_active(lnMplTimeLineId) )
		TIMELINE_CREATE (lnMplTimeLineId, lnMplTimeLineTimes, max_length_array(dvDvxVidInPortsForMpl), TIMELINE_RELATIVE, TIMELINE_REPEAT)
}

define_function fnMplDvxTpPreviewCycleStop()
{
	if(timeline_active(lnMplTimeLineId))
		TIMELINE_KILL (lnMplTimeLineId)
}


define_function fnMplDvxTpSetModeSnapshot()
{
	cMplCurrentMode = cMPL_MODE_SNAPSHOT
}

define_function fnMplDvxTpSetModeVideoPreview(dev dvDvxVidIn, dev dvTp, integer nBtnAdrVideoPreview)
{
	cMplCurrentMode = cMPL_MODE_VIDEO_PREVIEW
	
	/*switch(cMplCurrentMode)
	{
		case cMPL_MODE_SNAPSHOT:
		{
			send_command dvTp, '^BOS-<addr>,0,0'	// set button to display a non-video window				
			SEND_COMMAND dvTp,"'^SDM-<addr>,2,'";	// set 
			fnMplDisableStream(dvTp)
		}
		case cMPL_MODE_PREVIEW:
		{
			send_command dvTp, '^BOS-<addr>,0,1'	// set button to display a video window
			fnMplEnableStream(dvTp)
		}
	}*/
}




DEFINE_START






DEFINE_EVENT


data_event[dvDvxPort1]
{
    online:
    {
		fnDvxSwitchAll(dvDvxPort1, 0, lnMplTimeLineId)
		WAIT 50
		{
			/*local_var integer iIdx
			for(iIdx = 1; iIdx <= max_length_array(lnMplTimeLineTimes); iIdx++)
			{
				if( dvDvxVidInPortsForMpl[iIdx].PORT == 0 )
					lnMplTimeLineTimes[iIdx] = 0
				else
					lnMplTimeLineTimes[iIdx] = 1000
			}*/
			
			fnMplDvxTpPreviewCycleStart()
		}
    }
    offline:
    {
		fnMplDvxTpPreviewCycleStop()
    }
}

data_event[dvTpPreview]
{
	online:
	{
		stack_var integer nSlotId
		local_var char cDynamicImageName[30]
		
		for(nSlotId = 1; nSlotId <= length_array(nAdrPreviewButtons); nSlotId++)
		{
			cDynamicImageName = "'MXA_PREVIEW_',itoa(nSlotId)"
			send_command dvTpPreview,"'^RMF-',cDynamicImageName,',%V1'"
		}
	}
}



timeline_event[lnMplTimeLineId]
{
    local_var integer nSlotId
    local_var char cDynamicImageName[30]
	
	if( lnMplTimeLineTimes[timeline.sequence] != 0 )
	{

		nSlotId = timeline.sequence
		cDynamicImageName = "'MXA_PREVIEW_',itoa(nSlotId)"
		
		if (nDvxVideoInputSignalStatus[nSlotId] == 1)
		{
			// 1. switch to next input on the DVX
			fnDvxSwitchVideoOnly (dvDvxPort1, dvDvxVidInPorts[timeline.sequence].port, nTempDvxOutputForMpl)
			
			// 2. take a snapshot of the image at that index (this will store a jpeg in the MPL at the index and also update the dynamic image on the panel)
			WAIT nWaitTimeMplSnapShot	// wait just over half a second before taking the snapshot....allows the image time to lock on
			{
				fnModeroResourceForceRefreshPrefetchCache(dvTpPreview,cDynamicImageName)
			}
		}
		else
		{
		}
	}
}
















// Listener includes go at the bottom
//INCLUDE 'DvxListener'
// Can't put this here or the DvxListener file won't be able to see fnDvxNotify functions
// define back in the main file after the (Include 'MplDvxTp') statement.


#end_if __MPL_DVX_TP__