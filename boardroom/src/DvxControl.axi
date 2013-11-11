program_name='DvxControl'


#if_not_defined __DVX_CONTROL__
#define __DVX_CONTROL__



#include 'DvxApi'




/////////////////////////////////////
// fnDvxRequestXXXXXXXX
// fnDvxSetXXXXXXX
// fnDvxEnableXXXXXXX
// fnDvxDisableXXXXXXX
// fnDvxCycleXXXXXX
/////////////////////////////////////


////////////////////////////////////////////////////////
//////////        Front Panel Control         //////////
////////////////////////////////////////////////////////

/********************************************************************/
/* Function:	fnDvxRequestFrontPanelLockout                       */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Requests the status of the DVX front panel lockout. */
/********************************************************************/
define_function fnDvxRequestFrontPanelLockout (dev dvDvxPort1)
{
    send_command dvDvxPort1, cDVX_COMMAND_FRONT_PANEL_LOCKOUT_REQUEST
}

/********************************************************************/
/* Function:	fnDvxEnableFrontPanelLockout                        */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Enables front panel lockout on the DVX.             */
/********************************************************************/
define_function fnDvxEnableFrontPanelLockout (dev dvDvxPort1)
{
    send_command dvDvxPort1, "cDVX_COMMAND_FRONT_PANEL_LOCKOUT,cENABLE"
}

/********************************************************************/
/* Function:	fnDvxDisableFrontPanelLockout                       */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Disables front panel lockout on the DVX.            */
/********************************************************************/
define_function fnDvxDisableFrontPanelLockout (dev dvDvxPort1)
{
    send_command dvDvxPort1, "cDVX_COMMAND_FRONT_PANEL_LOCKOUT,cDISABLE"
}

/********************************************************************/
/* Function:	fnDvxRequestFrontPanelLockoutType                   */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Requests the the type of lockout set for the DVX    */
/*              front panel.                                        */
/********************************************************************/
define_function fnDvxRequestFrontPanelLockoutType (dev dvDvxPort1)
{
    send_command dvDvxPort1, cDVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE_REQUEST
}

/********************************************************************/
/* Function:	fnDvxSetFrontPanelLockoutType                       */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Sets the the type of lockout for the DVX front      */
/*              panel.                                              */
/********************************************************************/
define_function fnDvxSetFrontPanelLockoutType (dev dvDvxPort1, integer nLockoutType)
{
    switch (nLockoutType)
    {
	case nDVX_LOCKTYPE_ALL_MENUS:
	case nDVX_LOCKTYPE_RESERVED:
	case nDVX_LOCKTYPE_CONFIGURE_MENUS_ONLY:
	{
	    send_command dvDvxPort1, "cDVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE,itoa(nLockoutType)"
	}
    }
}

/********************************************************************/
/* Function:	fnDvxRequestFrontPanelIntensityLcd                  */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Requests LCD display light intensity.               */
/********************************************************************/
define_function fnDvxRequestFrontPanelIntensityLcd (dev dvDvxPort1)
{
    send_command dvDvxPort1, cDVX_COMMAND_FRONT_PANEL_INTENSITY_LCD_REQUEST
}

/********************************************************************/
/* Function:	fnDvxSetFrontPanelIntensityLcd                      */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nIntensity - light intensity                */
/*                                                                  */
/* Description:	Sets the LCD display light intensity.               */
/********************************************************************/
define_function fnDvxSetFrontPanelIntensityLcd (dev dvDvxPort1, integer nIntensity)
{
    // range 0 to 100
    if(nIntensity > 100)
	nIntensity = 100
    
    send_command dvDvxPort1, "cDVX_COMMAND_FRONT_PANEL_INTENSITY_LCD,itoa(nIntensity)"
}

/********************************************************************/
/* Function:	fnDvxRequestFrontPanelIntensityLeds                 */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Requests front panel button LED light intensity.    */
/********************************************************************/
define_function fnDvxRequestFrontPanelIntensityLeds (dev dvDvxPort1)
{
    send_command dvDvxPort1, cDVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS_REQUEST
}

/********************************************************************/
/* Function:	fnDvxSetFrontPanelIntensityLeds                     */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nIntensity - light intensity                */
/*                                                                  */
/* Description:	Sets the front panel button LED light intensity.    */
/********************************************************************/
define_function fnDvxSetFrontPanelIntensityLeds (dev dvDvxPort1, integer nIntensity)
{
    // range 0 to 100
    if(nIntensity > 100)
	nIntensity = 100
    
    send_command dvDvxPort1, "cDVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS,itoa(nIntensity)"
}



////////////////////////////////////////////////////////
//////////           System Control           //////////
////////////////////////////////////////////////////////


/********************************************************************/
/* Function:	fnDvxRequestDxlinkInputPortEthernetStatus           */
/*                                                                  */
/* Arguments:	dev dvDvxDxLinkInputPort - DXLink input port on DVX */
/*                                                                  */
/* Description:	Requests Ethernet status on DXLink input.           */
/********************************************************************/
define_function fnDvxRequestDxlinkInputPortEthernetStatus (dev dvDvxDxLinkInputPort)
{
    send_command dvDvxDxLinkInputPort, cDVX_COMMAND_DXLINK_INPUT_ETHERNET_REQUEST
}

/********************************************************************/
/* Function:	fnDvxEnableDxlinkInputPortEthernet                  */
/*                                                                  */
/* Arguments:	dev dvDvxDxLinkInputPort - DXLink input port on DVX */
/*                                                                  */
/* Description:	Enables Ethernet status on DXLink input.            */
/********************************************************************/
define_function fnDvxEnableDxlinkInputPortEthernet (dev dvDvxDxLinkInputPort)
{
    send_command dvDvxDxLinkInputPort, "cDVX_COMMAND_DXLINK_INPUT_ETHERNET,cDVX_DXLINK_ETHERNET_AUTO"
}

/********************************************************************/
/* Function:	fnDvxDisableDxlinkInputPortEthernet                 */
/*                                                                  */
/* Arguments:	dev dvDvxDxLinkInputPort - DXLink input port on DVX */
/*                                                                  */
/* Description:	Disables Ethernet status on DXLink input.           */
/********************************************************************/
define_function fnDvxDisableDxlinkInputPortEthernet (dev dvDvxDxLinkInputPort)
{
    send_command dvDvxDxLinkInputPort, "cDVX_COMMAND_DXLINK_INPUT_ETHERNET,cDVX_DXLINK_ETHERNET_OFF"
}

/**********************************************************************/
/* Function:	fnDvxRequestDxlinkOutputPortEthernetStatus            */
/*                                                                    */
/* Arguments:	dev dvDvxDxLinkOutputPort - DXLink output port on DVX */
/*                                                                    */
/* Description:	Requests Ethernet status on DXLink output.            */
/**********************************************************************/
define_function fnDvxRequestDxlinkOutputPortEthernetStatus (dev dvDvxDxLinkOutputPort)
{
    send_command dvDvxDxLinkOutputPort, cDVX_COMMAND_DXLINK_OUTPUT_ETHERNET_REQUEST
}

/**********************************************************************/
/* Function:	fnDvxEnableDxlinkOutputPortEthernet                   */
/*                                                                    */
/* Arguments:	dev dvDvxDxLinkOutputPort - DXLink output port on DVX */
/*                                                                    */
/* Description:	Enables Ethernet status on DXLink output.             */
/**********************************************************************/
define_function fnDvxEnableDxlinkOutputPortEthernet (dev dvDvxDxLinkOutputPort)
{
    send_command dvDvxDxLinkOutputPort, "cDVX_COMMAND_DXLINK_OUTPUT_ETHERNET,cDVX_DXLINK_ETHERNET_AUTO"
}

/**********************************************************************/
/* Function:	fnDvxDisableDxlinkOutputPortEthernet                  */
/*                                                                    */
/* Arguments:	dev dvDvxDxLinkOutputPort - DXLink output port on DVX */
/*                                                                    */
/* Description:	Disables Ethernet status on DXLink output.            */
/**********************************************************************/
define_function fnDvxDisableDxlinkOutputPortEthernet (dev dvDvxDxLinkOutputPort)
{
    send_command dvDvxDxLinkOutputPort, "cDVX_COMMAND_DXLINK_OUTPUT_ETHERNET,cDVX_DXLINK_ETHERNET_OFF"
}

/********************************************************************/
/* Function:	fnDvxRequestFanSpeed                                */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Requests DVX internal fan speed.                    */
/********************************************************************/
define_function fnDvxRequestFanSpeed (dev dvDvxPort1)
{
    send_command dvDvxPort1, cDVX_COMMAND_FAN_SPEED_REQUEST
}

/********************************************************************/
/* Function:	fnDvxRequestTemperature                             */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*                                                                  */
/* Description:	Requests DVX internal temperature.                  */
/********************************************************************/
define_function fnDvxRequestTemperature (dev dvDvxPort1)
{
    send_command dvDvxPort1, cDVX_COMMAND_TEMPERATURE_REQUEST
}


////////////////////////////////////////////////////////
//////////         Switching Control          //////////
////////////////////////////////////////////////////////

/********************************************************************/
/* Function:	fnDvxSwitchVideoOnly                                */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nInput - video source input to send         */
/* 		integer nOutput - video destination to send to      */
/*                                                                  */
/* Description:	Perform a video route from a specified input to a   */
/* 		specified output.                                   */
/********************************************************************/
define_function fnDvxSwitchVideoOnly(dev dvDvxPort1, integer nInput, integer nOutput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_VIDEO_ONLY,itoa(nInput),'O',itoa(nOutput)"
    //send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_VIDEO,itoa(nInput),'O',itoa(nOutput)"
}

/********************************************************************/
/* Function:	fnDvxSwitchAudioOnly                                */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nInput - audio source input to send         */
/* 		integer nOutput - audio destination to send to      */
/*                                                                  */
/* Description:	Perform an audio route from a specified input to a  */
/* 		specified output.                                   */
/********************************************************************/
define_function fnDvxSwitchAudioOnly(dev dvDvxPort1, integer nInput, integer nOutput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_AUDIO_ONLY,itoa(nInput),'O',itoa(nOutput)"
    //send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_AUDIO,itoa(nInput),'O',itoa(nOutput)"
}

/********************************************************************/
/* Function:	fnDvxSwitchAll                                      */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nInput - source input to send               */
/* 		integer nOutput - destination to send to            */
/*                                                                  */
/* Description:	Perform a route from a specified input to a         */
/* 		specified output. Switches both audio and video.    */
/********************************************************************/
define_function fnDvxSwitchAll(dev dvDvxPort1, integer nInput, integer nOutput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_ALL,itoa(nInput),'O',itoa(nOutput)"
    //send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_AUDIO_AND_VIDEO,itoa(nInput),'O',itoa(nOutput)"
}

/********************************************************************/
/* Function:	fnDvxSwitch                                         */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/*		char cSignalType[] - signal type                    */
/*                                   Values:                        */
/*                                      cSIGNAL_TYPE_VIDEO          */
/*                                      cSIGNAL_TYPE_AUDIO          */
/*                                      cSIGNAL_TYPE_ALL            */
/* 		integer nInput - source input to send               */
/* 		integer nOutput - destination to send to            */
/*                                                                  */
/* Description:	Perform a route from a specified input to a         */
/*		specified output. Signal type to switch dependent   */
/* 		on value of cSignalType parameter passed through.   */
/********************************************************************/
define_function fnDvxSwitch (dev dvDvxPort1, char cSignalType[], integer nInput, integer nOutput)
{
    switch (cSignalType)
    {
	case cSIGNAL_TYPE_VIDEO:	send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_VIDEO_ONLY,itoa(nInput),'O',itoa(nOutput)"
	case cSIGNAL_TYPE_AUDIO:	send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_AUDIO_ONLY,itoa(nInput),'O',itoa(nOutput)"
	case cSIGNAL_TYPE_ALL:		send_command dvDvxPort1, "cDVX_COMMAND_SWITCH_ALL,itoa(nInput),'O',itoa(nOutput)"
    }
}

/********************************************************************/
/* Function:	fnDvxRequestInputVideo                              */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nOutput - video output                      */
/*                                                                  */
/* Description:	Requests the video input that is switched to the    */
/*              specified video output.                             */
/********************************************************************/
define_function fnDvxRequestInputVideo (dev dvDvxPort1, integer nOutput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_INPUT_REQUEST,cSIGNAL_TYPE_VIDEO,',',itoa(nOutput)"
}

/********************************************************************/
/* Function:	fnDvxRequestOutputVideo                             */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nInput - video input                        */
/*                                                                  */
/* Description:	Requests the video output that the specified video  */
/*              input is switched to.                               */
/********************************************************************/
define_function fnDvxRequestOutputVideo (dev dvDvxPort1, integer nInput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_OUTPUT_REQUEST,cSIGNAL_TYPE_VIDEO,',',itoa(nInput)"
}

/********************************************************************/
/* Function:	fnDvxRequestInputAudio                              */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nOutput - audio output                      */
/*                                                                  */
/* Description:	Requests the audio input that is switched to the    */
/*              specified audio output.                             */
/********************************************************************/
define_function fnDvxRequestInputAudio (dev dvDvxPort1, integer nOutput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_INPUT_REQUEST,cSIGNAL_TYPE_AUDIO,',',itoa(nOutput)"
}

