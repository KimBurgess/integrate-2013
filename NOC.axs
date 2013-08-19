PROGRAM_NAME='master'


DEFINE_DEVICE

// Base devices
dvMaster = 0:1:0

// RMS demo touch panels
dvDemo1Tp = 10001:1:0
dvDemo1TpRms = 10001:9:0
dvDemo2Tp = 10002:1:0
dvDemo2TpRms = 10002:9:0

// Remote scheduling panels
dvBoardroomSchedulingTp = 10005:1:0
dvBoardroomSchedulingTpRms = 10005:9:0
dvBoardroomSchedulingTpRmsExtended = 10005:10:0

// RMS core devices
vdvRms = 41001:1:0
vdvRmsGui = 41002:1:0


define_variable

// touch panels for control from RMS client UI module
volatile dev rmsTpRms[] = {
	dvDemo1TpRms,
	dvDemo2TpRms,
	dvBoardroomSchedulingTpRms
};

// base TP addresses for rms client UI module usage
volatile dev rmsTp[] = {
	dvDemo1Tp,
	dvDemo2Tp,
	dvBoardroomSchedulingTp
};

// touch panel RMS location information (temp only due to bug in SDK v4.1.13)
volatile integer rmsLocationBoardroomId = 29;
volatile char rmsLocationBoardroomName[] = 'Integrate Boardroom';


define_module 'RmsNetLinxAdapter_dr4_0_0' mdlRms(vdvRms);

define_module 'RmsHeartAttack' mdlRmsHeartAttack(vdvRMS);

define_module 'RmsControlSystemMonitor' mdlRmsControlSys(vdvRms, dvMaster);

define_module 'RmsTouchPanelMonitor' mdlRmsDemo1Tp(vdvRms, dvDemo1Tp);
define_module 'RmsTouchPanelMonitor' mdlRmsDemo2Tp(vdvRms, dvDemo2Tp);
define_module 'RmsTouchPanelMonitor' mdlRmsBoardroomSchedulingTp(vdvRms,
		dvBoardroomSchedulingTp);

define_module 'RmsClientGui_dr4_0_0' mdlRmsGui(vdvRmsGui, rmsTpRms, rmsTp);

define_module 'RmsExtendedClientGui' mdlRmsGuiBoardroom(vdvRMS,
		dvBoardroomSchedulingTpRmsExtended,
		dvBoardroomSchedulingTp,
		rmsLocationBoardroomId,
		rmsLocationBoardroomName);
