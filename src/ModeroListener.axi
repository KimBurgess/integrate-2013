PROGRAM_NAME='ModeroListener'




#if_not_defined __MODERO_LISTENER__
#define __MODERO_LISTENER__


define_variable

#if_not_defined dvPanelsToMonitor
dev dvPanelsToMonitor[] = {10001:1:0}
#end_if

#if_not_defined dvIpSocketToMonitorTouchCoordinates
dev dvIpSocketToMonitorTouchCoordinates = 0:2:0
#end_if


/*
#define INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_PRESS
// Note: This will get triggered BEFORE a push event handler in a button_event
// Note: If push/release coordinate reporting is enabled a push anywhere on the panel will trigger this function
define_function fnModeroNotifyTouchCoordinatesPress (dev dvPanel, integer nX, integer nY)
{
    
}
*/

/*
#define INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_MOVE
// Note: This will get triggered BEFORE a push event handler in a button_event
// Note: If push/release coordinate reporting is enabled a movement in user touch anywhere on the panel will trigger this function
define_function fnModeroNotifyTouchCoordinatesMove (dev dvPanel, integer nX, integer nY)
{
    
}
*/

/*
#define INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_RELEASE
// Note: This will get triggered AFTER a release event handler in a button_event
// Note: If push/release coordinate reporting is enabled a release anywhere on the panel will trigger this function
define_function fnModeroNotifyTouchCoordinatesRelease (dev dvPanel, integer nX, integer nY)
{
    
}
*/



define_event

data_event[dvPanelsToMonitor]
{
    string:
    {
	if (find_string(data.text, 'Press,' ,1) == 1)	// Starts with 'Press,'
	{
	    // String is in format 'Press,X,Y' where X and Y are the (X,Y) coordinates of the touch
	    
	    stack_var integer nX
	    stack_var integer nY
	    
	    remove_string (data.text, 'Press,', 1)
	    nX = atoi (data.text)
	    remove_string (data.text, "','", 1)
	    nY = atoi (data.text)
	    
	    #if_defined INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_PRESS
	    fnModeroNotifyTouchCoordinatesPress (data.device, nX, nY)
	    #end_if
	    
	}
	
	if (find_string(data.text, 'Move,' ,1) == 1)	// Starts with 'Move,'
	{
	    // String is in format 'Press,X,Y' where X and Y are the (X,Y) coordinates of the touch
	    
	    stack_var integer nX
	    stack_var integer nY
	    
	    remove_string (data.text, 'Move,', 1)
	    nX = atoi (data.text)
	    remove_string (data.text, "','", 1)
	    nY = atoi (data.text)
	    
	    #if_defined INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_MOVE
	    fnModeroNotifyTouchCoordinatesMove (data.device, nX, nY)
	    #end_if
	}
	
	else if (find_string(data.text, 'Release,' ,1) == 1)	// Starts with 'Release,'
	{
	    // String is in format 'Press,X,Y' where X and Y are the (X,Y) coordinates of the release
	    
	    stack_var integer nX
	    stack_var integer nY
	    
	    remove_string (data.text, 'Release,', 1)
	    nX = atoi (data.text)
	    remove_string (data.text, "','", 1)
	    nY = atoi (data.text)
	    
	    #if_defined INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_RELEASE
	    fnModeroNotifyTouchCoordinatesRelease (data.device, nX, nY)
	    #end_if
	}
    }
}






data_event[dvIpSocketToMonitorTouchCoordinates]
{
    online:
    {
	}
    offline:
    {
		wait 20
		{
			nTcpIpPortModeroTouchCoordinatesNotifications++
			fnModeroDisableTouchNotificationIpPort (dvTpBoardroomTableMain)
			wait 20
			{
				fnModeroEnableTouchNotificationIpPort (dvTpBoardroomTableMain, nTcpIpPortModeroTouchCoordinatesNotifications)
			wait 20
			{
				fnModeroConnectToTouchNotificationPort (data.device.port, cPanelIpAddress, nTcpIpPortModeroTouchCoordinatesNotifications)
			}
			}
		}
    }
    onerror:
    {
		switch (data.number)
		{
			case 6:	// connection refused
			case 7:	// connection timed out
			case 8:	// unknown connection error
			{
			
			wait 20
			{
				nTcpIpPortModeroTouchCoordinatesNotifications++
				fnModeroDisableTouchNotificationIpPort (dvTpBoardroomTableMain)
				wait 20
				{
					fnModeroEnableTouchNotificationIpPort (dvTpBoardroomTableMain, nTcpIpPortModeroTouchCoordinatesNotifications)
				wait 20
				{
					fnModeroConnectToTouchNotificationPort (data.device.port, cPanelIpAddress, nTcpIpPortModeroTouchCoordinatesNotifications)
				}
				}
			}
			}
		}
    }
    string:
    {
		while ( find_string(data.text,"$0A",1) )
		{
			stack_var char cMessage[50]
			
			cMessage = remove_string(data.text, "$0A",1)
			
			if (find_string(cMessage, 'Press,' ,1) == 1)	// Starts with 'Press,'
			{
				// String is in format 'Press,X,Y' where X and Y are the (X,Y) coordinates of the touch
				stack_var integer nX
				stack_var integer nY
				
				remove_string (cMessage, 'Press,', 1)
				nX = atoi (cMessage)
				remove_string (cMessage, "','", 1)
				nY = atoi (cMessage)
				
				#if_defined INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_PRESS
				fnModeroNotifyTouchCoordinatesPress (data.device, nX, nY)
				#end_if
			}
			
			if (find_string(cMessage, 'Move,' ,1) == 1)	// Starts with 'Move,'
			{
				// String is in format 'Press,X,Y' where X and Y are the (X,Y) coordinates of the touch
				stack_var integer nX
				stack_var integer nY
				
				remove_string (cMessage, 'Move,', 1)
				nX = atoi (cMessage)
				remove_string (cMessage, "','", 1)
				nY = atoi (cMessage)
				
				#if_defined INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_MOVE
				fnModeroNotifyTouchCoordinatesMove (data.device, nX, nY)
				#end_if
			}
			
			else if (find_string(cMessage, 'Release,' ,1) == 1)	// Starts with 'Release,'
			{
				// String is in format 'Press,X,Y' where X and Y are the (X,Y) coordinates of the release
				stack_var integer nX
				stack_var integer nY
				
				remove_string (cMessage, 'Release,', 1)
				nX = atoi (cMessage)
				remove_string (cMessage, "','", 1)
				nY = atoi (cMessage)
				
				#if_defined INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_RELEASE
				fnModeroNotifyTouchCoordinatesRelease (data.device, nX, nY)
				#end_if
			}
		}
    }
}



















#end_if __MODERO_LISTENER__