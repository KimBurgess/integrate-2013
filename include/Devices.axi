PROGRAM_NAME='Devices'


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
dvBoardroomSchedulingTpRmsNfc = 10005:11:0

// RMS core devices
vdvRms = 41001:1:0
vdvRmsGui = 41002:1:0
