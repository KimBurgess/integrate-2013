PROGRAM_NAME='NecMonitorControl'


include 'SNAPI'


define_function fnNecMonitorEnablePower (dev vdvMonitor)
{
    pulse[vdvMonitor, PWR_ON]
}



define_function fnNecMonitorDisablePower (dev vdvMonitor)
{
    pulse[vdvMonitor, PWR_OFF]
}


define_module 'NEC_NPPA600X_Comm_dr1_0_0' mMonitorLeft (vdvMonitorLeft, dvMonitorLeft)
define_module 'NEC_NPPA600X_Comm_dr1_0_0' mMonitorRight (vdvMonitorRight, dvMonitorRight)