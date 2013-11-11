    PROGRAM_NAME='LightingControl'





#if_not_defined __LIGHTING_CONTROL__
#define __LIGHTING_CONTROL__



define_device

#if_not_defined dvLight
//dvLight = 5001:1:0
dvLight = 0:3:0
#end_if

#if_not_defined vdvLight
vdvLight = 33001:1:0
#end_if


define_variable

char cLightStatus[255]

define_constant

char cLightAddressBoardroom[]		= '00:38:00'

define_module 'CBus_Comm' mCbusNetLinx (vdvLight, dvLight, cLightStatus)

//'Clipsal_CBus_Comm_dr1_0_0' mCbusDuet(vdvLight, dvLight)

DEFINE_EVENT
DATA_EVENT[vdvLight]
{
	ONLINE:
	{
		SEND_COMMAND vdvLight, "'PROPERTY-IPADDRESS,192.168.4.101'"
		SEND_COMMAND vdvLight, "'PROPERTY-IPPORT,10001'"
		SEND_COMMAND vdvLight, "'REINIT'"
		WAIT 50
		SEND_COMMAND vdvLight, "'PROPERTY-SYNCH,3'"
	}
}












#end_if __LIGHTING_CONTROL__