/********************************************************************/
/* Function:	fnDvxRequestOutputAudio                             */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nInput - audio input                        */
/*                                                                  */
/* Description:	Requests the audio output that the specified audio  */
/*              input is switched to.                               */
/********************************************************************/
define_function fnDvxRequestOutputAudio (dev dvDvxPort1, integer nInput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_OUTPUT_REQUEST,cSIGNAL_TYPE_AUDIO,',',itoa(nInput)"
}

/********************************************************************/
/* Function:	fnDvxRequestOutputAll                             */
/*                                                                  */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device  */
/* 		integer nInput - audio input                        */
/*                                                                  */
/* Description:	Requests the audio output that the specified audio  */
/*              input is switched to.                               */
/********************************************************************/
define_function fnDvxRequestOutputAll (dev dvDvxPort1, integer nInput)
{
    send_command dvDvxPort1, "cDVX_COMMAND_OUTPUT_REQUEST,cSIGNAL_TYPE_ALL,',',itoa(nInput)"
}

/*********************************************************************/
/* Function:	fnDvxRequestInput                                    */
/*                                                                   */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device   */
/* 		char cSignalType[] - signal type                     */
/*                                   Values:                         */
/*                                      cSIGNAL_TYPE_VIDEO           */
/*                                      cSIGNAL_TYPE_AUDIO           */
/*                                      cSIGNAL_TYPE_ALL             */
/* 		integer nOutput - audio output                       */
/*                                                                   */
/* Description:	Requests the input that is switched to the           */
/* 		specified output. Signal type being requested is     */
/* 		dependent on the value of the cSignalType parameter. */
/*********************************************************************/
define_function fnDvxRequestInput (dev dvDvxPort1, char cSignalType[], integer nOutput)
{
    switch (cSignalType)
    {
	case cSIGNAL_TYPE_VIDEO:	send_command dvDvxPort1, "cDVX_COMMAND_INPUT_REQUEST,cSIGNAL_TYPE_VIDEO,',',itoa(nOutput)"
	case cSIGNAL_TYPE_AUDIO:	send_command dvDvxPort1, "cDVX_COMMAND_INPUT_REQUEST,cSIGNAL_TYPE_AUDIO,',',itoa(nOutput)"
    }
}

/*********************************************************************/
/* Function:	fnDvxRequestOutput                                   */
/*                                                                   */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX siwtcher device   */
/* 		char cSignalType[] - signal type                     */
/*                                   Values:                         */
/*                                      cSIGNAL_TYPE_VIDEO           */
/*                                      cSIGNAL_TYPE_AUDIO           */
/*                                      cSIGNAL_TYPE_ALL             */
/* 		integer nInput - audio input                         */
/*                                                                   */
/* Description:	Requests the output that the specified input is      */
/*              switched to. Signal type being requested is          */
/* 		dependent on the value of the cSignalType parameter. */
/*********************************************************************/
define_function fnDvxRequestOutput (dev dvDvxPort1, char cSignalType[], integer nInput)
{
    switch (cSignalType)
    {
	case cSIGNAL_TYPE_VIDEO:	send_command dvDvxPort1, "cDVX_COMMAND_OUTPUT_REQUEST,cSIGNAL_TYPE_VIDEO,',',itoa(nInput)"
	case cSIGNAL_TYPE_AUDIO:	send_command dvDvxPort1, "cDVX_COMMAND_OUTPUT_REQUEST,cSIGNAL_TYPE_AUDIO,',',itoa(nInput)"
	case cSIGNAL_TYPE_ALL:		send_command dvDvxPort1, "cDVX_COMMAND_OUTPUT_REQUEST,cSIGNAL_TYPE_ALL,',',itoa(nInput)"
    }
}





////////////////////////////////////////////////////////
//////////       Video Output Control         //////////
////////////////////////////////////////////////////////


/*************************************************************************/
/* Function:	fnDvxRequestVideoOutputAspectRatio                       */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Requests the aspect ratio of the video output port.      */
/*************************************************************************/
define_function fnDvxRequestVideoOutputAspectRatio (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_ASPECT_RATIO_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetVideoOutputAspectRatio                               */
/*                                                                           */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX      */
/*  		char cAspectRatioSetting[] - aspect ratio setting            */
/*                                           Values:                         */
/*                                           	cDVX_ASPECT_RATIO_ANAMORPHIC */
/*                                           	cDVX_ASPECT_RATIO_MAINTAIN   */
/*                                           	cDVX_ASPECT_RATIO_STRETCH    */
/*                                           	cDVX_ASPECT_RATIO_ZOOM       */
/*                                                                           */
/* Description:	Set the aspect ratio of the video output port.               */
/*****************************************************************************/
define_function fnDvxSetVideoOutputAspectRatio (dev dvDvxVideoOutputPort, char cAspectRatioSetting[])
{
    switch (cAspectRatioSetting)
    {
	case cDVX_ASPECT_RATIO_ANAMORPHIC:
	case cDVX_ASPECT_RATIO_MAINTAIN:
	case cDVX_ASPECT_RATIO_STRETCH:
	case cDVX_ASPECT_RATIO_ZOOM:
	{
	    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_ASPECT_RATIO,cAspectRatioSetting"
	}
    }
}

/*************************************************************************/
/* Function:	fnDvxRequestVideoOutputBlankImage                        */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Requests the image setting of the video blanking feature */
/* 		for the video output port.                               */
/*************************************************************************/
define_function fnDvxRequestVideoOutputBlankImage (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_BLANK_IMAGE_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetVideoOutputBlankImage                                */
/*                                                                           */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX      */
/*  		char cBlankImage[] - video blanking image                    */
/*                                           Values:                         */
/*                                           	cDVX_BLANK_IMAGE_BLACK       */
/*                                           	cDVX_BLANK_IMAGE_BLUE        */
/*                                           	cDVX_BLANK_IMAGE_LOGO_1      */
/*                                           	cDVX_BLANK_IMAGE_LOGO_2      */
/*                                           	cDVX_BLANK_IMAGE_LOGO_3      */
/*                                                                           */
/* Description:	Set the image of the video blanking feature for the video    */
/* 		output port.                                                 */
/*****************************************************************************/
define_function fnDvxSetVideoOutputBlankImage (dev dvDvxVideoOutputPort, char cBlankImage[])
{
    switch (cBlankImage)
    {
	case cDVX_BLANK_IMAGE_BLACK:
	case cDVX_BLANK_IMAGE_BLUE:
	case cDVX_BLANK_IMAGE_LOGO_1:
	case cDVX_BLANK_IMAGE_LOGO_2:
	case cDVX_BLANK_IMAGE_LOGO_3:
	{
	    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_BLANK_IMAGE,cBlankImage"
	}
    }
}

/*************************************************************************/
/* Function:	fnDvxRequestVideoOutputBrightness                        */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Requests the brightness value of the video output port.  */
/*************************************************************************/
define_function fnDvxRequestVideoOutputBrightness (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_BRIGHTNESS_REQUEST
}

/*************************************************************************/
/* Function:	fnDvxSetVideoOutputBrightness                            */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*  		integer nBrightness - brightness value (0..100)          */
/*                                                                       */
/* Description:	Sets the brightness value of the video output port.      */
/*************************************************************************/
define_function fnDvxSetVideoOutputBrightness (dev dvDvxVideoOutputPort, integer nBrightness)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_BRIGHTNESS,itoa(nBrightness)"
}

/*************************************************************************/
/* Function:	fnDvxRequestVideoOutputContrast                          */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Requests the contrast value of the video output port.    */
/*************************************************************************/
define_function fnDvxRequestVideoOutputContrast (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_CONTRAST_REQUEST
}

/*************************************************************************/
/* Function:	fnDvxSetVideoOutputContrast                              */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*  		integer nContrast - contrast value (0..100)              */
/*                                                                       */
/* Description:	Sets the contrast value of the video output port.        */
/*************************************************************************/
define_function fnDvxSetVideoOutputContrast (dev dvDvxVideoOutputPort, integer nContrast)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_CONTRAST,itoa(nContrast)"
}

/*************************************************************************/
/* Function:	fnDvxRequestVideoOutputFreeze                            */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Requests whether the freeze option is active on the      */
/* 		video output port.                                       */
/*************************************************************************/
define_function fnDvxRequestVideoOutputFreeze (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_FREEZE_REQUEST
}

/*************************************************************************/
/* Function:	fnDvxEnableVideoOutputFreeze                             */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Enables the freeze option on the video output port.      */
/*************************************************************************/
define_function fnDvxEnableVideoOutputFreeze (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_FREEZE,cENABLE"
}

/*************************************************************************/
/* Function:	fnDvxDisableVideoOutputFreeze                            */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Disables the freeze option on the video output port.     */
/*************************************************************************/
define_function fnDvxDisableVideoOutputFreeze (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_FREEZE,cDISABLE"
}

/*************************************************************************/
/* Function:	fnDvxRequestVideoOutputHorizontalShift                   */
/*                                                                       */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX  */
/*                                                                       */
/* Description:	Requests the horizontal shift value of the video output  */
/* 		port.                                                    */
/*************************************************************************/
define_function fnDvxRequestVideoOutputHorizontalShift (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT_REQUEST
}

