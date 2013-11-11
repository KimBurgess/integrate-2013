PROGRAM_NAME='MplControl'


#if_not_defined __MPL_CONTROL__
#define __MPL_CONTROL__






DEFINE_CONSTANT

char cMPL_STREAM_TYPE_AUDIO[] = 'audio'
char cMPL_STREAM_TYPE_VIDEO[] = 'video'
char cMPL_STREAM_TYPE_BOTH[] = 'both'

char cMPL_FORMAT_HDMI[] = 'hdmi'
char cMPL_FORMAT_DVI[] = 'dvi'
char cMPL_FORMAT_VGA[] = 'vga'
char cMPL_FORMAT_SVGA[] = 'svga'
char cMPL_FORMAT_XGA[] = 'xga'
char cMPL_FORMAT_WXGA[] = 'wxga'
char cMPL_FORMAT_COMPONENT[] = 'component'
char cMPL_FORMAT_SVIDEO[] = 'svideo'
char cMPL_FORMAT_COMPOSITE[] = 'composite'


char cMPL_MODE_SNAPSHOT[] = 'snapshot'
char cMPL_MODE_VIDEO_PREVIEW[] = 'video preview'


// Turn on the video input to the MXA-MP/MPL
define_function fnMplEnableVideoInput (dev dvPanel)
{
    send_command dvPanel, '^SLT-1,videoinput=on'
}

// Turn off the video input to the MXA-MP/MPL
define_function fnMplDisableVideoInput (dev dvPanel)
{
    send_command dvPanel, '^SLT-1,videoinput=off'
}

// Reboot the MXA-MP/MPL
define_function fnMplReboot (dev dvPanel)
{
    send_command dvPanel, '^SLT-1,reboot'
}

// Tell the MXA-MPL to start streaming audio, video, or both
define_function fnMplEnableStream (dev dvPanel, char cStreamType[])
{
    switch (cStreamType)
    {
	case cMPL_STREAM_TYPE_AUDIO:
	case cMPL_STREAM_TYPE_VIDEO:
	case cMPL_STREAM_TYPE_BOTH:
	{
	    send_command dvPanel, "'^SLT-1,start=',cStreamType"
	}
    }
}

// Tell the MXA-MPL to stop streaming
define_function fnMplDisableStream (dev dvPanel)
{
    send_command dvPanel, '^SLT-1,stop'
}
// Set the option to enable audio, video, or both on subsequent streams from the MXA-MPL
define_function fnMplSetStreamType (dev dvPanel, char cStreamType[])
{
    switch (cStreamType)
    {
	case cMPL_STREAM_TYPE_AUDIO:
	case cMPL_STREAM_TYPE_VIDEO:	// default behaviour
	case cMPL_STREAM_TYPE_BOTH:
	{
	    send_command dvPanel, "'^SLT-1,audiovideoenable=',cStreamType"
	}
    }
}

// Set format, resolution, and rate for the MXA-MPL video input.
define_function fnMplSetVideoInputFormatAndResolution (dev dvPanel, char cFormat[], char cResolutionRefresh[])
{
    // Resolution/Refresh Rate in form of:
    //		<horizontal>x<vertical><i|p>@<rate>
    //		E.g:
    //			
    switch (cFormat)
    {
	case cMPL_FORMAT_HDMI:
	case cMPL_FORMAT_DVI:
	{
	    switch (cResolutionRefresh)
	    {
		case '640x480p@30':
		case '800x600p@30':
		case '1024x768p@30':
		case '1280x720p@30':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_VGA:
	{
	    switch (cResolutionRefresh)
	    {
		case '640x480p@30':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_SVGA:
	{
	    switch (cResolutionRefresh)
	    {
		case '800x600p@30':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_XGA:
	{
	    switch (cResolutionRefresh)
	    {
		case '1024x768p@30':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_WXGA:
	{
	    switch (cResolutionRefresh)
	    {
		case '1280x768p@30':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_COMPONENT:
	{
	    switch (cResolutionRefresh)
	    {
		case '720x480i@30':
		case '720x480p@30':
		case '720x576i@30':
		case '720x576p@25':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_SVIDEO:
	{
	    switch (cResolutionRefresh)
	    {
		case 'ntsc':
		case 'pal-bghid':
		case 'pal-m':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
	case cMPL_FORMAT_COMPOSITE:
	{
	    switch (cResolutionRefresh)
	    {
		case 'ntsc':
		case 'pal-bghid':
		case 'pal-m':
		    send_command dvPanel, "'^SLT-1,videomode=',cFormat,',',cResolutionRefresh"
	    }
	}
    }
}


DEFINE_FUNCTION fnMplTakeSnapshot (dev dvPanel, integer nSlot)
{
    //SEND_COMMAND dvPanel,"'^RFRP-',cImg,',once'"
    //OR
    //SEND_COMMAND dvPanel,"'^RMF-MXA_PVW_',ITOA(nCurrent),',%V0'"
    //SEND_COMMAND dvPanel,"'^BBR-',ITOA(nVT_PVW_WIN[nSource]),',1,',cImg"
    //SEND_COMMAND dvPanel,"'^RMF-MXA_PVW_',ITOA(nCurrent),',%V1'"
}



#end_if __MPL_CONTROL__