PROGRAM_NAME='master'


DEFINE_DEVICE

// Base devices
dvMaster = 0:1:0

// RMS demo touch panels
dvRmsDemo1TpBase = 10001:1:0
dvRmsDemo2TpBase = 10002:1:0

// Scheduling panels
dvBoardroomSchedulingTpBase = 10005:1:0
dvBoardroomSchedulingTpRms = 10005:9:0

// RMS core
vdvRms = 41001:1:0
vdvRmsGui = 41002:1:0


define_module 'RmsNetLinxAdapter_dr4_0_0' mdlRms(vdvRms)

define_module 'RmsControlSystemMonitor' mdlRmsControlSys(vdvRms, dvMaster)

define_module 'RmsTouchPanelMonitor' mdlRmsDemo1Tp(vdvRms, dvRmsDemo1TpBase)
define_module 'RmsTouchPanelMonitor' mdlRmsDemo2Tp(vdvRms, dvRmsDemo2TpBase)
define_module 'RmsTouchPanelMonitor' mdlRmsBoardroomSchedulingTp(vdvRms, dvBoardroomSchedulingTpBase)

