PROGRAM_NAME='master'


DEFINE_DEVICE

// Base devices
dvMaster = 0:1:0

// Power distribution
dvPduBase = 85:1:0;

// RMS demo touch panels
dvDemo1Tp = 10001:1:0
dvDemo1TpRms = 10001:9:0
dvDemo2Tp = 10002:1:0
dvDemo2TpRms = 10002:9:0

// Remote scheduling panels
dvBoardroomSchedulingTp = 10005:1:0
dvBoardroomSchedulingTpRms = 10005:9:0
dvBoardroomSchedulingTpRmsExtended = 10005:10:0

// Virtual devices for RMS tracking
vdvNuc1 = 33001:1:0
vdvNuc2 = 33002:1:0
vdvLcd1 = 33003:1:0
vdvLcd2 = 33004:1:0
vdvLargeLCD = 33005:1:0
vdvEnet = 33006:1:0

// RMS core devices
vdvRms = 41001:1:0
vdvRmsGui = 41002:1:0

// Null device
dvNull = 0:0:0


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
volatile integer rmsLocationNocId = 32;
volatile char rmsLocationNocName[] = 'Integrate Network Operations Center';

// Virtual device monitor names
volatile char rmsNuc1Name[] = 'NUC 1';
volatile char rmsNuc2Name[] = 'NUC 2';
volatile char rmsLcd1Name[] = 'Left LCD';
volatile char rmsLcd2Name[] = 'Right LCD';
volatile char rmsLargeLcdName[] = 'Large LCD';
volatile char rmsEnetName[] = 'Network Switch';

// Virtual device monitor descriptions
volatile char rmsNuc1Description[] = 'Intel NUC for RMS demo 1 area in Network Operations Center';
volatile char rmsNuc2Description[] = 'Intel NUC for RMS demo 2 area in Network Operations Center';
volatile char rmsLcd1Description[] = 'LCD display for RMS demo 1 area in Network Operations Center';
volatile char rmsLcd2Description[] = 'LCD display for RMS demo 2 area in Network Operations Center';
volatile char rmsLargeLcdDescription[] = 'Large LCD display in Network Operations Center';
volatile char rmsEnetDescription[] = '8 port network switch';

// PDU guff
volatile dev pduDevices[8] = {
	vdvEnet,
	vdvNuc1,
	vdvNuc2,
	vdvLargeLCD,
	vdvLcd1,
	vdvLcd2,
	dvNull,
	dvNull
};
volatile char pduOutletNames[9][24] = {
	'Network Switch',
	'Intel NUC 1',
	'Intel NUC 2',
	'Large LCD',
	'Left LCD',
	'Right LCD',
	'Spare',
	'Spare',
	'All Outlets'
};
volatile char pduAxLinkBusNames[3][24] = {
	'AxLink Bus 1',
	'AxLink Bus 2',
	'All AxLink Busses'
};

define_module 'RmsNetLinxAdapter_dr4_0_0' mdlRms(vdvRms);

define_module 'RmsHeartAttack' mdlRmsHeartAttack(vdvRMS);

define_module 'RmsControlSystemMonitor' mdlRmsControlSys(vdvRms, dvMaster);

define_module 'RmsTouchPanelMonitor' mdlRmsDemo1Tp(vdvRms, dvDemo1Tp);
define_module 'RmsTouchPanelMonitor' mdlRmsDemo2Tp(vdvRms, dvDemo2Tp);
define_module 'RmsTouchPanelMonitor' mdlRmsBoardroomSchedulingTp(vdvRms,
		dvBoardroomSchedulingTp);

define_module 'RmsVirtualDeviceMonitor' mdlRmsNuc1(vdvRms, vdvNuc1, rmsNuc1Name, rmsNuc1Description)
define_module 'RmsVirtualDeviceMonitor' mdlRmsNuc2(vdvRms, vdvNuc2, rmsNuc2Name, rmsNuc2Description)
define_module 'RmsVirtualDeviceMonitor' mdlRmsLcd1(vdvRms, vdvLcd1, rmsLcd1Name, rmsLcd1Description)
define_module 'RmsVirtualDeviceMonitor' mdlRmsLcd2(vdvRms, vdvLcd2, rmsLcd2Name, rmsLcd2Description)
define_module 'RmsVirtualDeviceMonitor' mdlRmsLargeLcd(vdvRms, vdvLargeLCD, rmsLargeLcdName, rmsLargeLcdDescription)
define_module 'RmsVirtualDeviceMonitor' mdlRmsEnet(vdvRms, vdvEnet, rmsEnetName, rmsEnetDescription)

define_module 'RmsPowerDistributionUnitMonitor' mdlRmsPdu(vdvRms, dvPduBase, pduDevices, pduOutletNames, pduAxLinkBusNames)

define_module 'RmsClientGui_dr4_0_0' mdlRmsGui(vdvRmsGui, rmsTpRms, rmsTp);

define_module 'BoardroomSchedulingUi' mdlBoardroomUi(vdvRms,
		vdvRmsGui,
		dvBoardroomSchedulingTpRmsExtended,
		dvBoardroomSchedulingTp,
		rmsLocationBoardroomId,
		rmsLocationBoardroomName);

define_module 'RmsDemoUi' mdlRmsDemo1(vdvRms,
		vdvRmsGui,
		dvDemo1Tp,
		dvDemo1Tp,
		rmsLocationNocId,
		rmsLocationNocName);

define_module 'RmsDemoUi' mdlRmsDemo2(vdvRms,
		vdvRmsGui,
		dvDemo2Tp,
		dvDemo2Tp,
		rmsLocationNocId,
		rmsLocationNocName);

define_module 'RmsSchedulingEventLogger' mdlRmsSchedulingLogger(vdvRms);


define_event

data_event[vdvRms] {

	online: {
		// turn on heartattach so that we have a nice response time for messages
		send_command vdvRms, '@config.client.heartattack-true,3';
	}

}

