PROGRAM_NAME='master'

#INCLUDE 'Devices';
#INCLUDE 'UI';

define_module 'RmsNetLinxAdapter_dr4_0_0' mdlRms(vdvRms)

define_module 'RmsControlSystemMonitor' mdlRmsControlSys(vdvRms, dvMaster)

define_module 'RmsTouchPanelMonitor' mdlRmsDemo1Tp(vdvRms, dvDemo1Tp)
define_module 'RmsTouchPanelMonitor' mdlRmsDemo2Tp(vdvRms, dvDemo2Tp)
define_module 'RmsTouchPanelMonitor' mdlRmsBoardroomSchedulingTp(vdvRms, dvBoardroomSchedulingTp)
