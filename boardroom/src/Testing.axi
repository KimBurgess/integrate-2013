PROGRAM_NAME='Testing'

DEFINE_DEVICE
dvTesting = 8001:1:0

DEFINE_CONSTANT

INTEGER btnTesting[] =
{
	1,
	2,
	3,
	4,
	5,
	6
}


//FUNCTIONS
DEFINE_FUNCTION fnDisplayOn(DEV dvDEV)
{
	SEND_STRING dvDEV,  "$02,$00,$00,$00,$00,$02"
}

DEFINE_FUNCTION fnDisplayOff(DEV dvDEV)
{
	SEND_STRING dvDEV,  "$02,$01,$00,$00,$00,$03"
}

DEFINE_FUNCTION fnDisplaysOn()
{
	fnDisplayOn(dvDxlinkRxMonitorLeftSerial)
	fnDisplayOn(dvDxlinkRxMonitorRightSerial)
}

DEFINE_FUNCTION fnDisplaysOff()
{
	fnDisplayOff(dvDxlinkRxMonitorLeftSerial)
	fnDisplayOff(dvDxlinkRxMonitorRightSerial)
}

DEFINE_EVENT

BUTTON_EVENT[dvTesting,1]
{
	PUSH:
	{
		SWITCH (GET_LAST(btnTesting))
		{
			CASE 1: fnDisplaysOn()
			CASE 2: fnDisplaysOff()
		}
	}
}

DATA_EVENT[dvDxlinkRxMonitorLeftSerial]
DATA_EVENT[dvDxlinkRxMonitorRightSerial]
{
	ONLINE:
	{
		SEND_COMMAND DATA.DEVICE, 'SET BAUD 9600, N, 8, 1 485 DISABLE'
	}
}