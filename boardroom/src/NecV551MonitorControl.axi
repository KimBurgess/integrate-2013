PROGRAM_NAME='NecV551MonitorControl'


//define_device

//vdvNECP402 = 41001:1:0  // The COMM module should use this as its duet device
//vdvNECP402_1 = 41001:2:0  // The COMM module should use this as its duet device

// serial control
//dvNECP402 = 5001:1:0 // This device should be used as the physical device by the COMM module
//IP control
//dvNECP402 = 0:3:0 // This device should be used as the physical device by the COMM module

define_variable

char cIpAddressMonitorLeft[] = '192.168.4.102'
char cIpAddressMonitorRight[] = '192.168.4.103'


define_module 'NEC_P402_Comm_dr1_0_0' comm(vdvMonitorLeft, dvMonitorLeft)
define_module 'NEC_P402_Comm_dr1_0_0' comm(vdvMonitorRight, dvMonitorRight)



define_event


data_event[vdvMonitorLeft]
{
	online:
	{
		send_command vdvMonitorLeft, 'PROPERTY-Poll_Time,10000'
		send_command vdvMonitorLeft, 'PROPERTY-Device_ID,0'
		send_command vdvMonitorLeft, "'PROPERTY-IP_Address,',cIpAddressMonitorLeft"
		send_command vdvMonitorLeft, 'REINIT'
	}
}


data_event[vdvMonitorRight]
{
	online:
	{
		send_command vdvMonitorRight, 'PROPERTY-Poll_Time,10000'
		send_command vdvMonitorRight, 'PROPERTY-Device_ID,0'
		send_command vdvMonitorRight, "'PROPERTY-IP_Address,',cIpAddressMonitorRight"
		send_command vdvMonitorRight, 'REINIT'
	}
}



