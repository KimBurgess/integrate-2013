program_name='DvxListener'


#if_not_defined __DVX_LISTENER__
#define __DVX_LISTENER__


include 'DvxApi'









define_variable

#if_not_defined dvDvxMainPorts
DEV dvDvxMainPorts[] = { 5001:1:0 }
#end_if

#if_not_defined dvDvxVidOutPorts
DEV dvDvxVidOutPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0 }
#end_if

#if_not_defined dvDvxVidInPorts
DEV dvDvxVidInPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0, 5002:5:0, 5002:6:0, 5002:7:0, 5002:8:0, 5002:9:0, 5002:10:0 }
#end_if

#if_not_defined dvDvxAudOutPorts
DEV dvDvxAudOutPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0 }
#end_if

#if_not_defined dvDvxAudInPorts
DEV dvDvxAudInPorts[] = { 5002:1:0, 5002:2:0, 5002:3:0, 5002:4:0, 5002:5:0, 5002:6:0, 5002:7:0, 5002:8:0, 5002:9:0, 5002:10:0, 5002:11:0, 5002:12:0, 5002:13:0, 5002:14:0 }
#end_if

#if_not_defined dvDvxMicInPorts
DEV dvDvxMicInPorts[] = { 5002:1:0, 5002:2:0 }
#end_if














//////////////////// SWITCH CALLBACK FUNCTIONS ///////////////////////



/*
#define INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
define_function fnDvxNotifySwitch (dev dvDvxPort1, char cSignalType[], integer nInput, integer nOutput)
{
    // dvDvxPort1 is port 1 on the DVX.
    // cSignalType contains the type of signal that was switched ('AUDIO' or 'VIDEO')
    // nInput contains the source input number that was switched to the destination
    // nOutput contains the destination output number that the source was switched to
}
*/


