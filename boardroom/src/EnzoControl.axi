PROGRAM_NAME='EnzoControl'



define_device

//dvEnzo = 5010:1:0




// Launch a web browser
define_function fnEnzoLaunchWebBrowser (dev dvEnzoDevice, char cUrl[])
{
	send_command dvEnzoDevice, "'DISPLAY-URL-',cUrl"	//*** DISPLAY.URL kills Enzo app
}

// Display a QR code on the Enzo screen that booth visitors can scan
// to capture a URL for more info on Enzo
define_function fnEnzoDisplayInfoQrCode (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, "'QR-<url>[,<title>[,<link(true|false)>]]'"
}


////////////////// Transport Controls ///////////////////
define_function fnEnzoPlay (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'PLAY'
}

define_function fnEnzoStop (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'STOP'
}

define_function fnEnzoPause (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'PAUSE'
}

define_function fnEnzoFastForward (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'FFWD'
}

define_function fnEnzoRewind (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'REWIND'
}

define_function fnEnzoNext (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'NEXT'
}

define_function fnEnzoPrevious (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'PREVIOUS'
}


////////////////// Volume Controls ///////////////////

define_function fnEnzoSetVolume (dev dvEnzoDevice, integer iVolume)
{
	send_command dvEnzoDevice, "'VOLUME-',itoa(iVolume)"
}

define_function fnEnzoEnableVolumeMute (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'VOLUME.MUTE-ON'
}

define_function fnEnzoDisableVolumeMute (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'VOLUME.MUTE-OFF'
}




////////////////// Document Navigation Controls ///////////////////

define_function fnEnzoHome (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'HOME'	//*** does not work
}

define_function fnEnzoBack (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'BACK'
}

define_function fnEnzoLeft (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'LEFT'
}

define_function fnEnzoRight (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'RIGHT'
}

define_function fnEnzoUp (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'UP'
}

define_function fnEnzoDown (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'DOWN'
}

define_function fnEnzoEnter (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'ENTER'
}

define_function fnEnzoPageUp (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'PAGE.UP'
}

define_function fnEnzoPageDown (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'PAGE.DOWN'
}


////////////////// Session Control ///////////////////

define_function fnEnzoSessionStart (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'START'
}

define_function fnEnzoSessionExit (dev dvEnzoDevice)
{
	send_command dvEnzoDevice, 'EXIT'
}

















































