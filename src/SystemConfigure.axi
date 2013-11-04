PROGRAM_NAME='SystemConfigure'


#if_not_defined __SYSTEM_CONFIGURE__
#define __SYSTEM_CONFIGURE__



//// Code to configure the devices in the AMX Australia Sydney office boardroom when they come online


define_event

data_event[dvTpBoardroomTableMain]
{
    online:
    {
	fnMplSetVideoInputFormatAndResolution (data.device, cMPL_FORMAT_HDMI, '1280x720p@30')
	fnMplSetStreamType (data.device, cMPL_STREAM_TYPE_VIDEO)
	fnMplEnableVideoInput (data.device)
	fnMplEnableStream (data.device, cMPL_STREAM_TYPE_VIDEO)
    }
}


data_event[dvDvxVidInPorts]
{
    online:
    {
	fnDvxSetVideoInputName (data.device, cDvxSourceNames[GET_LAST(dvDvxVidInPorts)])
	
	fnDvxRequestVideoInputName (data.device)
	
	fnDvxRequestVideoInputStatus (data.device)
    }
}


data_event[dvTpBoardroomTableSourceselect]
{
    online:
    {
	stack_var integer nIdx
	
	for (nIdx = 1; nIdx <= LENGTH_ARRAY(dvDvxVidInPorts); nIdx++)
	{
	    //fnModeroSetButtonText (dvTpBoardroomTableSourceselect, nAdrsSourceLabels[nIdx], nMODERO_BUTTON_STATE_ALL, cDvxSourceNames[nIdx])
	    fnDvxRequestVideoInputName (dvDvxVidInPorts[nIdx])
	    fnDvxRequestVideoInputStatus (dvDvxVidInPorts[nIdx])
	}
    }
}


data_event[dvDvxVidOutMplInput]
{
    online:
    {
	fnDvxSetVideoOutputResolution (data.device, '1280x720p@60')
    }
}

data_event[dvDvxVidInLaptop]		// DXLink input port
{
    online:
    {
	fnDvxEnableDxlinkInputPortEthernet (data.device)
    }
}

data_event[dvDvxVidOutMonitorLeft]	// DXLink/HDMI output port
data_event[dvDvxVidOutMonitorRight]	// DXLink/HDMI output port
{
    online:
    {
	fnDvxEnableDxlinkOutputPortEthernet (data.device)
    }
}





#end_if __SYSTEM_CONFIGURE__