/********************************************************************************/
/* Function:	fnDvxSetVideoOutputHorizontalShift                              */
/*                                                                              */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX         */
/*  		sinteger snHorizontalShift - horizontal shift value (-127..127) */
/*                                                                              */
/* Description:	Sets the horizontal shift value of the video output port.       */
/********************************************************************************/
define_function fnDvxSetVideoOutputHorizontalShift (dev dvDvxVideoOutputPort, sinteger snHorizontalShift)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT,itoa(snHorizontalShift)"
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputHorizontalSize                     */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the horizontal size value of the image displayed */
/* 		on the video output port.                                 */
/**************************************************************************/
define_function fnDvxRequestVideoOutputHorizontalSize (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetVideoOutputHorizontalSize                            */
/*                                                                           */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX      */
/*  		integer nHorizontalSize - horizontal size value (25..800)    */
/*                                                                           */
/* Description:	Sets the horizontal size value of the image displayed on the */
/* 		video output port.                                           */
/*****************************************************************************/
define_function fnDvxSetVideoOutputHorizontalSize (dev dvDvxVideoOutputPort, integer nHorizontalSize)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE,itoa(nHorizontalSize)"
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputMute                               */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests if the video output is muted.                    */
/**************************************************************************/
define_function fnDvxRequestVideoOutputMute (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_MUTE_REQUEST
}

/**************************************************************************/
/* Function:	fnDvxEnableVideoOutputMute                                */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Enable video mute on the video output.                    */
/**************************************************************************/
define_function fnDvxEnableVideoOutputMute (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_MUTE,cENABLE"
}

/**************************************************************************/
/* Function:	fnDvxDisableVideoOutputMute                               */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Disable video mute on the video output.                   */
/**************************************************************************/
define_function fnDvxDisableVideoOutputMute (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_MUTE,cDISABLE"
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputOn                                 */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the active status of the video output.           */
/**************************************************************************/
define_function fnDvxRequestVideoOutputOn (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_ON_REQUEST
}

/**************************************************************************/
/* Function:	fnDvxEnableVideoOutputOn                                  */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Activate (turn on) the video output.                      */
/**************************************************************************/
define_function fnDvxEnableVideoOutputOn (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_ON,cON"
}

/**************************************************************************/
/* Function:	fnDvxDisableVideoOutputOn                                 */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Deactivate (turn off) the video output.                   */
/**************************************************************************/
define_function fnDvxDisableVideoOutputOn (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_ON,cOFF"
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputOsd                                */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests whether the OSD setting is enabled on the video  */
/* 		output.                                                   */
/**************************************************************************/
define_function fnDvxRequestVideoOutputOsd (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_OSD_REQUEST
}

/**************************************************************************/
/* Function:	fnDvxEnableVideoOutputOsd                                 */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Enable the OSD for the video output.                      */
/**************************************************************************/
define_function fnDvxEnableVideoOutputOsd (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_OSD,cENABLE"
}

/**************************************************************************/
/* Function:	fnDvxDisableVideoOutputOsd                                */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Disable the OSD for the video output.                     */
/**************************************************************************/
define_function fnDvxDisableVideoOutputOsd (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_OSD,cDISABLE"
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputOsdColor                           */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the color of the OSD on the video output port.   */
/**************************************************************************/
define_function fnDvxRequestVideoOutputOsdColor (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_OSD_COLOR_REQUEST
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputOsdColor                           */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/* 		char cOsdColor[] - OSD color scheme                       */
/*                                 	Values:                           */
/*                                      	cDVX_OSD_COLOR_BLACK      */
/*                                      	cDVX_OSD_COLOR_BLUE       */
/*                                      	cDVX_OSD_COLOR_WHITE      */
/*                                      	cDVX_OSD_COLOR_YELLOW     */
/*                                                                        */
/* Description:	Sets the OSD color scheme for the video output port.      */
/**************************************************************************/
define_function fnDvxSetVideoOutputOsdColor (dev dvDvxVideoOutputPort, char cOsdColor[])
{
    switch (cOsdColor)
    {
	case cDVX_OSD_COLOR_BLACK:
	case cDVX_OSD_COLOR_BLUE:
	case cDVX_OSD_COLOR_WHITE:
	case cDVX_OSD_COLOR_YELLOW:
	{
	    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_OSD_COLOR,cOsdColor"
	}
    }
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputOsdPosition                        */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the OSD position for the video output port.      */
/**************************************************************************/
define_function fnDvxRequestVideoOutputOsdPosition (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_OSD_POSITION_REQUEST
}

/*******************************************************************************/
/* Function:	fnDvxSetVideoOutputOsdPosition                                 */
/*                                                                             */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX        */
/* 		char cOsdPosition[] - OSD position                             */
/*                                 	Values:                                */
/*                                      	cDVX_OSD_POSITION_TOP_LEFT     */
/*                                      	cDVX_OSD_POSITION_TOP_RIGHT    */
/*                                      	cDVX_OSD_POSITION_BOTTOM_LEFT  */
/*                                      	cDVX_OSD_POSITION_BOTTOM_RIGHT */
/*                                                                             */
/* Description:	Sets the OSD position for the video output port.               */
/*******************************************************************************/
define_function fnDvxSetVideoOutputOsdPosition (dev dvDvxVideoOutputPort, char cOsdPosition[])
{
    switch (cOsdPosition)
    {
	case cDVX_OSD_POSITION_TOP_LEFT:
	case cDVX_OSD_POSITION_TOP_RIGHT:
	case cDVX_OSD_POSITION_BOTTOM_LEFT:
	case cDVX_OSD_POSITION_BOTTOM_RIGHT:
	{
	    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_OSD_COLOR,cOsdPosition"
	}
    }
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputResolution                         */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the resolution and refresh rate of the video     */
/* 		output port.                                              */
/**************************************************************************/
define_function fnDvxRequestVideoOutputResolution (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_RESOLUTION_REQUEST
}

/**************************************************************************/
/* Function:	fnDvxSetVideoOutputResolution                             */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/* 		char cResolution[] - resolution and refresh rate          */
/*				     in form of <hor>x<ver>,<ref>         */
/*                                   E.g:  1920x1080,60                   */
/*                                                                        */
/* Description:	Sets the resolution and refresh rate of the video output  */
/* 		port.                                                     */
/**************************************************************************/
define_function fnDvxSetVideoOutputResolution (dev dvDvxVideoOutputPort, char cResolution[])
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_RESOLUTION,cResolution"
}

/*define_function fnDvxSetVideoOutputResolution (dev dvDvxVideoOutputPort, integer nHorizontal, integer nVertical, integer nProgressiveFlag, integer nRefresh)
{
    if (nProgressiveFlag == FALSE)
	send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_RESOLUTION,itoa(nHorizontal),'x',itoa(nVertical),',',itoa(nRefresh)"
    else if (nProgressiveFlag == TRUE)
	send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_RESOLUTION,itoa(nHorizontal),'x',itoa(nVertical),'p,',itoa(nRefresh)"
}*/

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputScaleMode                          */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the status of the scaling mode on the video      */
/* 		output port.                                              */
/**************************************************************************/
define_function fnDvxRequestVideoOutputScaleMode (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_SCALE_MODE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetVideoOutputScaleMode                               */
/*                                                                         */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX    */
/* 		char cScaleMode[] - scaling mode                           */
/*                                 	Values:                            */
/*                                      	cDVX_SCALE_MODE_AUTO       */
/*                                      	cDVX_SCALE_MODE_BYPASS     */
/*                                      	cDVX_SCALE_MODE_MANUAL     */
/*                                                                         */
/* Description:	Sets the scaling mode on the video output port.            */
/***************************************************************************/
define_function fnDvxSetVideoOutputScaleMode (dev dvDvxVideoOutputPort, char cScaleMode[])
{
    switch (cScaleMode)
    {
	case cDVX_SCALE_MODE_AUTO:
	case cDVX_SCALE_MODE_BYPASS:
	case cDVX_SCALE_MODE_MANUAL:
	{
	    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_SCALE_MODE,cScaleMode"
	}
    }
}

/**************************************************************************/
/* Function:	fnDvxRequestVideoOutputTestPattern                        */
/*                                                                        */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX   */
/*                                                                        */
/* Description:	Requests the test pattern setting for the video output    */
/* 		port.                                                     */
/**************************************************************************/
define_function fnDvxRequestVideoOutputTestPattern (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_TEST_PATTERN_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetVideoOutputTestPattern                               */
/*                                                                           */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX      */
/* 		char cTestPattern[] - test pattern                           */
/*                                 	Values:                              */
/*                                      	cDVX_TEST_PATTERN_OFF        */
/*                                      	cDVX_TEST_PATTERN_COLOR_BAR  */
/*                                      	cDVX_TEST_PATTERN_GRAY_RAMP  */
/*                                      	cDVX_TEST_PATTERN_SMPTE_BAR  */
/*                                      	cDVX_TEST_PATTERN_HILO_TRACK */
/*                                      	cDVX_TEST_PATTERN_PLUGE      */
/*                                      	cDVX_TEST_PATTERN_X_HATCH    */
/*                                      	cDVX_TEST_PATTERN_LOGO_1     */
/*                                      	cDVX_TEST_PATTERN_LOGO_2     */
/*                                      	cDVX_TEST_PATTERN_LOGO_3     */
/*                                                                           */
/* Description:	Sets the test pattern for the video output port.             */
/*****************************************************************************/
define_function fnDvxSetVideoOutputTestPattern (dev dvDvxVideoOutputPort, char cTestPattern[])
{
    switch (cTestPattern)
    {
	case cDVX_TEST_PATTERN_OFF:
	case cDVX_TEST_PATTERN_COLOR_BAR:
	case cDVX_TEST_PATTERN_GRAY_RAMP:
	case cDVX_TEST_PATTERN_SMPTE_BAR:
	case cDVX_TEST_PATTERN_HILO_TRACK:
	case cDVX_TEST_PATTERN_PLUGE:
	case cDVX_TEST_PATTERN_X_HATCH:
	case cDVX_TEST_PATTERN_LOGO_1:
	case cDVX_TEST_PATTERN_LOGO_2:
	case cDVX_TEST_PATTERN_LOGO_3:
	{
	    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_TEST_PATTERN,cTestPattern"
	}
    }
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoOutputVerticalShift                        */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*                                                                          */
/* Description:	Requests the vertical shift value of the video output port. */
/****************************************************************************/
define_function fnDvxRequestVideoOutputVerticalShift (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetVideoOutputVerticalShift                            */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*  		sinteger snVerticalShift - vertical shift value (-127..127) */
/*                                                                          */
/* Description:	Sets the brightness value of the video output port.         */
/****************************************************************************/
define_function fnDvxSetVideoOutputVerticalShift (dev dvDvxVideoOutputPort, sinteger snVerticalShift)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT,itoa(snVerticalShift)"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoOutputVerticalSize                        */
/*                                                                         */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX    */
/*                                                                         */
/* Description:	Requests the vertical size value of the image displayed    */
/* 		on the video output port.                                  */
/***************************************************************************/
define_function fnDvxRequestVideoOutputVerticalSize (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetVideoOutputVerticalSize                             */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*  		integer nVerticalSize - vertical shift value (-127..127)    */
/*                                                                          */
/* Description:	Sets the vertical size value of the image displayed on the  */
/* 		video output port.                                          */
/****************************************************************************/
define_function fnDvxSetVideoOutputVerticalSize (dev dvDvxVideoOutputPort, integer nVerticalSize)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE,itoa(nVerticalSize)"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoOutputZoom                                */
/*                                                                         */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX    */
/*                                                                         */
/* Description:	Requests the zoom setting for the video output port.       */
/***************************************************************************/
define_function fnDvxRequestVideoOutputZoom (dev dvDvxVideoOutputPort)
{
    send_command dvDvxVideoOutputPort, cDVX_COMMAND_VIDEO_OUT_ZOOM_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetVideoOutputZoom                                     */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*  		integer nZoom - zoom value (25..800)                        */
/*                                                                          */
/* Description:	Sets the zoom for the video output port.                    */
/****************************************************************************/
define_function fnDvxSetVideoOutputZoom (dev dvDvxVideoOutputPort, integer nZoom)
{
    send_command dvDvxVideoOutputPort, "cDVX_COMMAND_VIDEO_OUT_ZOOM,itoa(nZoom)"
}




////////////////////////////////////////////////////////
//////////        Video Input Control         //////////
////////////////////////////////////////////////////////

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputBrightness                           */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the brightness of the video input port.           */
/***************************************************************************/
define_function fnDvxRequestVideoInputBrightness (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_BRIGHTNESS_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetVideoInputBrightness                                */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*  		integer nBrightness - brightness value (0..100)             */
/*                                                                          */
/* Description:	Sets the the brightness of the video input port.            */
/****************************************************************************/
define_function fnDvxSetVideoInputBrightness (dev dvDvxVideoInputPort, integer nBrightness)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_BRIGHTNESS,itoa(nBrightness)"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputBlackAndWhiteState                   */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests whether the black and white setting is enabled    */
/* 		on the video input port.                                   */
/***************************************************************************/
define_function fnDvxRequestVideoInputBlackAndWhiteState (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableVideoInputBlackAndWhiteState                    */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Enables the black and white setting on the video input     */
/* 		port.                                                      */
/***************************************************************************/
define_function fnDvxEnableVideoInputBlackAndWhiteState (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE,cENABLE"
}

/***************************************************************************/
/* Function:	fnDvxDisableVideoInputBlackAndWhite                        */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Disables the black and white setting on the video input    */
/* 		port.                                                      */
/***************************************************************************/
define_function fnDvxDisableVideoInputBlackAndWhite (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE,cDISABLE"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputColor                                */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests whether the color setting is enabled on the       */
/* 		video input port.                                          */
/***************************************************************************/
define_function fnDvxRequestVideoInputColor (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_COLOR_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableVideoInputColor                                 */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Enables the color setting on the video input port.         */
/***************************************************************************/
define_function fnDvxEnableVideoInputColor (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_COLOR,cENABLE"
}

/***************************************************************************/
/* Function:	fnDvxDisableVideoInputColor                                */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Disables the color setting on the video input port.        */
/***************************************************************************/
define_function fnDvxDisableVideoInputColor (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_COLOR,cDISABLE"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputContrast                             */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the contrast of the video input port.             */
/***************************************************************************/
define_function fnDvxRequestVideoInputContrast (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_CONTRAST_REQUEST
}


/****************************************************************************/
/* Function:	fnDvxSetVideoInputContrast                                  */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*  		integer nContrast - contrast value (0..100)                 */
/*                                                                          */
/* Description:	Sets the the contrast of the video input port.              */
/****************************************************************************/
define_function fnDvxSetVideoInputContrast (dev dvDvxVideoInputPort, integer nContrast)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_CONTRAST,itoa(nContrast)"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputEdidSource                           */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests which EDID source the video input is mirroring.   */
/***************************************************************************/
define_function fnDvxRequestVideoInputEdidSource (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_EDID_SOURCE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetVideoInputEdidSource                               */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Sets the EDID source to mirror the video input.            */
/***************************************************************************/
define_function fnDvxSetVideoInputEdidSource (dev dvDvxVideoInputPort, char cEdidSource[])
{
    switch (cEdidSource)
    {
	case cDVX_EDID_SOURCE_FULL_SCREEN:
	case cDVX_EDID_SOURCE_WIDE_SCREEN:
	case cDVX_EDID_SOURCE_ALL_RESOLUTIONS:
	case cDVX_EDID_SOURCE_MIRROR_OUTPUT_1:
	case cDVX_EDID_SOURCE_MIRROR_OUTPUT_2:
	case cDVX_EDID_SOURCE_MIRROR_OUTPUT_3:
	case cDVX_EDID_SOURCE_MIRROR_OUTPUT_4:
	{
	    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_EDID_SOURCE,cEdidSource"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestEdidAutoUpdate                                 */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests whether the EDID source for the video input       */
/* 		updates the available list of resolutions at regular       */
/* 		intervals.                                                 */
/***************************************************************************/
define_function fnDvxRequestEdidAutoUpdate (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableEdidAutoUpdate                                  */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Enables the EDID source for the video input to update the   */
/* 		list of available resolutions at regular intervals.        */
/***************************************************************************/
define_function fnDvxEnableEdidAutoUpdate (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO,cENABLE"
}

/***************************************************************************/
/* Function:	fnDvxDisableEdidAutoUpdate                                 */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Disables the EDID source for the video input from updating  */
/* 		the list of available resolutions at regular intervals.    */
/***************************************************************************/
define_function fnDvxDisableEdidAutoUpdate (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO,cDISABLE"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputEdidPreferredResolution              */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the preferred resolution of the EDID source for   */
/* 		the video input.                                           */
/***************************************************************************/
define_function fnDvxRequestVideoInputEdidPreferredResolution (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetVideoInputEdidPreferredResolution                  */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Sets the preferred resolution for the EDID source for      */
/* 		the video input.                                           */
/***************************************************************************/
define_function fnDvxSetVideoInputEdidPreferredResolution (dev dvDvxVideoInputPort, char cResolution[])
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION,cResolution"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoFormat                                    */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the input format of the video port.               */
/***************************************************************************/
define_function fnDvxRequestVideoFormat (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_FORMAT_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetVideoInputFormat                                   */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/* 		char cSignalFormat[] - signal format                       */
/*					Values:                            */
/*					   cVIDEO_SIGNAL_FORMAT_HDMI       */
/*					   cVIDEO_SIGNAL_FORMAT_DVI        */
/*					   cVIDEO_SIGNAL_FORMAT_VGA        */
/*					   cVIDEO_SIGNAL_FORMAT_COMPOSITE  */
/*					   cVIDEO_SIGNAL_FORMAT_COMPONENT  */
/*					   cVIDEO_SIGNAL_FORMAT_SVIDEO     */
/*                                                                         */
/* Description:	Sets the input format of the video port.                   */
/***************************************************************************/
define_function fnDvxSetVideoInputFormat (dev dvDvxVideoInputPort, char cSignalFormat[])
{
    switch (cSignalFormat)
    {
	case cVIDEO_SIGNAL_FORMAT_HDMI:
	case cVIDEO_SIGNAL_FORMAT_DVI:
	case cVIDEO_SIGNAL_FORMAT_VGA:
	case cVIDEO_SIGNAL_FORMAT_COMPOSITE:
	case cVIDEO_SIGNAL_FORMAT_COMPONENT:
	case cVIDEO_SIGNAL_FORMAT_SVIDEO:
	{
	    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_FORMAT,cSignalFormat"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputHdcpCompliance                       */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the HDCP compliance setting of the video port.    */
/***************************************************************************/
define_function fnDvxRequestVideoInputHdcpCompliance (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableVideoInputHdcpCompliance                        */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Enable the HDCP compliance setting on the video port.      */
/***************************************************************************/
define_function fnDvxEnableVideoInputHdcpCompliance (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE,cENABLE"
}

/***************************************************************************/
/* Function:	fnDvxDisableVideoHdcpCompliance                            */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Disable the HDCP compliance setting on the video port.     */
/***************************************************************************/
define_function fnDvxDisableVideoHdcpCompliance (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE,cDISABLE"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputHorizontalShift                      */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the horizontal shift value of the VGA video input */
/* 		port.                                                      */
/***************************************************************************/
define_function fnDvxRequestVideoInputHorizontalShift (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT_REQUEST
}

/******************************************************************************/
/* Function:	fnDvxSetVideoInputHorizontalShift                             */
/*                                                                            */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX         */
/*  		sinteger snHorizontalShift - horizontal shift value (-50..50) */
/*                                                                            */
/* Description:	Sets the horizontal shift value of the VGA video input port.  */
/******************************************************************************/
define_function fnDvxSetVideoInputHorizontalShift (dev dvDvxVideoInputPort, sinteger snHorizontalShift)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT,itoa(snHorizontalShift)"
}

/***************************************************************************/
/* Function:	fnDvxRequestVideoInputHue                                  */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Requests the hue value of the video input port.            */
/***************************************************************************/
define_function fnDvxRequestVideoInputHue (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_HUE_REQUEST
}

/******************************************************************************/
/* Function:	fnDvxSetVideoInputHue                                         */
/*                                                                            */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX         */
/*  		integer nHue - hue (0..100)                                   */
/*                                                                            */
/* Description:	Sets the hue value of the video input port.                   */
/******************************************************************************/
define_function fnDvxSetVideoInputHue (dev dvDvxVideoInputPort, integer nHue)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_HUE,itoa(nHue)"
}

/************************************************************************/
/* Function:	fnDvxRequestVideoInputName                                   */
/*                                                                      */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX   */
/*                                                                      */
/* Description:	Requests the name of the video input port.              */
/************************************************************************/
define_function fnDvxRequestVideoInputName (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_NAME_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetVideoInputName                                     */
/*                                                                         */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX      */
/*                                                                         */
/* Description:	Sets the name of the video input port.                     */
/***************************************************************************/
define_function fnDvxSetVideoInputName (dev dvDvxVideoInputPort, char cName[])
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_NAME,cName"
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoInputPhase                                 */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Requests the input phase value of the VGA video input port. */
/****************************************************************************/
define_function fnDvxRequestVideoInputPhase (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_PHASE_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetVideoInputPhase                                      */
/*                                                                           */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX        */
/*  		integer nPhase - input phase value (0..31)                   */
/*                                                                           */
/* Description:	Sets the horizontal shift value of the VGA video input port. */
/*****************************************************************************/
define_function fnDvxSetVideoInputPhase (dev dvDvxVideoInputPort, integer nPhase)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_PHASE,itoa(nPhase)"
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoInputResolutionAuto                        */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Requests the status of the auto resolution setting on the   */
/*              video input port.                                           */
/****************************************************************************/
define_function fnDvxRequestVideoInputResolutionAuto (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputResolutionAuto                         */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enables the auto resolution setting on the video input      */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxEnableVideoInputResolutionAuto (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO,cENABLE"
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoResolutionAuto                             */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disables the auto resolution setting on the video input     */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxDisableVideoResolutionAuto (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO,cDISABLE"
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoInputResolution                            */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Requests the resolution of the video input port.            */
/****************************************************************************/
define_function fnDvxRequestVideoInputResolution (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_RESOLUTION_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetVideoInputResolution                                */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*  		char cResolution[] - resolution string                      */
/*                                       Format: <hor>x<ver>[i|p],<ref>     */
/*                                                                          */
/* Description:	Sets the resolution of the video input port.                */
/****************************************************************************/
define_function fnDvxSetVideoInputResolution (dev dvDvxVideoInputPort, char cResolution[])
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_RESOLUTION,cResolution"
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoInputSaturation                            */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Requests the saturation level of the video input port.      */
/****************************************************************************/
define_function fnDvxRequestVideoInputSaturation (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_SATURATION_REQUEST
}

/******************************************************************************/
/* Function:	fnDvxSetVideoInputSaturation                                  */
/*                                                                            */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX         */
/*  		integer nSaturation - saturation level (0..100)               */
/*                                                                            */
/* Description:	Sets the saturation level of the video input port.            */
/******************************************************************************/
define_function fnDvxSetVideoInputSaturation (dev dvDvxVideoInputPort, integer nSaturation)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_SATURATION,itoa(nSaturation)"
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoInputStatus                                */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Requests the status of the video input port.                */
/****************************************************************************/
define_function fnDvxRequestVideoInputStatus (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_STATUS_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxRequestVideoInputVerticalShift                         */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Requests the vertical shift value of the RGB video input    */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxRequestVideoInputVerticalShift (dev dvDvxVideoInputPort)
{
    send_command dvDvxVideoInputPort, cDVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetVideoInputVerticalShift                              */
/*                                                                           */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX        */
/*  		sinteger snVerticalShift - vertical shift value (-10..10)    */
/*                                                                           */
/* Description:	Sets the vertical shifting of the RGB video input port.      */
/*****************************************************************************/
define_function fnDvxSetVideoInputVerticalShift (dev dvDvxVideoInputPort, sinteger snVerticalShift)
{
    send_command dvDvxVideoInputPort, "cDVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT,itoa(snVerticalShift)"
}


////////////////////////////////////////////////////////
//////////        Audio Input Control         //////////
////////////////////////////////////////////////////////


/****************************************************************************/
/* Function:	fnDvxRequestAudioInputCompression                           */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the compression setting for the audio input port.  */
/****************************************************************************/
define_function fnDvxRequestAudioInputCompression (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_COMPRESSION_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioInputCompression                               */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/* 		CHAR cCompressionSetting[] - compression setting            */
/*					Values:                             */
/*					   cDVX_COMPRESSION_OFF             */
/*					   cDVX_COMPRESSION_LOW             */
/*					   cDVX_COMPRESSION_MEDIUM          */
/*					   cDVX_COMPRESSION_HIGH            */
/*					   cDVX_COMPRESSION_CUSTOM          */
/*                                                                          */
/* Description:	Sets the compression for the audio input port.              */
/****************************************************************************/
define_function fnDvxSetAudioInputCompression (dev dvDvxAudioInputPort, CHAR cCompressionSetting[])
{
    switch (cCompressionSetting)
    {
	case cDVX_COMPRESSION_OFF:
	case cDVX_COMPRESSION_LOW:
	case cDVX_COMPRESSION_MEDIUM:
	case cDVX_COMPRESSION_HIGH:
	case cDVX_COMPRESSION_CUSTOM:
	{
	    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_COMPRESSION,cCompressionSetting"
	}
    }
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioInputCompressionAttack                     */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the compression attack for the audio input port.   */
/****************************************************************************/
define_function fnDvxRequestAudioInputCompressionAttack (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioInputCompressionAttack                         */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*  		integer nAttack - compression attack (1..2000)              */
/*                                                                          */
/* Description:	Sets the compression attack for the audio input port.       */
/****************************************************************************/
define_function fnDvxSetAudioInputCompressionAttack (dev dvDvxAudioInputPort, integer nAttack)
{

    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK,itoa(nAttack)"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioInputCompressionRatio                      */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the compression ratio for the audio input port.    */
/****************************************************************************/
define_function fnDvxRequestAudioInputCompressionRatio (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioInputCompressionRatio                          */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*  		integer nRatio - compression ratio (1..20)                  */
/*                                                                          */
/* Description:	Sets the compression ratio for the audio input port.        */
/****************************************************************************/
define_function fnDvxSetAudioInputCompressionRatio (dev dvDvxAudioInputPort, integer nRatio)
{

    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO,itoa(nRatio)"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioInputCompressionRelease                    */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the compression release for the audio input port.  */
/****************************************************************************/
define_function fnDvxRequestAudioInputCompressionRelease (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioInputCompressionRelease                        */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*  		integer nRelease - compression release value (1..20)        */
/*                                                                          */
/* Description:	Sets the compression release for the audio input port.      */
/****************************************************************************/
define_function fnDvxSetAudioInputCompressionRelease (dev dvDvxAudioInputPort, integer nRelease)
{

    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE,itoa(nRelease)"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioInputCompressionThreshold                  */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the compression threshold for the audio input      */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxRequestAudioInputCompressionThreshold (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD_REQUEST
}

/******************************************************************************/
/* Function:	fnDvxSetAudioInputCompressionThreshold                        */
/*                                                                            */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX         */
/*  		sinteger snThreshold - compression threshold value (0..-60dB) */
/*                                                                            */
/* Description:	Sets the compression release for the audio input port.        */
/******************************************************************************/
define_function fnDvxSetAudioInputCompressionThreshold (dev dvDvxAudioInputPort, sinteger snThreshold)
{

    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD,itoa(snThreshold)"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioInputGain                                  */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the gain for the audio input port.                 */
/****************************************************************************/
define_function fnDvxRequestAudioInputGain (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_GAIN_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioInputGain                                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX      */
/*  		sinteger snGain - input gain (-24dB..24dB)                 */
/*                                                                         */
/* Description:	Sets the gain for the audio input port.                    */
/***************************************************************************/
define_function fnDvxSetAudioInputGain (dev dvDvxAudioInputPort, sinteger snGain)
{

    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_GAIN,itoa(snGain)"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioInputStereo                                */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Requests the stereo setting for the audio input port.       */
/****************************************************************************/
define_function fnDvxRequestAudioInputStereo (dev dvDvxAudioInputPort)
{
    send_command dvDvxAudioInputPort, cDVX_COMMAND_AUDIO_IN_STEREO_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioInputStereo                                    */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*  		CHAR cStereoSetting[] - stereo setting                      */
/*                                      Values:                             */
/*                                         cDVX_AUDIO_STEREO                */
/*                                         cDVX_AUDIO_MONO                  */
/*                                                                          */
/* Description:	Sets the stereo setting on the audio input port.            */
/****************************************************************************/
define_function fnDvxSetAudioInputStereo (dev dvDvxAudioInputPort, CHAR cStereoSetting[])
{
    switch (cStereoSetting)
    {
	case cDVX_AUDIO_MONO:
	case cDVX_AUDIO_STEREO:
	{
	    send_command dvDvxAudioInputPort, "cDVX_COMMAND_AUDIO_IN_STEREO,cStereoSetting"
	}
    }
}






////////////////////////////////////////////////////////
//////////       Audio Output Control         //////////
////////////////////////////////////////////////////////

/****************************************************************************/
/* Function:	fnDvxRequestAudioOutputBalance                              */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*                                                                          */
/* Description:	Requests the current balance setting for the audio output   */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxRequestAudioOutputBalance (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_BALANCE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputBalance                                 */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		sinteger snBalance - balance (-20dB..20dB)                 */
/*                                                                         */
/* Description:	Sets the balance for the audio output port.                */
/***************************************************************************/
define_function fnDvxSetAudioOutputBalance (dev dvDvxAudioOutputPort, sinteger snBalance)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_BALANCE,itoa(snBalance)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputDelay                               */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the delay for the audio output port.              */
/***************************************************************************/
define_function fnDvxRequestAudioOutputDelay (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_DELAY_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDelay                                   */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nDelay - delay (0..200) in milliseconds            */
/*                                                                         */
/* Description:	Sets the delay for the audio output port.                  */
/***************************************************************************/
define_function fnDvxSetAudioOutputDelay (dev dvDvxAudioOutputPort, integer nDelay)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DELAY,itoa(nDelay)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDuckingAttack                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nAttack - ducking attack (1..2000)                 */
/*                                                                         */
/* Description:	Sets the duration of the attack phase while ducking for    */
/*              the audio output port.                                     */
/***************************************************************************/
define_function fnDvxSetAudioOutputDuckingAttack (dev dvDvxAudioOutputPort, integer nAttack)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DUCKING_ATTACK,itoa(nAttack)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDuckingHold                             */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nHold - ducking hold (0..2000)                     */
/*                                                                         */
/* Description:	Sets the duration of the hold phase while ducking for the  */
/*              audio output port.                                         */
/***************************************************************************/
define_function fnDvxSetAudioOutputDuckingHold (dev dvDvxAudioOutputPort, integer nHold)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DUCKING_HOLD,itoa(nHold)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDuckingLevel                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nLevel - ducking level (0..20)                     */
/*                                                                         */
/* Description:	Sets the level while ducking for the audio output port.    */
/***************************************************************************/
define_function fnDvxSetAudioOutputDuckingLevel (dev dvDvxAudioOutputPort, integer nLevel)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DUCKING_LEVEL,itoa(nLevel)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDuckingRelease                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nRelease - ducking release (10..5000)              */
/*                                                                         */
/* Description:	Sets the duration of the release phase while ducking for   */
/*              the audio output port.                                     */
/***************************************************************************/
define_function fnDvxSetAudioOutputDuckingRelease (dev dvDvxAudioOutputPort, integer nRelease)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DUCKING_RELEASE,itoa(nRelease)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputDuckingThreshold                    */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the current ducking thresholds of both            */
/*              microphones for the audio output port.                     */
/***************************************************************************/
define_function fnDvxRequestAudioOutputDuckingThreshold (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDuckingThreshold                        */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		sinteger snThreshold - ducking threshold (-60..0)          */
/*                                                                         */
/* Description:	Sets the ducking thresholds of both microphones on the     */
/*              audio output port.                                         */
/***************************************************************************/
define_function fnDvxSetAudioOutputDuckingThreshold (dev dvDvxAudioOutputPort, sinteger snThreshold)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD_REQUEST,itoa(snThreshold)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputDucking                             */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the current ducking setting for the audio output  */
/*              port.                                                      */
/***************************************************************************/
define_function fnDvxRequestAudioOutputDucking (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_DUCKING_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputDucking                                 */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		char cDuckingSetting[] - ducking setting                   */
/*                                      Values:                            */
/*                                         cDVX_DUCKING_OFF                */
/*                                         cDVX_DUCKING_LOW                */
/*                                         cDVX_DUCKING_MEDIUM             */
/*                                         cDVX_DUCKING_HIGH               */
/*                                         cDVX_DUCKING_CUSTOM             */
/*                                                                         */
/* Description:	Sets the ducking setting for the audio output port.        */
/***************************************************************************/
define_function fnDvxSetAudioOutputDucking (dev dvDvxAudioOutputPort, char cDuckingSetting[])
{
    switch (cDuckingSetting)
    {
	case cDVX_DUCKING_OFF:
	case cDVX_DUCKING_LOW:
	case cDVX_DUCKING_MEDIUM:
	case cDVX_DUCKING_HIGH:
	case cDVX_DUCKING_CUSTOM:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_DUCKING,cDuckingSetting"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputEqCenterFrequency                   */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nBand - eq band (1..10)                            */
/*                                                                         */
/* Description:	Requests the center frequency on the specified equalizer   */
/*              band for the audio output port.                            */
/***************************************************************************/
define_function fnDvxRequestAudioOutputEqCenterFrequency (dev dvDvxAudioOutputPort, integer nBand)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY_REQUEST,itoa(nBand)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputEqCenterFrequency                       */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nBand - eq band (1..10)                            */
/*  		integer nFrequency - center frequency (20..20000) in Hz    */
/*                                                                         */
/* Description:	Sets the center frequency on the specified equalizer band  */
/*              for the audio output port.                                 */
/***************************************************************************/
define_function fnDvxSetAudioOutputEqCenterFrequency (dev dvDvxAudioOutputPort, integer nBand, integer nFrequency)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY,itoa(nBand),',',itoa(nFrequency)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputEqFilterType                        */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nBand - eq band (1..10)                            */
/*                                                                         */
/* Description:	Requests the filter type on the specified equalizer band   */
/*              for the audio output port.                                 */
/***************************************************************************/
define_function fnDvxRequestAudioOutputEqFilterType (dev dvDvxAudioOutputPort, integer nBand)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE_REQUEST,itoa(nBand)"
}

/****************************************************************************/
/* Function:	fnDvxSetAudioOutputEqFilterType                             */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*  		integer nBand - eq band (1..10)                             */
/*  		char cFilterType[] - filter type                            */
/*                                      Values:                             */
/*                                         cDVX_EQ_FILTER_TYPE_BELL         */
/*                                         cDVX_EQ_FILTER_TYPE_BAND_PASS    */
/*                                         cDVX_EQ_FILTER_TYPE_BAND_STOP    */
/*                                         cDVX_EQ_FILTER_TYPE_HIGH_PASS    */
/*                                         cDVX_EQ_FILTER_TYPE_LOW_PASS     */
/*                                         cDVX_EQ_FILTER_TYPE_TREBLE_SHELF */
/*                                         cDVX_EQ_FILTER_TYPE_BASS_SHELF   */
/*                                                                          */
/* Description:	Sets the filter type on the specified equalizer band for    */
/*              the audio output port.                                      */
/****************************************************************************/
define_function fnDvxSetAudioOutputEqFilterType (dev dvDvxAudioOutputPort, integer nBand, char cFilterType[])
{
    switch (cFilterType)
    {
	case cDVX_EQ_FILTER_TYPE_BELL:
	case cDVX_EQ_FILTER_TYPE_BAND_PASS:
	case cDVX_EQ_FILTER_TYPE_BAND_STOP:
	case cDVX_EQ_FILTER_TYPE_HIGH_PASS:
	case cDVX_EQ_FILTER_TYPE_LOW_PASS:
	case cDVX_EQ_FILTER_TYPE_TREBLE_SHELF:
	case cDVX_EQ_FILTER_TYPE_BASS_SHELF:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE,itoa(nBand),',',cFilterType"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputEqGain                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nBand - eq band (1..10)                            */
/*                                                                         */
/* Description:	Requests the gain on the specified equalizer band for the  */
/*              audio output port.                                         */
/***************************************************************************/
define_function fnDvxRequestAudioOutputEqGain (dev dvDvxAudioOutputPort, integer nBand)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_GAIN_REQUEST,itoa(nBand)"
}

/****************************************************************************/
/* Function:	fnDvxSetAudioOutputEqGain                                   */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*  		integer nBand - eq band (1..10)                             */
/*  		sinteger snGain - gain (-12..12) in dB                      */
/*                                                                          */
/* Description:	Sets the gain on the specified equalizer band for the audio */
/*              audio output port.                                          */
/****************************************************************************/
define_function fnDvxSetAudioOutputEqGain (dev dvDvxAudioOutputPort, integer nBand, sinteger snGain)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_GAIN,itoa(nBand),',',itoa(snGain)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputEqMode                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nBand - eq band (1..10)                            */
/*                                                                         */
/* Description:	Requests the current mode on the specified equalizer band  */
/*              for the audio output port.                                 */
/***************************************************************************/
define_function fnDvxRequestAudioOutputEqMode (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_MODE_REQUEST"
}

/****************************************************************************/
/* Function:	fnDvxSetAudioOutputEqMode                                   */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*  		integer nBand - eq band (1..10)                             */
/*  		char cMode[] - mode                                         */
/*                               Values:                                    */
/*                                  cDVX_EQ_MODE_OFF                        */
/*                                  cDVX_EQ_MODE_MOVIE                      */
/*                                  cDVX_EQ_MODE_MUSIC                      */
/*                                  cDVX_EQ_MODE_VOICE                      */
/*                                                                          */
/* Description:	Sets the mode on the specified equalizer band for the audio */
/*              output port.                                                */
/****************************************************************************/
define_function fnDvxSetAudioOutputEqMode (dev dvDvxAudioOutputPort, char cMode[])
{
    switch (cMode)
    {
	case cDVX_EQ_MODE_OFF:
	case cDVX_EQ_MODE_MOVIE:
	case cDVX_EQ_MODE_MUSIC:
	case cDVX_EQ_MODE_VOICE:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_MODE,cMode"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputEqQualityFactor                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nBand - eq band (1..10)                            */
/*                                                                         */
/* Description:	Requests the quality factor (Q) on the specified equalizer */
/*              band for the audio output port.                            */
/***************************************************************************/
define_function fnDvxRequestAudioOutputEqQualityFactor (dev dvDvxAudioOutputPort, integer nBand)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR_REQUEST,itoa(nBand)"
}

/*********************************************************************************************/
/* Function:	fnDvxSetAudioOutputEqQualityFactor                                           */
/*                                                                                           */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX                      */
/*  		integer nBand - eq band (1..10)                                              */
/*  		float fQualityFactor - quality factor (range depends on current filter type) */
/*                                         Bell:         (0.1 to 20.0)                       */
/*                                         Band Pass:    (0.1 to 20.0)                       */
/*                                         Band Stop:    (0.1 to 20.0)                       */
/*                                         High Pass:    (0.5 to 1.4)                        */
/*                                         Low Pass:     (0.5 to 1.4)                        */
/*                                         Treble Shelf: (0.5 to 1.0)                        */
/*                                         Bass Shelf:   (0.5 to 1.0)                        */
/*                                                                                           */
/* Description:	Sets the quality factor (Q) on the specified equalizer band                  */
/*              for the audio output port.                                                   */
/*********************************************************************************************/
define_function fnDvxSetAudioOutputEqQualityFactor (dev dvDvxAudioOutputPort, integer nBand, float fQualityFactor)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR,itoa(nBand),',',format('%01.1f',fQualityFactor)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputMaximumVolume                       */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the maximum volume for the audio output port.     */
/***************************************************************************/
define_function fnDvxRequestAudioOutputMaximumVolume (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputMaximumVolume                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nVolume - maximum volume (0 to 100) in percent     */
/*                                                                         */
/* Description:	Sets the maximum volume for the audio output port.         */
/***************************************************************************/
define_function fnDvxSetAudioOutputMaximumVolume (dev dvDvxAudioOutputPort, integer nVolume)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME,itoa(nVolume)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputMinimumVolume                       */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the minimum volume for the audio output port.     */
/***************************************************************************/
define_function fnDvxRequestAudioOutputMinimumVolume (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputMinimumVolume                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nVolume - minimum volume (0 to 100) in percent     */
/*                                                                         */
/* Description:	Sets the minimum volume for the audio output port.         */
/***************************************************************************/
define_function fnDvxSetAudioOutputMinimumVolume (dev dvDvxAudioOutputPort, integer nVolume)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME,itoa(nVolume)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputMute                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests mute status for the audio output port.            */
/***************************************************************************/
define_function fnDvxRequestAudioOutputMute (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_MUTE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableAudioOutputMute                                 */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Enables mute for the audio output port.                    */
/***************************************************************************/
define_function fnDvxEnableAudioOutputMute (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_MUTE,cENABLE"
}

/***************************************************************************/
/* Function:	fnDvxDisableAudioOutputMute                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Disables mute for the audio output port.                   */
/***************************************************************************/
define_function fnDvxDisableAudioOutputMute (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_MUTE,cDISABLE"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputStereo                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests if audio amp output is in stereo.                 */
/***************************************************************************/
define_function fnDvxRequestAudioOutputStereo (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_STEREO_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableAudioOutputStereo                               */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Enables audio amp output in stereo.                        */
/***************************************************************************/
define_function fnDvxEnableAudioOutputStereo (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_STEREO,cENABLE"
}

/***************************************************************************/
/* Function:	fnDvxDisableAudioOutputStereo                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Disables audio amp output in stereo.                       */
/***************************************************************************/
define_function fnDvxDisableAudioOutputStereo (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_STEREO,cDISABLE"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputTestTone                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the frequency for of the test tone for the audio  */
/*              output port.                                               */
/***************************************************************************/
define_function fnDvxRequestAudioOutputTestTone (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_TEST_TONE_REQUEST
}

/*****************************************************************************/
/* Function:	fnDvxSetAudioOutputTestTone                                  */
/*                                                                           */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX      */
/*  		char cTestToneFrequency[] - test tone frequncy               */
/*                                  Values:                                  */
/*                                   cDVX_TEST_TONE_FREQUENCY_OFF            */
/*                                   cDVX_TEST_TONE_FREQUENCY_60_HZ          */
/*                                   cDVX_TEST_TONE_FREQUENCY_250_HZ         */
/*                                   cDVX_TEST_TONE_FREQUENCY_400_HZ         */
/*                                   cDVX_TEST_TONE_FREQUENCY_1_KHZ          */
/*                                   cDVX_TEST_TONE_FREQUENCY_3_KHZ          */
/*                                   cDVX_TEST_TONE_FREQUENCY_5_KHZ          */
/*                                   cDVX_TEST_TONE_FREQUENCY_10_KHZ         */
/*                                   cDVX_TEST_TONE_FREQUENCY_PINK_NOISE     */
/*                                   cDVX_TEST_TONE_FREQUENCY_WHITE_NOISE    */
/*                                                                           */
/* Description:	Sets the frequency of a test tone for the audio output port. */
/*****************************************************************************/
define_function fnDvxSetAudioOutputTestTone (dev dvDvxAudioOutputPort, char cTestToneFrequency[])
{
    switch (cTestToneFrequency)
    {
	case cDVX_TEST_TONE_FREQUENCY_OFF:
	case cDVX_TEST_TONE_FREQUENCY_60_HZ:
	case cDVX_TEST_TONE_FREQUENCY_250_HZ:
	case cDVX_TEST_TONE_FREQUENCY_400_HZ:
	case cDVX_TEST_TONE_FREQUENCY_1_KHZ:
	case cDVX_TEST_TONE_FREQUENCY_3_KHZ:
	case cDVX_TEST_TONE_FREQUENCY_5_KHZ:
	case cDVX_TEST_TONE_FREQUENCY_10_KHZ:
	case cDVX_TEST_TONE_FREQUENCY_PINK_NOISE:
	case cDVX_TEST_TONE_FREQUENCY_WHITE_NOISE:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_TEST_TONE,cTestToneFrequency"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputVolume                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the volume setting for the audio output port.     */
/***************************************************************************/
define_function fnDvxRequestAudioOutputVolume (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_VOLUME_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputVolume                                  */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nVolume - volume (0 to 100) in percent             */
/*                                                                         */
/* Description:	Sets the volume on the audio output port.                  */
/***************************************************************************/
define_function fnDvxSetAudioOutputVolume (dev dvDvxAudioOutputPort, integer nVolume)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_VOLUME,itoa(nVolume)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputHdmiAudio                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the HDMI output port used by the audio output     */
/*              port.                                                      */
/***************************************************************************/
define_function fnDvxRequestAudioOutputHdmiAudio (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_HDMI_AUDIO_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioOutputHdmiAudio                                */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*  		char cHdmiAudioOutputOption[] - HDMI audio output option    */
/*                                  Values:                                 */
/*                                   cDVX_HDMI_AUDIO_OUTPUT_OFF             */
/*                                   cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1    */
/*                                   cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2    */
/*                                   cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3    */
/*                                   cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4    */
/*                                   cDVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU */
/*                                                                          */
/* Description:	Sets the output used by the HDMI output port.               */
/****************************************************************************/
define_function fnDvxSetAudioOutputHdmiAudio (dev dvDvxAudioOutputPort, char cHdmiAudioOutputOption[])
{
    switch (cHdmiAudioOutputOption)
    {
	case cDVX_HDMI_AUDIO_OUTPUT_OFF:
	case cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1:
	case cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2:
	case cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3:
	case cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4:
	case cDVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_HDMI_AUDIO,cHdmiAudioOutputOption"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputHdmiEq                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests the status of the HDMI equalizer for the audio    */
/*              output port.                                               */
/***************************************************************************/
define_function fnDvxRequestAudioOutputHdmiEq (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_HDMI_EQ_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableAudioOutputHdmiEq                               */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Enables the HDMI equalizer on the audio output port.       */
/***************************************************************************/
define_function fnDvxEnableAudioOutputHdmiEq (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_HDMI_EQ,cON"
}

/***************************************************************************/
/* Function:	fnDvxDisableAudioOutputHdmiEq                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Disables the HDMI equalizer on the audio output port.      */
/***************************************************************************/
define_function fnDvxDisableAudioOutputHdmiEq (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_HDMI_EQ,cOFF"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputSpdifAudio                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*                                                                         */
/* Description:	Requests to which audio output the SPDIF audio output port */
/*              connects.                                                  */
/***************************************************************************/
define_function fnDvxRequestAudioOutputSpdifAudio (dev dvDvxAudioOutputPort)
{
    send_command dvDvxAudioOutputPort, cDVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputSpdifAudio                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		char cSpdifAudioOutputOption[] - SPDIF audio output option */
/*                                  Values:                                */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_OFF           */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_1    */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_2    */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_3    */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_4    */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_1  */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_2  */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_3  */
/*                                   cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_4  */
/*                                                                         */
/* Description:	Sets which audio output the SPDIF audio output port        */
/*              connects to.                                               */
/***************************************************************************/
define_function fnDvxSetAudioOutputSpdifAudio (dev dvDvxAudioOutputPort, char cSpdifAudioOutputOption[])
{
    switch (cSpdifAudioOutputOption)
    {
	case cDVX_SPDIF_AUDIO_OUTPUT_OFF:
	case cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_1:
	case cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_2:
	case cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_3:
	case cDVX_SPDIF_AUDIO_OUTPUT_HDMI_OUT_4:
	case cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_1:
	case cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_2:
	case cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_3:
	case cDVX_SPDIF_AUDIO_OUTPUT_ANALOG_OUT_4:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO,cSpdifAudioOutputOption"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioOutputMixLevel                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		integer nInput - input port                                */
/*                                  Values:                                */
/*                                   nDVX_MIX_INPUT_LINE                   */
/*                                   nDVX_MIX_INPUT_MIC1                   */
/*                                   nDVX_MIX_INPUT_MIC2                   */
/*  		integer nInput - input port                                */
/*                                  Values:                                */
/*                                   nDVX_MIX_OUTPUT_1_AMP                 */
/*                                   nDVX_MIX_OUTPUT_2_LINE                */
/*                                   nDVX_MIX_OUTPUT_3_LINE                */
/*                                   nDVX_MIX_OUTPUT_4_LINE                */
/*                                                                         */
/* Description:	Requests the mix level contribution of the specified audio */
/*              input to the audio output port's mixer.                    */
/***************************************************************************/
define_function fnDvxRequestAudioOutputMixLevel (dev dvDvxAudioOutputPort, integer nInput, integer nOutput)
{
    switch (nInput)
    {
	case nDVX_MIX_INPUT_LINE:
	case nDVX_MIX_INPUT_MIC1:
	case nDVX_MIX_INPUT_MIC2:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_MIX_LEVEL_REQUEST,itoa(nInput),',',itoa(nOutput)"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxSetAudioOutputMixLevel                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX    */
/*  		sinteger snMixLevel - mix level (-100 to 0)                */
/*  		integer nInput - input port                                */
/*                                  Values:                                */
/*                                   nDVX_MIX_INPUT_LINE                   */
/*                                   nDVX_MIX_INPUT_MIC1                   */
/*                                   nDVX_MIX_INPUT_MIC2                   */
/*  		integer nInput - input port                                */
/*                                  Values:                                */
/*                                   nDVX_MIX_OUTPUT_1_AMP                 */
/*                                   nDVX_MIX_OUTPUT_2_LINE                */
/*                                   nDVX_MIX_OUTPUT_3_LINE                */
/*                                   nDVX_MIX_OUTPUT_4_LINE                */
/*                                                                         */
/* Description:	Sets the mix level contribution of the specified audio     */
/*              input to the audio output port's mixer.                    */
/***************************************************************************/
define_function fnDvxSetAudioOutputMixLevel (dev dvDvxAudioOutputPort, sinteger snMixLevel, integer nInput, integer nOutput)
{
    switch (nInput)
    {
	case nDVX_MIX_INPUT_LINE:
	case nDVX_MIX_INPUT_MIC1:
	case nDVX_MIX_INPUT_MIC2:
	{
	    send_command dvDvxAudioOutputPort, "cDVX_COMMAND_AUDIO_MIX_LEVEL,itoa(snMixLevel),',',itoa(nInput),',',itoa(nOutput)"
	}
    }
}

////////////////////////////////////////////////////////
//////////     Audio Microphone Control       //////////
////////////////////////////////////////////////////////

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicCompression                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the compression setting for the microphone port.  */
/***************************************************************************/
define_function fnDvxRequestAudioMicCompression (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_COMPRESSION_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicCompression                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		char cCompressionSetting[] - compression setting           */
/*                                  Values:                                */
/*                                   cDVX_COMPRESSION_OFF                  */
/*                                   cDVX_COMPRESSION_LOW                  */
/*                                   cDVX_COMPRESSION_MEDIUM               */
/*                                   cDVX_COMPRESSION_HIGH                 */
/*                                   cDVX_COMPRESSION_CUSTOM               */
/*                                                                         */
/* Description:	Sets the compression setting for the microphone port.      */
/***************************************************************************/
define_function fnDvxSetAudioMicCompression (dev dvDvxAudioMicPort, char cCompressionSetting[])
{
    switch (cCompressionSetting)
    {
	case cDVX_COMPRESSION_OFF:
	case cDVX_COMPRESSION_LOW:
	case cDVX_COMPRESSION_MEDIUM:
	case cDVX_COMPRESSION_HIGH:
	case cDVX_COMPRESSION_CUSTOM:
	{
	    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_COMPRESSION,cCompressionSetting" 
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicCompressionAttack                      */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the compression attack for the    */
/*              microphone port.                                           */
/***************************************************************************/
define_function fnDvxRequestAudioMicCompressionAttack (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicCompressionAttack                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nAttack - attack duration (1 to 2000) in ms        */
/*                                                                         */
/* Description:	Sets the duration of the attack phase while compressing    */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicCompressionAttack (dev dvDvxAudioMicPort, integer nAttack)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK,itoa(nAttack)"
}



/***************************************************************************/
/* Function:	fnDvxRequestAudioMicCompressionRatio                       */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the compression ratio for the microphone port.    */
/***************************************************************************/
define_function fnDvxRequestAudioMicCompressionRatio (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicCompressionAttack                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nRatio - compression ratio (1 to 20)               */
/*                                                                         */
/* Description:	Sets the compression ratio for the microphone port.        */
/***************************************************************************/
define_function fnDvxSetAudioMicRatio (dev dvDvxAudioMicPort, integer nRatio)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO,itoa(nRatio)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicCompressionRelease                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the release phase while           */
/*              compressing for the microphone port.                       */
/***************************************************************************/
define_function fnDvxRequestAudioMicCompressionRelease (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicRelease                                    */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nRelease - release duration (1 to 5000) in ms      */
/*                                                                         */
/* Description:	Sets the duration of the release phase while compressing   */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicRelease (dev dvDvxAudioMicPort, integer nRelease)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE,itoa(nRelease)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicCompressionThreshold                   */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the threshold while compressing for the           */
/*              microphone port.                                           */
/***************************************************************************/
define_function fnDvxRequestAudioMicCompressionThreshold (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicThreshold                                  */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		sinteger snThreshold - threshold (0 to -60)                */
/*                                                                         */
/* Description:	Sets the threshold while compressing the microphone port.  */
/***************************************************************************/
define_function fnDvxSetAudioMicThreshold (dev dvDvxAudioMicPort, sinteger snThreshold)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD,itoa(snThreshold)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicDuckingAttack                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nAttack - attack duration (1 to 2000) in ms        */
/*                                                                         */
/* Description:	Sets the duration of the attack phase while ducking for    */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicDuckingAttack (dev dvDvxAudioMicPort, integer nAttack)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_DUCKING_ATTACK,itoa(nAttack)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicDuckingHold                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nHold - hold duration (0 to 2000) in ms            */
/*                                                                         */
/* Description:	Sets the duration of the hold phase while compressing for  */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicDuckingHold (dev dvDvxAudioMicPort, integer nHold)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_DUCKING_HOLD,itoa(nHold)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicDuckingLevel                               */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nLevel - release duration (1 to 5000) in ms        */
/*                                                                         */
/* Description:	Sets the level while ducking for the microphone portt.     */
/***************************************************************************/
define_function fnDvxSetAudioMicDuckingLevel (dev dvDvxAudioMicPort, integer nLevel)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_DUCKING_LEVEL,itoa(nLevel)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicDuckingRelease                             */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nRelease - release duration (10 to 5000) in ms     */
/*                                                                         */
/* Description:	Sets the duration of the release phase while ducking for   */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicDuckingRelease (dev dvDvxAudioMicPort, integer nRelease)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_DUCKING_RELEASE,itoa(nRelease)"
}


/*	// INVALID - DOCUMENTATION WAS INCORRECT 
define_function fnDvxRequestAudioMicEq (dev dvDvxAudioMicPort, integer nBand)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_REQUEST,itoa(nBand)"
}

define_function fnDvxSetAudioMicEq (dev dvDvxAudioMicPort, integer nBand, sinteger snValue)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ,itoa(nBand),',',itoa(snValue)"
}
*/

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicEqCenterFrequency                      */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..3)                             */
/*                                                                         */
/* Description:	Requests the frequency for the specified band of the       */
/*              equalizer for the microphone port.                         */
/***************************************************************************/
define_function fnDvxRequestAudioMicEqCenterFrequency (dev dvDvxAudioMicPort, integer nBand)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY_REQUEST,itoa(nBand)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicEqCenterFrequency                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..10)                            */
/*  		integer nFrequency - center frequency (20..20000) in Hz    */
/*                                                                         */
/* Description:	Sets the center frequency on the specified equalizer band  */
/*              for the microphone  port.                                  */
/***************************************************************************/
define_function fnDvxSetAudioMicEqCenterFrequency (dev dvDvxAudioMicPort, integer nBand, sinteger snValue)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY,itoa(nBand),',',itoa(snValue)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicEqFilterType                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..3)                             */
/*                                                                         */
/* Description:	Requests the filter type of the specified band of the      */
/*              equalizer for the microphone port.                         */
/***************************************************************************/
define_function fnDvxRequestAudioMicEqFilterType (dev dvDvxAudioMicPort, integer nBand)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE_REQUEST,itoa(nBand)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicEqFilterType                               */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..3)                             */
/*  		char cFilterType[] - filter type                           */
/*                                  Values:                                */
/*                                   cDVX_EQ_FILTER_TYPE_BELL              */
/*                                   cDVX_EQ_FILTER_TYPE_BAND_PASS         */
/*                                   cDVX_EQ_FILTER_TYPE_BAND_STOP         */
/*                                   cDVX_EQ_FILTER_TYPE_HIGH_PASS         */
/*                                   cDVX_EQ_FILTER_TYPE_LOW_PASS          */
/*                                   cDVX_EQ_FILTER_TYPE_TREBLE_SHELF      */
/*                                   cDVX_EQ_FILTER_TYPE_BASS_SHELF        */
/*                                                                         */
/* Description:	Sets the filter type of the specified band of the          */
/*              equalizer for the microphone port.                         */
/***************************************************************************/
define_function fnDvxSetAudioMicEqFilterType (dev dvDvxAudioMicPort, integer nBand, char cFilterType[])
{
    switch (cFilterType)
    {
	case cDVX_EQ_FILTER_TYPE_BELL:
	case cDVX_EQ_FILTER_TYPE_BAND_PASS:
	case cDVX_EQ_FILTER_TYPE_BAND_STOP:
	case cDVX_EQ_FILTER_TYPE_HIGH_PASS:
	case cDVX_EQ_FILTER_TYPE_LOW_PASS:
	case cDVX_EQ_FILTER_TYPE_TREBLE_SHELF:
	case cDVX_EQ_FILTER_TYPE_BASS_SHELF:
	{
	    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE,itoa(nBand),',',cFilterType"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicEqGain                                 */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..3)                             */
/*                                                                         */
/* Description:	Requests the gain on the specified band of the equalizer   */
/*              for the microphone port.                                   */
/***************************************************************************/
define_function fnDvxRequestAudioMicEqGain (dev dvDvxAudioMicPort, integer nBand)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_GAIN_REQUEST,itoa(nBand)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicEqGain                                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..10)                            */
/*  		sinteger snGain - gain (-12..12) in dB                     */
/*                                                                         */
/* Description:	Sets the gain on the specified equalizer band for the      */
/*              microphone  port.                                          */
/***************************************************************************/
define_function fnDvxSetAudioMicEqGain (dev dvDvxAudioMicPort, integer nBand, sinteger snGain)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_GAIN,itoa(nBand),',',itoa(snGain)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicEqQualityFactor                        */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..3)                             */
/*                                                                         */
/* Description:	Requests the quality factor (Q) for the specified band of  */
/*              the equalizer for the microphone port.                     */
/***************************************************************************/
define_function fnDvxRequestAudioMicEqQualityFactor (dev dvDvxAudioMicPort, integer nBand)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR_REQUEST,itoa(nBand)"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicEqQualityFactor                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nBand - eq band (1..3)                             */
/*  		float fQualityFactor - quality factor (0.1 to 20)          */
/*                                                                         */
/* Description:	Sets the quality factor (Q) for the specified band of the  */
/*              equalizer for the microphone port.                         */
/***************************************************************************/
define_function fnDvxSetAudioMicEqQualityFactor (dev dvDvxAudioMicPort, integer nBand, float fQualityFactor)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR,itoa(nBand),',',format('%01.1f',fQualityFactor)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGain                                   */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the gain setting for the microphone port.         */
/***************************************************************************/
define_function fnDvxRequestAudioMicGain (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GAIN_REQUEST"
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGain                                       */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		sinteger snGain - gain(-24..24) in dB                      */
/*                                                                         */
/* Description:	Sets the gain for the microphone port.                     */
/***************************************************************************/
define_function fnDvxSetAudioMicGain (dev dvDvxAudioMicPort, sinteger snGain)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GAIN,itoa(snGain)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGating                                 */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the gating setting for the microphone port.       */
/***************************************************************************/
define_function fnDvxRequestAudioMicGating (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_GATING_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGating                                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		char cGatingSetting[] - gating setting                     */
/*                                  Values:                                */
/*                                   cDVX_GATING_OFF                       */
/*                                   cDVX_GATING_LOW                       */
/*                                   cDVX_GATING_MEDIUM                    */
/*                                   cDVX_GATING_HIGH                      */
/*                                   cDVX_GATING_CUSTOM                    */
/*                                                                         */
/* Description:	Sets the gating setting for the microphone port.           */
/***************************************************************************/
define_function fnDvxSetAudioMicGating (dev dvDvxAudioMicPort, char cGatingSetting[])
{
    switch (cGatingSetting)
    {
	case cDVX_GATING_OFF:
	case cDVX_GATING_LOW:
	case cDVX_GATING_MEDIUM:
	case cDVX_GATING_HIGH:
	case cDVX_GATING_CUSTOM:
	{
	    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GATING,cGatingSetting"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGatingAttack                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the attack phase while gating     */
/*              for the microphone port.                                   */
/***************************************************************************/
define_function fnDvxRequestAudioMicGatingAttack (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_GATING_ATTACK_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGatingAttack                               */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nAttack - attack duration (1..2000) in ms          */
/*                                                                         */
/* Description:	Sets the duration of the attack phase while gatin for the  */
/*              microphone port.                                           */
/***************************************************************************/
define_function fnDvxSetAudioMicGatingAttack (dev dvDvxAudioMicPort, integer nAttack)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GATING_ATTACK,itoa(nAttack)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGatingDepth                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the depth while gating for the microphone port.   */
/***************************************************************************/
define_function fnDvxRequestAudioMicGatingDepth (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_GATING_DEPTH_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGatingDepth                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nDepth - gating depth (0..20)                      */
/*                                                                         */
/* Description:	Requests the depth while gating for the microphone port.   */
/***************************************************************************/
define_function fnDvxSetAudioMicGatingDepth (dev dvDvxAudioMicPort, integer nDepth)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GATING_DEPTH,itoa(nDepth)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGatingHold                             */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the hold phase while gating for   */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxRequestAudioMicGatingHold (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_GATING_HOLD_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGatingHold                                 */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nHold - hold duration (0..2000) in ms              */
/*                                                                         */
/* Description:	Sets the duration of the hold phase while gatin for the    */
/*              microphone port.                                           */
/***************************************************************************/
define_function fnDvxSetAudioMicGatingHold (dev dvDvxAudioMicPort, integer nHold)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GATING_HOLD,itoa(nHold)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGatingRelease                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the release phase while gating    */
/*              for the microphone port.                                   */
/***************************************************************************/
define_function fnDvxRequestAudioMicGatingRelease (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_GATING_RELEASE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGatingRelease                              */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nHold - hold duration (10..5000) in ms             */
/*                                                                         */
/* Description:	Sets the duration of the release phase while gatin for the */
/*              microphone port.                                           */
/***************************************************************************/
define_function fnDvxSetAudioMicGatingRelease (dev dvDvxAudioMicPort, integer nRelease)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GATING_RELEASE,itoa(nRelease)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicGatingTheshold                         */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the gating threshold for the microphone port.     */
/***************************************************************************/
define_function fnDvxRequestAudioMicGatingTheshold (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicGatingThreshold                            */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		sinteger snThreshold - threshold (0..-60)                  */
/*                                                                         */
/* Description:	Sets the gating threshold for the microphone port.         */
/***************************************************************************/
define_function fnDvxSetAudioMicGatingThreshold (dev dvDvxAudioMicPort, sinteger snThreshold)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD,itoa(snThreshold)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicLimiter                                */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the limiter for the microphone port.              */
/***************************************************************************/
define_function fnDvxRequestAudioMicLimiter (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_LIMITER_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicLimiter                                    */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		char cLimiterSetting[] - limiter setting                   */
/*                                  Values:                                */
/*                                   cDVX_LIMITER_OFF                      */
/*                                   cDVX_LIMITER_LOW                      */
/*                                   cDVX_LIMITER_MEDIUM                   */
/*                                   cDVX_LIMITER_HIGH                     */
/*                                   cDVX_LIMITER_CUSTOM                   */
/*                                                                         */
/* Description:	Sets the limiter for the microphone port.                  */
/***************************************************************************/
define_function fnDvxSetAudioMicLimiter (dev dvDvxAudioMicPort, char cLimiterSetting[])
{
    switch (cLimiterSetting)
    {
	case cDVX_LIMITER_OFF:
	case cDVX_LIMITER_LOW:
	case cDVX_LIMITER_MEDIUM:
	case cDVX_LIMITER_HIGH:
	case cDVX_LIMITER_CUSTOM:
	{
	    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_LIMITER,cLimiterSetting"
	}
    }
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicLimiterAttack                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the attack phase while limiting   */
/*              for the microphone port.                                   */
/***************************************************************************/
define_function fnDvxRequestAudioMicLimiterAttack (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicLimiterAttack                          */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nAttack - attack duration (1..2000) in ms          */
/*                                                                         */
/* Description:	Sets the duration of the attack phase while limiting for   */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicLimiterAttack (dev dvDvxAudioMicPort, integer nAttack)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK,itoa(nAttack)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicLimiterRelease                         */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the duration of the release phase while limiting  */
/*              for the microphone port.                                   */
/***************************************************************************/
define_function fnDvxRequestAudioMicLimiterRelease (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicLimiterRelease                             */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		integer nRelease - release duration (10..5000) in ms       */
/*                                                                         */
/* Description:	Sets the duration of the release phase while limiting for  */
/*              the microphone port.                                       */
/***************************************************************************/
define_function fnDvxSetAudioMicLimiterRelease (dev dvDvxAudioMicPort, integer nRelease)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE,itoa(nRelease)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicLimiterThreshold                       */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the threshold while limiting for the microphone   */
/*              port.                                                      */
/***************************************************************************/
define_function fnDvxRequestAudioMicLimiterThreshold (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxSetAudioMicLimiterThreshold                           */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*  		sinteger snThreshold - threshold (0..-60)                  */
/*                                                                         */
/* Description:	Sets the threshold while limiting for the microphone port. */
/***************************************************************************/
define_function fnDvxSetAudioMicLimiterThreshold (dev dvDvxAudioMicPort, sinteger snThreshold)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD,itoa(snThreshold)"
}

/***************************************************************************/
/* Function:	fnDvxRequestAudioMicOn                                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Requests the status of the microphone port.                */
/***************************************************************************/
define_function fnDvxRequestAudioMicOn (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_ON_REQUEST
}

/***************************************************************************/
/* Function:	fnDvxEnableAudioMicOn                                      */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Turns on the microphone port.                              */
/***************************************************************************/
define_function fnDvxEnableAudioMicOn (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_ON,cON"
}

/***************************************************************************/
/* Function:	fnDvxDisableAudioMicOn                                     */
/*                                                                         */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX   */
/*                                                                         */
/* Description:	Turns off the microphone port.                             */
/***************************************************************************/
define_function fnDvxDisableAudioMicOn (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_ON,cOFF"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioMicPhantomPower                            */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*                                                                          */
/* Description:	Requests the phantom power setting forvthe microphone port. */
/****************************************************************************/
define_function fnDvxRequestAudioMicPhantomPower (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_PHANTOM_POWER_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxEnableAudioMicPhantomPower                             */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*                                                                          */
/* Description:	Turns on phantom power for the microphone port.             */
/****************************************************************************/
define_function fnDvxEnableAudioMicPhantomPower (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_PHANTOM_POWER,cON"
}

/****************************************************************************/
/* Function:	fnDvxDisableAudioMicPhantomPower                            */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*                                                                          */
/* Description:	Turns off phantom power for the microphone port.            */
/****************************************************************************/
define_function fnDvxDisableAudioMicPhantomPower (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_PHANTOM_POWER,cOFF"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioMicPreampGain                              */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*                                                                          */
/* Description:	Requests the pre-amplifier gain setting of the microphone   */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxRequestAudioMicPreampGain (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_PREAMP_GAIN_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioMicPreampGain                                  */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*  		integer nGain - gain (0..100) in percent %                  */
/*                                                                          */
/* Description:	Sets the pre-amplifier gain on the microphone port.         */
/****************************************************************************/
define_function fnDvxSetAudioMicPreampGain (dev dvDvxAudioMicPort, integer nGain)
{
    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_PREAMP_GAIN,itoa(nGain)"
}

/****************************************************************************/
/* Function:	fnDvxRequestAudioMicStereo                                  */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*                                                                          */
/* Description:	Requests the microphone port that is/are in use.            */
/****************************************************************************/
define_function fnDvxRequestAudioMicStereo (dev dvDvxAudioMicPort)
{
    send_command dvDvxAudioMicPort, cDVX_COMMAND_AUDIO_MIC_STEREO_REQUEST
}

/****************************************************************************/
/* Function:	fnDvxSetAudioMicStereo                                      */
/*                                                                          */
/* Arguments:	dev dvDvxAudioMicPort - audio microphone port on the DVX    */
/*  		char cMicType[] - type of microphone                        */
/*                                  Values:                                 */
/*                                   cDVX_MIC_TYPE_DUAL_MONO                */
/*                                   cDVX_MIC_TYPE_SINGLE_STEREO            */
/*                                                                          */
/* Description:	Sets the microphone to be used by the microphone port.      */
/****************************************************************************/
define_function fnDvxSetAudioMicStereo (dev dvDvxAudioMicPort, char cMicType[])
{
    switch (cMicType)
    {
	case cDVX_MIC_TYPE_DUAL_MONO:
	case cDVX_MIC_TYPE_SINGLE_STEREO:
	{
	    send_command dvDvxAudioMicPort, "cDVX_COMMAND_AUDIO_MIC_STEREO,cMicType"
	}
    }
}



////////////////////////// Control via NetLinx channels ///////////////////////


///// System /////


/****************************************************************************/
/* Function:	fnDvxEnableStanbyMode                                       */
/*                                                                          */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX                          */
/*                                                                          */
/* Description:	Enter standby mode on the DVX.                              */
/****************************************************************************/
define_function fnDvxEnableStanbyMode (dev dvDvxPort1)
{
    on[dvDvxPort1, nDVX_CHANNEL_STANDBY_MODE]
}

/****************************************************************************/
/* Function:	fnDvxDisableStanbyMode                                      */
/*                                                                          */
/* Arguments:	dev dvDvxPort1 - port 1 on the DVX                          */
/*                                                                          */
/* Description:	Exit standby mode on the DVX.                               */
/****************************************************************************/
define_function fnDvxDisableStanbyMode (dev dvDvxPort1)
{
    off[dvDvxPort1, nDVX_CHANNEL_STANDBY_MODE]
}

///// Switching /////


/****************************************************************************/
/* Function:	fnDvxCycleOutputSource                                      */
/*                                                                          */
/* Arguments:	dev dvDvxOutputPort - audio or video output port on the DVX */
/*                                                                          */
/* Description:	Cycle sources on the output.                                */
/****************************************************************************/
define_function fnDvxCycleOutputSource (dev dvDvxOutputPort)
{
    // Cycles both the audio and video output source.
    // NOTE: if the video and audio sources on the same output number are different prior to the cycle
    // then the audio source input number will be sent to the same input number as the video input source
    // after the cycle.
    pulse[dvDvxOutputPort, nDVX_CHANNEL_OUTPUT_SOURCE_CYCLE]
}


///// Audio input /////


/****************************************************************************/
/* Function:	fnDvxEnableAudioInputGainRampUp                             */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Start ramping up gain on the audio input port.              */
/****************************************************************************/
define_function fnDvxEnableAudioInputGainRampUp (dev dvDvxAudioInputPort)
{
    on[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableAudioInputGainRampUp                            */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Stop ramping up gain on the audio input port.               */
/****************************************************************************/
define_function fnDvxDisableAudioInputGainRampUp (dev dvDvxAudioInputPort)
{
    off[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableAudioInputGainRampDown                           */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Start ramping down gain on the audio input port.            */
/****************************************************************************/
define_function fnDvxEnableAudioInputGainRampDown (dev dvDvxAudioInputPort)
{
    on[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableAudioInputGainRampDown                          */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Stop ramping down gain on the audio input port.             */
/****************************************************************************/
define_function fnDvxDisableAudioInputGainRampDown (dev dvDvxAudioInputPort)
{
    off[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxEnableAudioInputGainMute                               */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Enable gain mute on the audio input port.                   */
/****************************************************************************/
define_function fnDvxEnableAudioInputGainMute (dev dvDvxAudioInputPort)
{
    on[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE]
}

/****************************************************************************/
/* Function:	fnDvxDisableAudioInputGainMute                              */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Disable gain mute on the audio input port.                  */
/****************************************************************************/
define_function fnDvxDisableAudioInputGainMute (dev dvDvxAudioInputPort)
{
    off[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE]
}

/****************************************************************************/
/* Function:	fnDvxCycleAudioInputGain                                    */
/*                                                                          */
/* Arguments:	dev dvDvxAudioInputPort - audio input port on the DVX       */
/*                                                                          */
/* Description:	Cycle gain mute on the audio input port.                    */
/****************************************************************************/
define_function fnDvxCycleAudioInputGain (dev dvDvxAudioInputPort)
{
    pulse[dvDvxAudioInputPort, nDVX_CHANNEL_AUDIO_INPUT_GAIN_CYCLE]
}


///// Audio output /////


/****************************************************************************/
/* Function:	fnDvxCycleAudioOutputVolumeMute                             */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*                                                                          */
/* Description:	Cycle volume mute on the audio output port.                 */
/****************************************************************************/
define_function fnDvxCycleAudioOutputVolumeMute (dev dvDvxAudioOutputPort)
{
    pulse[dvDvxAudioOutputPort, nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE_CYCLE]
}

/****************************************************************************/
/* Function:	fnDvxEnableAudioOutputVolumeRampUp                          */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*                                                                          */
/* Description:	Enable volume ramping up on the audio output port.          */
/****************************************************************************/
define_function fnDvxEnableAudioOutputVolumeRampUp (dev dvDvxAudioOutputPort)
{
    on[dvDvxAudioOutputPort, nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableAudioOutputVolumeRampUp                         */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*                                                                          */
/* Description:	Disable volume ramping up on the audio output port.         */
/****************************************************************************/
define_function fnDvxDisableAudioOutputVolumeRampUp (dev dvDvxAudioOutputPort)
{
    off[dvDvxAudioOutputPort, nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableAudioOutputVolumeRampDown                        */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*                                                                          */
/* Description:	Enable volume ramping down on the audio output port.        */
/****************************************************************************/
define_function fnDvxEnableAudioOutputVolumeRampDown (dev dvDvxAudioOutputPort)
{
    on[dvDvxAudioOutputPort, nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableAudioOutputVolumeRampDown                       */
/*                                                                          */
/* Arguments:	dev dvDvxAudioOutputPort - audio output port on the DVX     */
/*                                                                          */
/* Description:	Disable volume ramping down on the audio output port.       */
/****************************************************************************/
define_function fnDvxDisableAudioOutputVolumeRampDown (dev dvDvxAudioOutputPort)
{
    on[dvDvxAudioOutputPort, nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_DOWN]
}


///// Audio mic input /////


///// Video input /////

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputPhaseRampUp                            */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping up of phase on the video input port.         */
/****************************************************************************/
define_function fnDvxEnableVideoInputPhaseRampUp (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputPhaseRampUp                           */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping up of phase on the video input port.        */
/****************************************************************************/
define_function fnDvxDisableVideoInputPhaseRampUp (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputPhaseRampDown                          */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping down of phase on the video input port.       */
/****************************************************************************/
define_function fnDvxEnableVideoInputPhaseRampDown (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputPhaseRampDown                         */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping down of phase on the video input port.      */
/****************************************************************************/
define_function fnDvxDisableVideoInputPhaseRampDown (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_PHASE_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputVerticalShiftRampUp                    */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping up of vertical shift on the video input      */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxEnableVideoInputVerticalShiftRampUp (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputVerticalShiftRampUp                   */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping up of vertical shift on the video input     */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxDisableVideoInputVerticalShiftRampUp (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputVerticalShiftRampDown                  */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping down of vertical shift on the video input    */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxEnableVideoInputVerticalShiftRampDown (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputVerticalShiftRampDown                 */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping down of vertical shift on the video input   */
/*              port.                                                       */
/****************************************************************************/
define_function fnDvxDisableVideoInputVerticalShiftRampDown (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_VERTICAL_SHIFT_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputBrightnessRampUp                       */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping up of brightness on the video input port.    */
/****************************************************************************/
define_function fnDvxEnableVideoInputBrightnessRampUp (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputBrightnessRampUp                      */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping up of brightness on the video input port.   */
/****************************************************************************/
define_function fnDvxDisableVideoInputBrightnessRampUp (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputBrightnessRampDown                     */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping down of brightness on the video input port.  */
/****************************************************************************/
define_function fnDvxEnableVideoInputBrightnessRampDown (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputBrightnessRampDown                    */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping down of brightness on the video input port. */
/****************************************************************************/
define_function fnDvxDisableVideoInputBrightnessRampDown (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_BRIGHTNESS_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputSaturationRampUp                       */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping up of saturation on the video input port.    */
/****************************************************************************/
define_function fnDvxEnableVideoInputSaturationRampUp (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputSaturationRampUp                      */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping up of saturation on the video input port.   */
/****************************************************************************/
define_function fnDvxDisableVideoInputSaturationRampUp (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputSaturationRampDown                     */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping down of saturation on the video input port.  */
/****************************************************************************/
define_function fnDvxEnableVideoInputSaturationRampDown (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputSaturationRampDown                    */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping down of saturation on the video input port. */
/****************************************************************************/
define_function fnDvxDisableVideoInputSaturationRampDown (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_SATURATION_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputContrastRampUp                         */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping up of contrast on the video input port.      */
/****************************************************************************/
define_function fnDvxEnableVideoInputContrastRampUp (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputContrastRampUp                        */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping up of contrast on the video input port.     */
/****************************************************************************/
define_function fnDvxDisableVideoInputContrastRampUp (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputContrastRampDown                       */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping down of contrast on the video input port.    */
/****************************************************************************/
define_function fnDvxEnableVideoInputContrastRampDown (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputContrastRampDown                      */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping down of contrast on the video input port.   */
/****************************************************************************/
define_function fnDvxDisableVideoInputContrastRampDown (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_CONTRAST_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputHueRampUp                              */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping up of hue on the video input port.           */
/****************************************************************************/
define_function fnDvxEnableVideoInputHueRampUp (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputHueRampUp                             */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping up of hue on the video input port.          */
/****************************************************************************/
define_function fnDvxDisableVideoInputHueRampUp (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoInputHueRampDown                            */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Enable ramping down of hue on the video input port.         */
/****************************************************************************/
define_function fnDvxEnableVideoInputHueRampDown (dev dvDvxVideoInputPort)
{
    on[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoInputHueRampDown                           */
/*                                                                          */
/* Arguments:	dev dvDvxVideoInputPort - video input port on the DVX       */
/*                                                                          */
/* Description:	Disable ramping down of hue on the video input port.        */
/****************************************************************************/
define_function fnDvxDisableVideoInputHueRampDown (dev dvDvxVideoInputPort)
{
    off[dvDvxVideoInputPort, nDVX_CHANNEL_VIDEO_INPUT_HUE_RAMP_DOWN]
}


///// Video output /////


/****************************************************************************/
/* Function:	fnDvxEnableVideoOutputZoomRampUp                            */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*                                                                          */
/* Description:	Enable ramping up of zoom on the video output port.         */
/****************************************************************************/
define_function fnDvxEnableVideoOutputZoomRampUp (dev dvDvxVideoOutputPort)
{
    on[dvDvxVideoOutputPort, nDVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoOutputZoomRampUp                           */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*                                                                          */
/* Description:	Disable ramping up of zoom on the video output port.        */
/****************************************************************************/
define_function fnDvxDisableVideoOutputZoomRampUp (dev dvDvxVideoOutputPort)
{
    off[dvDvxVideoOutputPort, nDVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_UP]
}

/****************************************************************************/
/* Function:	fnDvxEnableVideoOutputZoomRampDown                          */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*                                                                          */
/* Description:	Enable ramping down of zoom on the video output port.       */
/****************************************************************************/
define_function fnDvxEnableVideoOutputZoomRampDown (dev dvDvxVideoOutputPort)
{
    on[dvDvxVideoOutputPort, nDVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_DOWN]
}

/****************************************************************************/
/* Function:	fnDvxDisableVideoOutputZoomRampDown                         */
/*                                                                          */
/* Arguments:	dev dvDvxVideoOutputPort - video output port on the DVX     */
/*                                                                          */
/* Description:	Disable ramping down of zoom on the video output port.      */
/****************************************************************************/
define_function fnDvxDisableVideoOutputZoomRampDown (dev dvDvxVideoOutputPort)
{
    off[dvDvxVideoOutputPort, nDVX_CHANNEL_VIDEO_OUTPUT_ZOOM_RAMP_DOWN]
}




















#end_if __DVX_CONTROL__