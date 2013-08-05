PROGRAM_NAME='master'


DEFINE_DEVICE

dvMaster = 0:1:0

vdvRms = 41001:1:0


define_module 'RmsNetLinxAdapter_dr4_0_0' mdlRms(vdvRms)

define_module 'RmsControlSystemMonitor' mdlRmsControlSys(vdvRms, dvMaster)