//////////////////// FRONT PANEL CALLBACK FUNCTIONS ///////////////////////

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKOUT_CALLBACK
define_function fnDvxNotifyFrontPanelLockoutStatus (dev dvDvxPort1, char cLockoutStatus[])
{
    // dvDvxPort1 is port 1 on the DVX.
    // cLockoutStatus contains the lockout status (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKTYPE_CALLBACK
define_function fnDvxNotifyFrontPanelLockoutType (dev dvDvxPort1, integer nLockoutType)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nLockoutType contains the lockout type (nDVX_LOCKTYPE_ALL_MENUS | nDVX_LOCKTYPE_RESERVED | nDVX_LOCKTYPE_CONFIGURE_MENUS_ONLY)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LCD_CALLBACK
define_function fnDvxNotifyFrontPanelIntensityLcd (dev dvDvxPort1, integer nIntensityValue)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nIntensityValue contains the intensity value (range 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LEDS_CALLBACK
define_function fnDvxNotifyFrontPanelIntensityLeds (dev dvDvxPort1, integer nIntensityValue)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nIntensityValue contains the intensity value (range 0 to 100)
}
*/


//////////////////// SYSTEM CALLBACK FUNCTIONS ///////////////////////

/*
#define INCLUDE_DVX_NOTIFY_FAN_SPEED_CALLBACK
define_function fnDvxNotifyFanSpeed (dev dvDvxPort1, integer nFanId, integer nSpeed)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nFanId contains the Fan ID (1 | 2).
    // nSpeed contains the fan speed.
}
*/

/*
#define INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
define_function fnDvxNotifyInternalTemperature (dev dvDvxPort1, integer nTempCelcius)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nTempCelcius contains the internal temperature of the DVX in degrees celcius
}
*/

/*
#define INCLUDE_DVX_NOTIFY_DXLINK_OUTPUT_ETHERNET_CALLBACK
define_function fnDvxNotifyDxlinkOutputEthernet (dev dvDvxDxlinkOutput, char cEthernetStatus[])
{
    // dvDvxDxlinkOutput is the D:P:S of the DXLink output port on the DVX switcher. The output number can be taken from dvDvxDxlinkOutput.PORT
    // cEthernetStatus is the status of the Ethernet on the DXLink port (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_DXLINK_INPUT_ETHERNET_CALLBACK
define_function fnDvxNotifyDxlinkInputEthernet (dev dvDvxDxlinkInput, char cEthernetStatus[])
{
    // dvDvxDxlinkInput is the D:P:S of the DXLink input port on the DVX switcher. The input number can be taken from dvDvxDxlinkInput.PORT
    // cEthernetStatus is the status of the Ethernet on the DXLink port (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_STANDBY_MODE_CALLBACK
define_function fnDvxNotifyStandbyMode (dev dvDvxPort1, integer nStatus)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nStatus is the status of the DVX being in standby mode (TRUE | FALSE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_FAN_ALARM
define_function fnDvxNotifyFanAlarm (dev dvDvxPort1, integer nStatus)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nStatus is the status of the DVX fan alarm (TRUE | FALSE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_TEMPERATURE_ALARM
define_function fnDvxNotifyTemperatureAlarm (dev dvDvxPort1, integer nStatus)
{
    // dvDvxPort1 is port 1 on the DVX.
    // nStatus is the status of the DVX temperature alarm (TRUE | FALSE)
}
*/

//////////////////// VIDEO OUTPUT CALLBACK FUNCTIONS ///////////////////////



/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ASPECT_RATIO_CALLBACK
define_function fnDvxNotifyVideoOutputAspectRatio (dev dvDvxVideoOutput, char cAspectRatio[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxOutput.PORT
    // cAspectRatio is the aspect ratio (cDVX_ASPECT_RATIO_MAINTAIN | cDVX_ASPECT_RATIO_STRETCH | cDVX_ASPECT_RATIO_ZOOM | cDVX_ASPECT_RATIO_ANAMORPHIC)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BLANK_IMAGE_CALLBACK
define_function fnDvxNotifyVideoOutputBlankImage (dev dvDvxVideoOutput, char cBlankImage[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxOutput.PORT
    // cBlankImage is the image chosen to be displayed on the output when an input source with no signal is switched to the output (cDVX_BLANK_IMAGE_BLACK | cDVX_BLANK_IMAGE_BLUE | cDVX_BLANK_IMAGE_LOGO_1 | cDVX_BLANK_IMAGE_LOGO_2 | cDVX_BLANK_IMAGE_LOGO_3)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BRIGHTNESS_CALLBACK
define_function fnDvxNotifyVideoOutputBrightness (dev dvDvxVideoOutput, integer nBrightness)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nBrightness is the brightness level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_CONTRAST_CALLBACK
define_function fnDvxNotifyVideoOutputContrast (dev dvDvxVideoOutput, integer nContrast)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nContrast is the constrast level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
define_function fnDvxNotifyVideoOutputFreeze (dev dvDvxVideoOutput, char cFreezeStatus[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cFreezeStatus is the status of the video freeze (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SHIFT_CALLBACK
define_function fnDvxNotifyVideoOutputHorizontalShift (dev dvDvxVideoOutput, integer nHorizontalShift)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nHorizontalShift is the horizontal shift value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SIZE_CALLBACK
define_function fnDvxNotifyVideoOutputHorizontalSize (dev dvDvxVideoOutput, integer nHorizontalSize)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nHorizontalSize is the horizontal size value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
define_function fnDvxNotifyVideoOutputMute (dev dvDvxVideoOutput, char cMuteStatus[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cStatus contains the video output mute status (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
define_function fnDvxNotifyVideoOutputOn (dev dvDvxVideoOutput, char cOnOffStatus[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cOnOffStatus is the video output on status (cON | cOFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
define_function fnDvxNotifyVideoOutputOsd (dev dvDvxVideoOutput, char cOsdStatus[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cOsdStatus is the OSD status (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_COLOR_CALLBACK
define_function fnDvxNotifyVideoOutputOsdColor (dev dvDvxVideoOutput, char cOsdColor[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cOsdColor is the OSD color (cDVX_OSD_COLOR_BLACK | cDVX_OSD_COLOR_BLUE | cDVX_OSD_COLOR_WHITE | cDVX_OSD_COLOR_YELLOW)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_POSISTION_CALLBACK
define_function fnDvxNotifyVideoOutputOsdPosition (dev dvDvxVideoOutput, char cOsdPosition[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cOsdPosition is the OSD position (cDVX_OSD_POSITION_TOP_LEFT | cDVX_OSD_POSITION_TOP_RIGHT | cDVX_OSD_POSITION_BOTTOM_LEFT | cDVX_OSD_POSITION_BOTTOM_RIGHT)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_RESOLUTION_CALLBACK
define_function fnDvxNotifyVideoOutputResolution (dev dvDvxVideoOutput, char cResolution[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cResolution is the video output resolution and refresh (HORxVER,REF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_SCALE_MODE_CALLBACK
define_function fnDvxNotifyVideoOutputScaleMode (dev dvDvxVideoOutput, char cScaleMode[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cScaleMode contains the scaler mode ('AUTO' | 'BYPASS')
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_TEST_PATTERN_CALLBACK
define_function fnDvxNotifyVideoOutputTestPattern (dev dvDvxVideoOutput, char cTestPattern[])
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // cTestPattern is the test pattern (cDVX_TEST_PATTERN_OFF | cDVX_TEST_PATTERN_COLOR_BAR | cDVX_TEST_PATTERN_GRAY_RAMP | cDVX_TEST_PATTERN_SMPTE_BAR | cDVX_TEST_PATTERN_HILO_TRACK | cDVX_TEST_PATTERN_PLUGE | cDVX_TEST_PATTERN_X_HATCH | cDVX_TEST_PATTERN_LOGO_1 | cDVX_TEST_PATTERN_LOGO_2 | cDVX_TEST_PATTERN_LOGO_3)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SHIFT_CALLBACK
define_function fnDvxNotifyVideoOutputVerticalShift (dev dvDvxVideoOutput, integer nVerticalShift)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nVerticalShift is the vertical shift value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SIZE_CALLBACK
define_function fnDvxNotifyVideoOutputVerticalSize (dev dvDvxVideoOutput, integer nVerticalSize)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nVerticalSize is the vertical size value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ZOOM_CALLBACK
define_function fnDvxNotifyVideoOutputZoom (dev dvDvxVideoOutput, integer nZoom)
{
    // dvDvxVideoOutput is the D:P:S of the output port on the DVX switcher. The output number can be taken from dvDvxVideoOutput.PORT
    // nZoom is the zoom value
}
*/



//////////////////// VIDEO INPUT CALLBACK FUNCTIONS ///////////////////////

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BRIGHTNESS_CALLBACK
define_function fnDvxNotifyVideoInputBrightness (dev dvDvxVideoInput, integer nBrightness)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // nBrightness is the brightness level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
define_function fnDvxNotifyVideoInputBlackAndWhiteState (dev dvDvxVideoInput, char cStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cStatus is the status of black and white mode on the video input (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_COLOUR_CALLBACK
define_function fnDvxNotifyVideoInputColor (dev dvDvxVideoInput, char cStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cStatus is the status of color mode on the video input (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_CONTRAST_CALLBACK
define_function fnDvxNotifyVideoInputContrast (dev dvDvxVideoInput, integer nContrast)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // nContrast is the contrast level
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_SOURCE_CALLBACK
define_function fnDvxNotifyVideoInputEdidSource (dev dvDvxVideoInput, char cEdidSource[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cEdidSource is the source of the EDID on the DVX input (cDVX_EDID_SOURCE_ALL_RESOLUTIONS | cDVX_EDID_SOURCE_WIDE_SCREEN | cDVX_EDID_SOURCE_FULL_SCREEN | cDVX_EDID_SOURCE_MIRROR_OUTPUT_1 | cDVX_EDID_SOURCE_MIRROR_OUTPUT_2 | cDVX_EDID_SOURCE_MIRROR_OUTPUT_3 | cDVX_EDID_SOURCE_MIRROR_OUTPUT_4)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_UPDATE_AUTO_CALLBACK
define_function fnDvxNotifyVideoInputEdidUpdateAuto (dev dvDvxVideoInput, char cAutoStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cAutoStatus is the status of whether the EDID updates at regular intervals (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_PREFERRED_RESOLUTION_CALLBACK
define_function fnDvxNotifyVideoInputEdidPreferredResolution (dev dvDvxVideoInput, char cResolution[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cResolution is the resolution listed in the EDID as the preferred (or native) resolution on the DVX video input
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_FORMAT_CALLBACK
define_function fnDvxNotifyVideoInputFormat (dev dvDvxVideoInput, char cVideoFormat[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cVideoFormat is the video format (cVIDEO_SIGNAL_FORMAT_HDMI | cVIDEO_SIGNAL_FORMAT_DVI | cVIDEO_SIGNAL_FORMAT_VGA | cVIDEO_SIGNAL_FORMAT_COMPOSITE | cVIDEO_SIGNAL_FORMAT_COMPONENT | cVIDEO_SIGNAL_FORMAT_SVIDEO | cVIDEO_SIGNAL_FORMAT_RGB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HDCP_COMPLIANCE
define_function fnDvxNotifyVideoInputHdcpCompliance (dev dvDvxVideoInput, char cStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cStatus is the status of the HDCP compliance on the video input port (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HORIZONTAL_SHIFT_CALLBACK
define_function fnDvxNotifyVideoInputHorizontalShift (dev dvDvxVideoInput, sinteger snHorizontalShift)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // snHorizontalShift is the horizontal shift value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HUE_CALLBACK
define_function fnDvxNotifyVideoInputHue (dev dvDvxVideoInput, integer nHue)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // nHue is the hue value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
define_function fnDvxNotifyVideoInputName (dev dvDvxVideoInput, char cName[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cName is the name of the video input
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_PHASE_CALLBACK
define_function fnDvxNotifyVideoInputPhase (dev dvDvxVideoInput, integer nPhase)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // nPhase is the phase value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_AUTO_CALLBACK
define_function fnDvxNotifyVideoInputResolutionAuto (dev dvDvxVideoInput, char cStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cStatus is the auto resolution detect status (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_CALLBACK
define_function fnDvxNotifyVideoInputResolution (dev dvDvxVideoInput, char cResolution[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cResolution is the input resolution.
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_SATURATION_CALLBACK
define_function fnDvxNotifyVideoInputSaturation (dev dvDvxVideoInput, integer nSaturation)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // nSaturation is the saturation value
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
define_function fnDvxNotifyVideoInputStatus (dev dvDvxVideoInput, char cSignalStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cSignalStatus is the input signal status (cDVX_SIGNAL_STATUS_NO_SIGNAL | cDVX_SIGNAL_STATUS_UNKNOWN | cDVX_SIGNAL_STATUS_VALID_SIGNAL)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_VERTICAL_SHIFT_CALLBACK
define_function fnDvxNotifyVideoInputVerticalShift (dev dvDvxVideoInput, sinteger snVerticalShift)
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // snVerticalShift is the vertical shift value
}
*/


//////////////////// AUDIO OUTPUT CALLBACK FUNCTIONS ///////////////////////

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_BALANCE_CALLBACK
define_function fnDvxNotifyAudioOutBalance (dev dvDvxAudioOutput, sinteger snBalance)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // snBalance is the balance value (range: -20 to 20dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_DELAY_CALLBACK
define_function fnDvxNotifyAudioOutDelay (dev dvDvxAudioOutput, integer nDelay)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nDelay is the delay value (range: 0 to 200ms)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_THRESHOLD_CALLBACK
define_function fnDvxNotifyAudioOutDuckingThreshold (dev dvDvxAudioOutput, sinteger snThreshold)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // snThreshold is the ducking threshold value (range: -60 to 0)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_CALLBACK
define_function fnDvxNotifyAudioOutDucking (dev dvDvxAudioOutput, char cDucking[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cDucking is the ducking (cDVX_DUCKING_OFF | cDVX_DUCKING_LOW | cDVX_DUCKING_MEDIUM | cDVX_DUCKING_HIGH | cDVX_DUCKING_CUSTOM)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_CENTER_FREQUENCY_CALLBACK
define_function fnDvxNotifyAudioOutEqCenterFrequency (dev dvDvxAudioOutput, integer nBand, integer nFequency)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nBand is the EQ band (range: 1 to 10)
    // nFequency is the center frequency (range: 20 to 20000Hz)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_FILTER_TYPE_CALLBACK
define_function fnDvxNotifyAudioOutEqFilterType (dev dvDvxAudioOutput, integer nBand, char cFilterType[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nBand is the EQ band (range: 1 to 10)
    // cFilterType is the filter type (cDVX_EQ_FILTER_TYPE_BELL | cDVX_EQ_FILTER_TYPE_BAND_PASS | cDVX_EQ_FILTER_TYPE_BAND_STOP | cDVX_EQ_FILTER_TYPE_HIGH_PASS | cDVX_EQ_FILTER_TYPE_LOW_PASS | cDVX_EQ_FILTER_TYPE_TREBLE_SHELF | cDVX_EQ_FILTER_TYPE_BASS_SHELF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_GAIN_CALLBACK
define_function fnDvxNotifyAudioOutEqGain (dev dvDvxAudioOutput, integer nBand, sinteger snGain)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nBand is the EQ band (range: 1 to 10)
    // snGain is the gain (range: -12 to 12dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_MODE_CALLBACK
define_function fnDvxNotifyAudioOutEqMode (dev dvDvxAudioOutput, char cMode[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cMode is the EQ mode (cDVX_EQ_MODE_OFF | cDVX_EQ_MODE_VOICE | cDVX_EQ_MODE_MUSIC | cDVX_EQ_MODE_MOVIE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_QUALITY_FACTOR_CALLBACK
define_function fnDvxNotifyAudioOutEqQualityFactor (dev dvDvxAudioOutput, integer nBand, float fQualityFactor)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nBand is the EQ band (range: 1....10)
    // fQualityFactor is the quality factor (range is dependent on eq filter type)
    // 		Filter Type	Range
    // 		-----------	-----
    // 		Bell		0.1 to 20.0
    // 		Band Pass	0.1 to 20.0
    // 		Band Stop	0.1 to 20.0
    // 		High Pass	0.5 to 1.4
    // 		Low Pass	0.5 to 1.4
    // 		Treble Shelf	0.5 to 1.0
    // 		Bass Shelf	0.5 to 1.0
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MAXIMUM_VOLUME_CALLBACK
define_function fnDvxNotifyAudioOutMaximumVolume (dev dvDvxAudioOutput, integer nMaxVol)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nMaxVol is the maximum volume setting for the audio output port (range: 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MINIMUM_VOLUME_CALLBACK
define_function fnDvxNotifyAudioOutMinimumVolume (dev dvDvxAudioOutput, integer nMinVol)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nMinVol is the minimum volume setting for the audio output port (range: 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
define_function fnDvxNotifyAudioOutMute (dev dvDvxAudioOutput, char cMuteStatus[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cMuteStatus is the mute status (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_STEREO_CALLBACK
define_function fnDvxNotifyAudioOutStereo (dev dvDvxAudioOutput, char cStereoStatus[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cStereoStatus is the stereo audio status (cENABLE | cDISABLE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_TEST_TONE_CALLBACK
define_function fnDvxNotifyAudioOutTestTone (dev dvDvxAudioOutput, char cTestTone[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cTestTone is the test tone frequency (cDVX_TEST_TONE_FREQUENCY_OFF | cDVX_TEST_TONE_FREQUENCY_60_HZ | cDVX_TEST_TONE_FREQUENCY_250_HZ | cDVX_TEST_TONE_FREQUENCY_400_HZ | cDVX_TEST_TONE_FREQUENCY_1_KHZ | cDVX_TEST_TONE_FREQUENCY_3_KHZ | cDVX_TEST_TONE_FREQUENCY_5_KHZ | cDVX_TEST_TONE_FREQUENCY_10_KHZ | cDVX_TEST_TONE_FREQUENCY_PINK_NOISE | cDVX_TEST_TONE_FREQUENCY_WHITE_NOISE)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
define_function fnDvxNotifyAudioOutVolume (dev dvDvxAudioOutput, integer nVolume)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // nVolume is the volume value (range: 0 to 100)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_AUDIO_OUTPUT_CALLBACK
define_function fnDvxNotifyAudioOutHdmiAudioOutput (dev dvDvxAudioOutput, char cHdmiAudioOutput[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cHdmiAudioOutput contains the audio output setting for the HDMI output (cDVX_HDMI_AUDIO_OUTPUT_OFF | cDVX_HDMI_AUDIO_OUTPUT_INPUT_PASS_THRU | cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_1 | cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_2 | cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_3 | cDVX_HDMI_AUDIO_OUTPUT_ANALOG_OUT_4)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_EQ_STATUS_CALLBACK
define_function fnDvxNotifyAudioOutHdmiEqStatus (dev dvDvxAudioOutput, char cEqStatus[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cEqStatus contains the HDMI equalizer status (cON | cOFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_SPDIF_AUDIO_OUTPUT_CALLBACK
define_function fnDvxNotifyAudioOutSpdifAudioOutput (dev dvDvxAudioOutput, char cSpdifAudioOutput[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cSpdifAudioOutput contains the output to which the SP/DIF port connects (cDVX_SDDIF_AUDIO_OUTPUT_OFF | cDVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_1 | cDVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_2 | cDVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_3 | cDVX_SDDIF_AUDIO_OUTPUT_HDMI_OUT_4 | cDVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_1 | cDVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_2 | cDVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_3 | cDVX_SDDIF_AUDIO_OUTPUT_ANALOG_OUT_4)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MIX_LEVEL_CALLBACK
define_function fnDvxNotifyAudioOutMixLevel (dev dvDvxAudioOutput, sinteger snMixLevel, integer nInput, integer nOutput)
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // snMixLevel is the mix level (range: -100 to 0)
    // nInput is input being mixed (nDVX_MIX_INPUT_LINE | nDVX_MIX_INPUT_MIC1 | nDVX_MIX_INPUT_MIC2)
    // nOutput is the audio output (1 is AMP, 2...4 are Line outputs)
}
*/


//////////////////// AUDIO INPUT CALLBACK FUNCTIONS ///////////////////////

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_CALLBACK
define_function fnDvxNotifyAudioInCompression (dev dvDvxAudioInput, char cCompressionSetting[])
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // cCompressionSetting is the compression setting for the audio input (cDVX_COMPRESSION_OFF | cDVX_COMPRESSION_LOW | cDVX_COMPRESSION_MEDIUM | cDVX_COMPRESSION_HIGH | cDVX_COMPRESSION_CUSTOM)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_ATTACK_CALLBACK
define_function fnDvxNotifyAudioInCompressionAttack (dev dvDvxAudioInput, integer nAttackDuration)
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // nAttackDuration is the duration of the compression attack phase (range: 1....2000)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RATIO_CALLBACK
define_function fnDvxNotifyAudioInCompressionRatio (dev dvDvxAudioInput, integer nRatio)
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // nRatio is the compression ratio (rang:e 1....20)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RELEASE_CALLBACK
define_function fnDvxNotifyAudioInCompressionRelease (dev dvDvxAudioInput, integer nRelease)
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // nRelease is the compression release (range: 1...5000)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_THRESHOLD_CALLBACK
define_function fnDvxNotifyAudioInCompressionThreshold (dev dvDvxAudioInput, sinteger snThreshold)
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // snThreshold is the compression threshold (range: 0....-60dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_CALLBACK
define_function fnDvxNotifyAudioInGain (dev dvDvxAudioInput, sinteger snGain)
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // snGain is the gain value (range: -24....24 in dB)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_MUTE_CALLBACK
define_function fnDvxNotifyAudioInGainMute (dev dvDvxAudioInput, char cStatus[])
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // cStatus is the gain mute status value (cENABLED | cDISABLED)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_IN_STEREO_CALLBACK
define_function fnDvxNotifyAudioInStereo (dev dvDvxAudioInput, char cStereoMode[])
{
    // dvDvxAudioInput is the D:P:S of the audio input port on the DVX switcher. The input number can be taken from dvDvxAudioInput.PORT
    // cStereoMode is the stereo audio mode (cDVX_AUDIO_STEREO | cDVX_AUDIO_MONO)
}
*/

//////////////////// AUDIO MIC CALLBACK FUNCTIONS ///////////////////////

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_CALLBACK
define_function fnDvxNotifyAudioMicCompression (dev dvDvxMicInput, char cCompressionSetting[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // cCompressionSetting is the compression setting (cDVX_COMPRESSION_OFF | cDVX_COMPRESSION_LOW | cDVX_COMPRESSION_MEDIUM | cDVX_COMPRESSION_HIGH | cDVX_COMPRESSION_CUSTOM)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_ATTACK_CALLBACK
define_function fnDvxNotifyAudioMicCompressionAttack (dev dvDvxMicInput, integer nAttack)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nAttack is the duration of the attack phase while compressing the microphone (range: 1 to 2000)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RATIO_CALLBACK
define_function fnDvxNotifyAudioMicCompressionRatio (dev dvDvxMicInput, integer nRatio)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nRatio is the ratio for compressing the microphone (range: 1 to 20).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RELEASE_CALLBACK
define_function fnDvxNotifyAudioMicCompressionRelease (dev dvDvxMicInput, integer nRelease)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nRelease is the duration of the compression release while compressing the microphone (range: 1 to 5000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_THRESHOLD_CALLBACK
define_function fnDvxNotifyAudioMicCompressionThreshold (dev dvDvxMicInput, sinteger snThreshold)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // snThreshold is the threshold while compressing the microphone (range: 0 to -60).
}
*/

/*	// INVALID COMMAND - DOCUMENTATION WAS INCORRECT
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CALLBACK
define_function fnDvxNotifyAudioMicEq (dev dvDvxMicInput, integer nBand, sinteger snValue)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nBand is the microphone eq band (range: 1 to 3).
    // snValue is the EQ  setting (range: -12 to 12).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CENTER_FREQUENCY_CALLBACK
define_function fnDvxNotifyAudioMicEqCenterFrequency (dev dvDvxMicInput, integer nBand, sinteger snCenterFrequency)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nBand is the microphone eq band (range: 1 to 3).
    // snCenterFrequency is the EQ center frequency (range: -12 to 12).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_FILTER_TYPE_CALLBACK
define_function fnDvxNotifyAudioMicEqFilterType (dev dvDvxMicInput, integer nBand, char cFilterType[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nBand is the microphone eq band (range: 1 to 3).
    // cFilterType is the EQ filter type (cDVX_EQ_FILTER_TYPE_BELL | cDVX_EQ_FILTER_TYPE_BAND_PASS | cDVX_EQ_FILTER_TYPE_BAND_STOP | cDVX_EQ_FILTER_TYPE_HIGH_PASS | cDVX_EQ_FILTER_TYPE_LOW_PASS | cDVX_EQ_FILTER_TYPE_TREBLE_SHELF | cDVX_EQ_FILTER_TYPE_BASS_SHELF).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_GAIN_CALLBACK
define_function fnDvxNotifyAudioMicEqGain (dev dvDvxMicInput, integer nBand, sinteger snGain)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nBand is the microphone eq band (range: 1 to 3).
    // snGain is the EQ gain value (range: -12 to 12).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_QUALITY_FACTOR_CALLBACK
define_function fnDvxNotifyAudioMicEqQualityFactor (dev dvDvxMicInput, integer nBand, float fFactor)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nBand is the microphone eq band (range: 1 to 3).
    // fFactor is the EQ quality factor value (range: 0.1 to 20).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GAIN_CALLBACK
define_function fnDvxNotifyAudioMicGain (dev dvDvxMicInput, sinteger snGain)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // snGain is the mic gain value (range: -24 to 24).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_CALLBACK
define_function fnDvxNotifyAudioMicGating (dev dvDvxMicInput, char cGatingSetting[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // cGatingSetting is the mic gating setting (cDVX_GATING_OFF | cDVX_GATING_LOW | cDVX_GATING_MEDIUM | cDVX_GATING_HIGH | cDVX_GATING_CUSTOM).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_ATTACK_CALLBACK
define_function fnDvxNotifyAudioMicGatingAttack (dev dvDvxMicInput, integer nAttack)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nAttack is the mic gating attack value (range: 1 to 2000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_DEPTH_CALLBACK
define_function fnDvxNotifyAudioMicGatingDepth (dev dvDvxMicInput, integer nDepth)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nDepth is the mic gating attack value (range: 0 to 20).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_HOLD_CALLBACK
define_function fnDvxNotifyAudioMicGatingHold (dev dvDvxMicInput, integer nHold)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nHold is the mic gating hold value (range: 0 to 2000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_RELEASE_CALLBACK
define_function fnDvxNotifyAudioMicGatingRelease (dev dvDvxMicInput, integer nRelease)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nRelease is the mic gating release value (range: 10 to 5000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_THRESHOLD_CALLBACK
define_function fnDvxNotifyAudioMicGatingThreshold (dev dvDvxMicInput, sinteger snThreshold)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // snThreshold is the mic gating theshhold value (range: 0 to -60).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_CALLBACK
define_function fnDvxNotifyAudioMicLimiter (dev dvDvxMicInput, char cLimiterSetting[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // cLimiterSetting is the mic limiter setting (cDVX_LIMITER_OFF | cDVX_LIMITER_LOW | cDVX_LIMITER_MEDIUM | cDVX_LIMITER_HIGH | cDVX_LIMITER_CUSTOM).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_ATTACK_CALLBACK
define_function fnDvxNotifyAudioMicLimiterAttack (dev dvDvxMicInput, integer nAttack)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nAttack is the mic limiter attack value (range: 1 to 2000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_RELEASE_CALLBACK
define_function fnDvxNotifyAudioMicLimiterRelease (dev dvDvxMicInput, integer nRelease)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nRelease is the mic limiter release value (range: 10 to 5000).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_THRESHOLD_CALLBACK
define_function fnDvxNotifyAudioMicLimiterThreshold (dev dvDvxMicInput, sinteger snThreshold)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // snThreshold is the mic limiter theshhold value (range: 0 to -60).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
define_function fnDvxNotifyAudioMicOn (dev dvDvxMicInput, char cStatus[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // cStatus is the status of the microphone (cON | cOFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_PHANTOM_POWER_CALLBACK
define_function fnDvxNotifyAudioMicPhantomPower (dev dvDvxMicInput, char cStatus[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // cStatus is the phantom power setting of the microphone (cON | cOFF)
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_PREAMP_GAIN_CALLBACK
define_function fnDvxNotifyAudioMicPreampGain (dev dvDvxMicInput, integer nPercentage)
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // nPercentage is the pre-amplifier gain on the microphone (range: 0 to 100, units are in %).
}
*/

/*
#define INCLUDE_DVX_NOTIFY_AUDIO_MIC_STEREO_CALLBACK
define_function fnDvxNotifyAudioMicStereo (dev dvDvxMicInput, char cMicType[])
{
    // dvDvxMicInput is the D:P:S of the audio mic input port on the DVX switcher. The mic input number can be taken from dvDvxMicInput.PORT
    // cMicType is the type of microphone in use on the microphone port (cDVX_MIC_TYPE_DUAL_MONO | cDVX_MIC_TYPE_SINGLE_STEREO)
}
*/

















//////////////////// EVENTS TO CAPTURE CHANGES ON THE DVX ////////////////////

define_event





////////////////////////////////////////////////////////
//////////       Data event monitoring        //////////
////////////////////////////////////////////////////////

data_event[dvDvxMainPorts]	// dvDvxMainPorts should be the device (D:P:S) for port 1 on the DVX or an array containing multiple devices for port 1 on multiple DVX's
{
    command:
    {
	stack_var char cCmdHeader[30]
	
	// remove the header
	cCmdHeader = fnDvxParseCmdHeader(data.text)
	// cCmdHeader contains the header
	// data.text is left with the parameters
	
	switch (cCmdHeader)
	{
	    // System commands
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FAN_SPEED_CALLBACK
	    case cDVX_COMMAND_FAN_SPEED:
	    {
		stack_var integer nFanId
		stack_var integer nFanSpeed
		
		nFanId = atoi(DvxParseCmdParam(data.text))
		nFanSpeed = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyFanSpeed(data.device, nFanId, nFanSpeed)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
	    case cDVX_COMMAND_TEMPERATURE:
	    {
		fnDvxNotifyInternalTemperature(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    
	    
	    
	    
	    // Front Panel commands
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKOUT_CALLBACK
	    case cDVX_COMMAND_FRONT_PANEL_LOCKOUT:
	    {
		fnDvxNotifyFrontPanelLockoutStatus(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_LOCKTYPE_CALLBACK
	    case cDVX_COMMAND_FRONT_PANEL_LOCKOUT_TYPE:
	    {
		fnDvxNotifyFrontPanelLockoutType(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LCD_CALLBACK
	    case cDVX_COMMAND_FRONT_PANEL_INTENSITY_LCD:
	    {
		fnDvxNotifyFrontPanelIntensityLcd(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FRONT_PANEL_INTENSITY_LEDS_CALLBACK
	    case cDVX_COMMAND_FRONT_PANEL_INTENSITY_LEDS:
	    {
		fnDvxNotifyFrontPanelIntensityLeds(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    
	    
	    // Switching commands
	    
	    #if_defined INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
	    case cDVX_COMMAND_SWITCH_RESPONSE:
	    {
		stack_var char cType[10]
		stack_var integer nInput
		stack_var integer nOutput
		
		if (find_string(data.text,'LAUDIO',1) == 1)
		{
		    cType = cSIGNAL_TYPE_AUDIO
		    remove_string(data.text,'LAUDIOI',1)
		}
		else if (find_string(data.text,'LVIDEO',1) == 1)
		{
		    cType = cSIGNAL_TYPE_VIDEO
		    remove_string(data.text,'LVIDIOI',1)
		}
		nInput = atoi(data.text)
		remove_string(data.text,"'O'",1)
		nOutput = atoi(data.text)
		fnDvxNotifySwitch(data.device, cType, nInput, nOutput)
	    }
	    #end_if
	    
	    
	    default:
	    {
		// Unhandled command - Do nothing!
	    }
	}
    }
}


data_event[dvDvxVidOutPorts]	// dvDvxVidOutPorts should be a DEV array containing devices for each video output port on the DVX
{
    command:
    {
	stack_var char cCmdHeader[30]
	
	// remove the header
	cCmdHeader = fnDvxParseCmdHeader(data.text)
	// cCmdHeader contains the header
	// data.text is left with the parameters
	
	switch (cCmdHeader)
	{
	    
	    #if_defined INCLUDE_DVX_NOTIFY_DXLINK_OUTPUT_ETHERNET_CALLBACK
	    case cDVX_COMMAND_DXLINK_OUTPUT_ETHERNET:
	    {
		fnDvxNotifyDxlinkOutputEthernet(data.device, data.text)
	    }
	    #end_if

	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ASPECT_RATIO_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_ASPECT_RATIO:
	    {
		fnDvxNotifyVideoOutputAspectRatio(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BLANK_IMAGE_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_BLANK_IMAGE:
	    {
		fnDvxNotifyVideoOutputBlankImage(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BRIGHTNESS_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_BRIGHTNESS:
	    {
		fnDvxNotifyVideoOutputBrightness(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_CONSTRAST_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_CONTRAST:
	    {
		fnDvxNotifyVideoOutputContrast(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_FREEZE:
	    {
		fnDvxNotifyVideoOutputFreeze(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SHIFT_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_HORIZONTAL_SHIFT:
	    {
		fnDvxNotifyVideoOutputHorizontalShift(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SIZE_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_HORIZONTAL_SIZE:
	    {
		fnDvxNotifyVideoOutputHorizontalSize(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
	    case cDVX_COMMAND_VIDEO_MUTE:
	    case cDVX_COMMAND_VIDEO_OUT_MUTE:
	    {
		fnDvxNotifyVideoOutputMute(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_ON:
	    {
		fnDvxNotifyVideoOutputOn(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_OSD:
	    {
		fnDvxNotifyVideoOutputOsd(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_COLOR_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_OSD_COLOR:
	    {
		fnDvxNotifyVideoOutputOsdColor(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_POSISTION_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_OSD_POSITION:
	    {
		fnDvxNotifyVideoOutputOsdPosition(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_RESOLUTION_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_RESOLUTION:
	    {
		fnDvxNotifyVideoOutputResolution(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_SCALE_MODE_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_SCALE_MODE:
	    {
		fnDvxNotifyVideoOutputScaleMode(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_TEST_PATTERN_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_TEST_PATTERN:
	    {
		fnDvxNotifyVideoOutputTestPattern(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SHIFT_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_VERTICAL_SHIFT:
	    {
		fnDvxNotifyVideoOutputVerticalShift(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SIZE_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_VERTICAL_SIZE:
	    {
		fnDvxNotifyVideoOutputVerticalSize(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ZOOM_CALLBACK
	    case cDVX_COMMAND_VIDEO_OUT_ZOOM:
	    {
		fnDvxNotifyVideoOutputZoom(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    default:
	    {
		// Unhandled command - Do nothing!
	    }
	    
	}
    }
}


data_event[dvDvxVidInPorts]	// dvDvxVidInPorts should be a DEV array containing devices for each video input port on the DVX
{
    command:
    {
	stack_var char cCmdHeader[30]
	
	// remove the header
	cCmdHeader = fnDvxParseCmdHeader(data.text)
	// cCmdHeader contains the header
	// data.text is left with the parameters
	switch (cCmdHeader)
	{
	    
	    #if_defined INCLUDE_DVX_NOTIFY_DXLINK_INPUT_ETHERNET_CALLBACK
	    case cDVX_COMMAND_DXLINK_INPUT_ETHERNET:
	    {
		fnDvxNotifyDxlinkInputEthernet(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BRIGHTNESS_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_BRIGHTNESS:
	    {
		fnDvxNotifyVideoInputBrightness(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_BLACK_AND_WHITE_STATE:
	    {
		fnDvxNotifyVideoInputBlackAndWhiteState(data.device,data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_COLOUR_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_COLOR:
	    {
		fnDvxNotifyVideoInputColor(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_CONTRAST_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_CONTRAST:
	    {
		fnDvxNotifyVideoInputContrast(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_SOURCE_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_EDID_SOURCE:
	    {
		fnDvxNotifyVideoInputEdidSource(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_UPDATE_AUTO_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_EDID_UPDATE_AUTO:
	    {
		fnDvxNotifyVideoInputEdidUpdateAuto(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_EDID_PREFERRED_RESOLUTION_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_EDID_PREFERRED_RESOLUTION:
	    {
		fnDvxNotifyVideoInputEdidPreferredResolution(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_FORMAT_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_FORMAT:
	    {
		fnDvxNotifyVideoInputFormat(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HDCP_COMPLIANCE
	    case cDVX_COMMAND_VIDEO_IN_HDCP_COMPLIANCE:
	    {
		fnDvxNotifyVideoInputHdcpCompliance(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HORIZONTAL_SHIFT_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_HORIZONTAL_SHIFT:
	    {
		fnDvxNotifyVideoInputHorizontalShift(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HUE_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_HUE:
	    {
		fnDvxNotifyVideoInputHue(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_NAME:
	    {
		fnDvxNotifyVideoInputName(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_PHASE_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_PHASE:
	    {
		fnDvxNotifyVideoInputHue(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_AUTO_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_RESOLUTION_AUTO:
	    {
		fnDvxNotifyVideoInputResolutionAuto(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_RESOLUTION_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_RESOLUTION:
	    {
		fnDvxNotifyVideoInputResolution(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_SATURATION_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_SATURATION:
	    {
		fnDvxNotifyVideoInputSaturation(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_STATUS:
	    {
		fnDvxNotifyVideoInputStatus(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_VERTICAL_SHIFT_CALLBACK
	    case cDVX_COMMAND_VIDEO_IN_VERTICAL_SHIFT:
	    {
		fnDvxNotifyVideoInputVerticalShift(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    default:
	    {
		// Unhandled command - Do nothing!
	    }
	}
    }
}



data_event[dvDvxAudInPorts]	// dvDvxAudInPorts should be a DEV array containing devices for each audio input port on the DVX
{
    command:
    {
	stack_var char cCmdHeader[30]
	
	// remove the header
	cCmdHeader = fnDvxParseCmdHeader(data.text)
	// cCmdHeader contains the header
	// data.text is left with the parameters
	
	switch (cCmdHeader)
	{
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_COMPRESSION:
	    {
		fnDvxNotifyAudioInCompression(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_ATTACK_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_COMPRESSION_ATTACK:
	    {
		fnDvxNotifyAudioInCompressionAttack(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RATIO_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_COMPRESSION_RATIO:
	    {
		fnDvxNotifyAudioInCompressionRatio(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_RELEASE_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_COMPRESSION_RELEASE:
	    {
		fnDvxNotifyAudioInCompressionRelease(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_COMPRESSION_THRESHOLD_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_COMPRESSION_THRESHOLD:
	    {
		fnDvxNotifyAudioInCompressionThreshold(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_GAIN:
	    {
		fnDvxNotifyAudioInGain(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_STEREO_CALLBACK
	    case cDVX_COMMAND_AUDIO_IN_STEREO:
	    {
		fnDvxNotifyAudioInStereo(data.device, data.text)
	    }
	    #end_if
	    
	    default:
	    {
		// Unhandled command - Do nothing!
	    }
	}
    }
}



data_event[dvDvxAudOutPorts]	// dvDvxAudOutPorts should be a DEV array containing devices for each audio output port on the DVX
{
    command:
    {
	stack_var char cCmdHeader[30]
	
	// remove the header
	cCmdHeader = fnDvxParseCmdHeader(data.text)
	// cCmdHeader contains the header
	// data.text is left with the parameters
	
	switch (cCmdHeader)
	{
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_BALANCE_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_BALANCE:
	    {
		fnDvxNotifyAudioOutBalance(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_DELAY_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_DELAY:
	    {
		fnDvxNotifyAudioOutDelay(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    /*
	    case cDVX_COMMAND_AUDIO_OUT_DUCK_ATTACK:
	    {
	    }
	    */
	    
	    /*
	    case cDVX_COMMAND_AUDIO_OUT_DUCK_HOLD:
	    {
	    }
	    */
	    
	    /*
	    case cDVX_COMMAND_AUDIO_OUT_DUCK_LEVEL:
	    {
	    }
	    */
	    
	    /*
	    case cDVX_COMMAND_AUDIO_OUT_DUCK_RELEASE:
	    {
	    }
	    */
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_THRESHOLD_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_DUCKING_THRESHOLD:
	    {
		fnDvxNotifyAudioOutDuckingThreshold(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_DUCKING_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_DUCKING:
	    {
		fnDvxNotifyAudioOutDucking(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_CENTER_FREQUENCY_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_EQ_CENTER_FREQUENCY:
	    {
		stack_var integer nBand
		stack_var integer nCenterFrequency
		
		nBand = atoi(DvxParseCmdParam(data.text))
		nCenterFrequency = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioOutEqCenterFrequency(data.device, nBand, nCenterFrequency)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_FILTER_TYPE_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_EQ_FILTER_TYPE:
	    {
		stack_var integer nBand
		
		nBand = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioOutEqFilterType(data.device, nBand, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_GAIN_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_EQ_GAIN:
	    {
		stack_var integer nBand
		stack_var sinteger nGain
		
		nBand = atoi(DvxParseCmdParam(data.text))
		nGain = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioOutEqGain(data.device, nBand, nGain)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_MODE_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_EQ_MODE:
	    {
		fnDvxNotifyAudioOutEqMode(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_QUALITY_FACTOR_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_EQ_QUALITY_FACTOR:
	    {
		stack_var integer nBand
		stack_var float fQualityFactor
		
		nBand = atoi(DvxParseCmdParam(data.text))
		fQualityFactor = atof(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioOutEqQualityFactor(data.device,nBand,fQualityFactor)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MAXIMUM_VOLUME_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_MAXIMUM_VOLUME:
	    {
		fnDvxNotifyAudioOutMaximumVolume(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MINIMUM_VOLUME_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_MINIMUM_VOLUME:
	    {
		fnDvxNotifyAudioOutMinimumVolume(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_MUTE:
	    {
		fnDvxNotifyAudioOutMute(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_STEREO_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_STEREO:
	    {
		fnDvxNotifyAudioOutStereo(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_TEST_TONE_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_TEST_TONE:
	    {
		fnDvxNotifyAudioOutTestTone(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_VOLUME:
	    {
		fnDvxNotifyAudioOutVolume(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_AUDIO_OUTPUT_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_HDMI_AUDIO:
	    {
		fnDvxNotifyAudioOutHdmiAudioOutput(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_HDMI_EQ_STATUS_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_HDMI_EQ:
	    {
		fnDvxNotifyAudioOutHdmiEqStatus(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_SPDIF_AUDIO_OUTPUT_CALLBACK
	    case cDVX_COMMAND_AUDIO_OUT_SPDIF_AUDIO:
	    {
		fnDvxNotifyAudioOutSpdifAudioOutput(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MIX_LEVEL_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIX_LEVEL:
	    {
		stack_var sinteger snValue
		stack_var integer nInput
		stack_var integer nOutput
		
		snValue = atoi(DvxParseCmdParam(data.text))
		nInput = atoi(DvxParseCmdParam(data.text))
		nOutput = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioOutMixLevel(data.device, snValue, nInput, nOutput)
	    }
	    #end_if
	    
	    default:
	    {
		// Unhandled command - Do nothing!
	    }
	}
    }
}



data_event[dvDvxMicInPorts]	// dvDvxMicInPorts should be a DEV array containing devices for each mic input port on the DVX
{
    command:
    {
	stack_var char cCmdHeader[30]
	
	// remove the header
	cCmdHeader = fnDvxParseCmdHeader(data.text)
	// cCmdHeader contains the header
	// data.text is left with the parameters
	
	switch (cCmdHeader)
	{
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_COMPRESSION:
	    {
		fnDvxNotifyAudioMicCompression(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_ATTACK_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_COMPRESSION_ATTACK:
	    {
		fnDvxNotifyAudioMicCompressionAttack(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RATIO_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_COMPRESSION_RATIO:
	    {
		fnDvxNotifyAudioMicCompressionRatio(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_RELEASE_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_COMPRESSION_RELEASE:
	    {
		fnDvxNotifyAudioMicCompressionRelease(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_COMPRESSION_THRESHOLD_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_COMPRESSION_THRESHOLD:
	    {
		fnDvxNotifyAudioMicCompressionThreshold(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    /*
	    case cDVX_COMMAND_AUDIO_MIC_DUCKING_ATTACK:
	    {
	    }
	    */
	    /*
	    case cDVX_COMMAND_AUDIO_MIC_DUCKING_HOLD:
	    {
		fnDvxNotifyAudioMic
	    }
	    */
	    /*
	    case cDVX_COMMAND_AUDIO_MIC_DUCKING_LEVEL:
	    {
		fnDvxNotifyAudioMic
	    }
	    */
	    /*
	    case cDVX_COMMAND_AUDIO_MIC_DUCKING_RELEASE:
	    {
		fnDvxNotifyAudioMic
	    }
	    */
	    
	    /*	// INVALID COMMAND - DOCUMENTATION WAS INCORRECT
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_EQ:
	    {
		stack_var integer nBand
		stack_var sinteger snValue
		
		nBand = atoi(DvxParseCmdParam(data.text))
		snValue = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioMicEq(data.device, nBand, snValue)
	    }
	    #end_if
	    */
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CENTER_FREQUENCY_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_EQ_CENTER_FREQUENCY:
	    {
		stack_var integer nBand
		stack_var sinteger snCenterFrequency
		
		nBand = atoi(DvxParseCmdParam(data.text))
		snCenterFrequency = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioMicEqCenterFrequency(data.device, nBand, snCenterFrequency)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_FILTER_TYPE_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_EQ_FILTER_TYPE:
	    {
		stack_var integer nBand
		stack_var char cFilterType[20]
		
		nBand = atoi(DvxParseCmdParam(data.text))
		cFilterType = DvxParseCmdParam(data.text)
		
		fnDvxNotifyAudioMicEqFilterType(data.device, nBand, cFilterType)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_GAIN_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_EQ_GAIN:
	    {
		stack_var integer nBand
		stack_var sinteger snGain
		
		nBand = atoi(DvxParseCmdParam(data.text))
		snGain = atoi(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioMicEqGain(data.device, nBand, snGain)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_QUALITY_FACTOR_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_EQ_QUALITY_FACTOR:
	    {
		stack_var integer nBand
		stack_var float fQualityFactor
		
		nBand = atoi(DvxParseCmdParam(data.text))
		fQualityFactor = atof(DvxParseCmdParam(data.text))
		
		fnDvxNotifyAudioMicEqQualityFactor(data.device, nBand, fQualityFactor)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GAIN_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GAIN:
	    {
		fnDvxNotifyAudioMicGain(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GATING:
	    {
		fnDvxNotifyAudioMicGating(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_ATTACK_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GATING_ATTACK:
	    {
		fnDvxNotifyAudioMicGatingAttack(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_DEPTH_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GATING_DEPTH:
	    {
		fnDvxNotifyAudioMicGatingDepth(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_HOLD_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GATING_HOLD:
	    {
		fnDvxNotifyAudioMicGatingHold(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_RELEASE_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GATING_RELEASE:
	    {
		fnDvxNotifyAudioMicGatingRelease(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GATING_THRESHOLD_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_GATING_THRESHOLD:
	    {
		fnDvxNotifyAudioMicGatingThreshold(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_LIMITER:
	    {
		fnDvxNotifyAudioMicLimiter(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_ATTACK_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_LIMITER_ATTACK:
	    {
		fnDvxNotifyAudioMicLimiterAttack(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_RELEASE_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_LIMITER_RELEASE:
	    {
		fnDvxNotifyAudioMicLimiterRelease(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_LIMITER_THRESHOLD_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_LIMITER_THRESHOLD:
	    {
		fnDvxNotifyAudioMicLimiterThreshold(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_ON:
	    {
		fnDvxNotifyAudioMicOn(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_PHANTOM_POWER_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_PHANTOM_POWER:
	    {
		fnDvxNotifyAudioMicPhantomPower(data.device, data.text)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_PREAMP_GAIN_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_PREAMP_GAIN:
	    {
		fnDvxNotifyAudioMicPreampGain(data.device, atoi(data.text))
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_STEREO_CALLBACK
	    case cDVX_COMMAND_AUDIO_MIC_STEREO:
	    {
		fnDvxNotifyAudioMicStereo(data.device, data.text)
	    }
	    #end_if
	    
	    default:
	    {
		// Unhandled command - Do nothing!
	    }
	}
    }
}













///////////////////////////////////////////////////////////
//////////       Channel event monitoring        //////////
///////////////////////////////////////////////////////////







channel_event[dvDvxMainPorts,0]
{
    on:
    {
	switch (channel.channel)
	{
	    #if_defined INCLUDE_DVX_NOTIFY_STANDBY_MODE_CALLBACK
	    case nDVX_CHANNEL_STANDBY_MODE:
	    {
		fnDvxNotifyStandbyMode(channel.device, TRUE)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FAN_ALARM
	    case nDVX_CHANNEL_FAN_ALARM:
	    {
		fnDvxNotifyFanAlarm(channel.device, TRUE)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_TEMPERATURE_ALARM
	    case nDVX_CHANNEL_TEMPERATURE_ALARM:
	    {
		fnDvxNotifyTemperatureAlarm(channel.device, TRUE)
	    }
	    #end_if
	    
	    default:
	    {
		// do nothing
		// this is a placeholder in case no events subscriptions were declared
	    }
	}
    }
    off:
    {
	switch (channel.channel)
	{
	    #if_defined INCLUDE_DVX_NOTIFY_STANDBY_MODE_CALLBACK
	    case nDVX_CHANNEL_STANDBY_MODE:
	    {
		fnDvxNotifyStandbyMode(channel.device, FALSE)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_FAN_ALARM
	    case nDVX_CHANNEL_FAN_ALARM:
	    {
		fnDvxNotifyFanAlarm(channel.device, FALSE)
	    }
	    #end_if
	    
	    #if_defined INCLUDE_DVX_NOTIFY_TEMPERATURE_ALARM
	    case nDVX_CHANNEL_TEMPERATURE_ALARM:
	    {
		fnDvxNotifyTemperatureAlarm(channel.device, FALSE)
	    }
	    #end_if
	    
	    default:
	    {
		// do nothing
		// this is a placeholder in case no events subscriptions were declared
	    }
	}
    }
}

channel_event[dvDvxAudInPorts,0]
{
    on:
    {
	switch (channel.channel)
	{
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_MUTE_CALLBACK
	    case nDVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE:
	    {
		fnDvxNotifyAudioInGainMute(channel.device, cENABLE)
	    }
	    #end_if
	    
	    default:
	    {
		// do nothing
		// this is a placeholder in case no events subscriptions were declared
	    }
	}
    }
    off:
    {
	switch (channel.channel)
	{
	    #if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_MUTE_CALLBACK
	    case nDVX_CHANNEL_AUDIO_INPUT_GAIN_MUTE:
	    {
		fnDvxNotifyAudioInGainMute(channel.device, cDISABLE)
	    }
	    #end_if
	    
	    default:
	    {
		// do nothing
		// this is a placeholder in case no events subscriptions were declared
	    }
	}
    }
}


channel_event[dvDvxAudOutPorts,0]
{
    on:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
			case nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE:
			{
				fnDvxNotifyAudioOutMute(channel.device, cENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
    off:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
			case nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE:
			{
			fnDvxNotifyAudioOutMute(channel.device, cDISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
}


channel_event[dvDvxMicInPorts,0]
{
    on:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
			case nDVX_CHANNEL_AUDIO_MIC_ENABLE:
			{
				fnDvxNotifyAudioMicOn(channel.device, cON)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
    off:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_ON_CALLBACK
			case nDVX_CHANNEL_AUDIO_MIC_ENABLE:
			{
				fnDvxNotifyAudioMicOn(channel.device, cOFF)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
}


channel_event[dvDvxVidInPorts,0]
{
    on:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
			case nDVX_CHANNEL_VIDEO_INPUT_BLACK_AND_WHITE_STATE:
			{
				fnDvxNotifyVideoInputBlackAndWhiteState(channel.device, cENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
    off:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BLACK_AND_WHITE_STATE_CALLBACK
			case nDVX_CHANNEL_VIDEO_INPUT_BLACK_AND_WHITE_STATE:
			{
				fnDvxNotifyVideoInputBlackAndWhiteState(channel.device, cDISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
}


channel_event[dvDvxVidOutPorts,0]
{
    on:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_ENABLE:
			{
				fnDvxNotifyVideoOutputOn(channel.device, cON)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_MUTE_STATE:
			{
				fnDvxNotifyVideoOutputMute(channel.device, cENABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_FREEZE_STATE:
			{
				fnDvxNotifyVideoOutputFreeze(channel.device, cENABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_OSD_STATE:
			{
				fnDvxNotifyVideoOutputOsd(channel.device, cENABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
    off:
    {
		switch (channel.channel)
		{
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ON_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_ENABLE:
			{
				fnDvxNotifyVideoOutputOn(channel.device, cOFF)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_MUTE_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_MUTE_STATE:
			{
				fnDvxNotifyVideoOutputMute(channel.device, cDISABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_FREEZE_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_FREEZE_STATE:
			{
				fnDvxNotifyVideoOutputFreeze(channel.device, cDISABLE)
			}
			#end_if
			
			#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_OSD_CALLBACK
			case nDVX_CHANNEL_VIDEO_OUTPUT_OSD_STATE:
			{
				fnDvxNotifyVideoOutputOsd(channel.device, cDISABLE)
			}
			#end_if
			
			default:
			{
				// do nothing
				// this is a placeholder in case no events subscriptions were declared
			}
		}
    }
}




/////////////////////////////////////////////////////////
//////////       Level event monitoring        //////////
/////////////////////////////////////////////////////////


level_event[dvDvxMainPorts,0]
{
    switch (level.input.level)
    {
		#if_defined INCLUDE_DVX_NOTIFY_INTERNAL_TEMPERATURE_CALLBACK
		case nDVX_LEVEL_TEMPERATURE:
		{
			fnDvxNotifyInternalTemperature(level.input.device, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
    }
}


level_event[dvDvxAudInPorts,0]
{
    switch (level.input.level)
    {
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_IN_GAIN_CALLBACK
		case nDVX_LEVEL_AUDIO_INPUT_GAIN:
		{
			fnDvxNotifyAudioInGain(level.input.device, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
    }
}

level_event[dvDvxAudOutPorts,0]
{
    switch (level.input.level)
    {
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_VOLUME_CALLBACK
		case nDVX_LEVEL_AUDIO_OUTPUT_VOLUME:
		{
			fnDvxNotifyAudioOutVolume(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_BALANCE_CALLBACK
		case nDVX_LEVEL_AUDIO_OUTPUT_BALANCE:
		{
			fnDvxNotifyAudioOutBalance(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_EQ_GAIN_CALLBACK
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_1:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 1, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_2:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 2, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_3:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 3, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_4:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 4, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_5:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 5, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_6:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 6, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_7:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 7, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_8:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 8, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_9:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 9, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_EQ_BAND_10:
		{
			fnDvxNotifyAudioOutEqGain(level.input.device, 10, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_OUT_MIX_LEVEL_CALLBACK
		case nDVX_LEVEL_AUDIO_OUTPUT_SOURCE_MIXING_LEVEL:
		{
			fnDvxNotifyAudioOutMixLevel(level.input.device, level.value, nDVX_MIX_INPUT_LINE, level.input.device.port)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_LINE_MIC_1_MIXING_LEVEL:
		{
			fnDvxNotifyAudioOutMixLevel(level.input.device, level.value, nDVX_MIX_INPUT_MIC1, level.input.device.port)
		}
		
		case nDVX_LEVEL_AUDIO_OUTPUT_LINE_MIC_2_MIXING_LEVEL:
		{
			fnDvxNotifyAudioOutMixLevel(level.input.device, level.value, nDVX_MIX_INPUT_MIC2, level.input.device.port)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
		case nDVX_LEVEL_AUDIO_OUTPUT_SWITCHING:
		{
			fnDvxNotifySwitch(level.input.device.number:1:level.input.device.system,cSIGNAL_TYPE_AUDIO,level.value,level.input.device.port)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
    }
}

level_event[dvDvxMicInPorts,0]
{
    switch (level.input.level)
    {
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_PREAMP_GAIN_CALLBACK
		case nDVX_LEVEL_AUDIO_MIC_PREAMP_GAIN:
		{
			fnDvxNotifyAudioMicPreampGain(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_GAIN_CALLBACK
		case nDVX_LEVEL_AUDIO_MIC_GAIN:
		{
			fnDvxNotifyAudioMicGain(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_AUDIO_MIC_EQ_CALLBACK
		case nDVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_1:
		{
			fnDvxNotifyAudioMicEq(level.input.device, 1, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_2:
		{
			fnDvxNotifyAudioMicEq(level.input.device, 2, level.value)
		}
		
		case nDVX_LEVEL_AUDIO_MIC_MIC_EQ_BAND_3:
		{
			fnDvxNotifyAudioMicEq(level.input.device, 3, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
    }
}

level_event[dvDvxVidInPorts,0]
{
    switch (level.input.level)
    {
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_BRIGHTNESS_CALLBACK
		case nDVX_LEVEL_VIDEO_INPUT_BRIGHTNESS:
		{
			fnDvxNotifyVideoInputBrightness(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_SATURATION_CALLBACK
		case nDVX_LEVEL_VIDEO_INPUT_SATURATION:
		{
			fnDvxNotifyVideoInputSaturation(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_CONTRAST_CALLBACK
		case nDVX_LEVEL_VIDEO_INPUT_CONTRAST:
		{
			fnDvxNotifyVideoInputContrast(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HUE_CALLBACK
		case nDVX_LEVEL_VIDEO_INPUT_HUE:
		{
			fnDvxNotifyVideoInputHue(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_HORIZONTAL_SHIFT_CALLBACK
		case nDVX_LEVEL_VIDEO_INPUT_HORIZONTAL_SHIFT:
		{
			fnDvxNotifyVideoInputHorizontalShift(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_INPUT_VERTICAL_SHIFT_CALLBACK
		case nDVX_LEVEL_VIDEO_INPUT_VERTICAL_SHIFT:
		{
			fnDvxNotifyVideoInputVerticalShift(level.input.device, level.value)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
    }
}

level_event[dvDvxVidOutPorts,0]
{
    switch (level.input.level)
    {
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_ZOOM_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_ZOOM:
		{
			fnDvxNotifyVideoOutputZoom(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_BRIGHTNESS_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_BRIGHTNESS:
		{
			fnDvxNotifyVideoOutputBrightness(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_CONTRAST_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_CONTRAST:
		{
			fnDvxNotifyVideoOutputContrast(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SIZE_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_HORIZONTAL_SIZE:
		{
			fnDvxNotifyVideoOutputHorizontalSize(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_HORIZONTAL_SHIFT_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_HORIZONTAL_SHIFT:
		{
			fnDvxNotifyVideoOutputHorizontalShift(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SIZE_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_VERTICAL_SIZE:
		{
			fnDvxNotifyVideoOutputVerticalSize(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_VIDEO_OUTPUT_VERTICAL_SHIFT_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_VERTICAL_SHIFT:
		{
			fnDvxNotifyVideoOutputVerticalShift(level.input.device, level.value)
		}
		#end_if
		
		#if_defined INCLUDE_DVX_NOTIFY_SWITCH_CALLBACK
		case nDVX_LEVEL_VIDEO_OUTPUT_SWITCHING:
		{
			fnDvxNotifySwitch(level.input.device.number:1:level.input.device.system,cSIGNAL_TYPE_VIDEO,level.value,level.input.device.port)
		}
		#end_if
			
		default:
		{
			// do nothing
			// this is a placeholder in case no events subscriptions were declared
		}
    }
}










#end_if // __DVX_LISTENER__