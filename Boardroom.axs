PROGRAM_NAME='Integrate 2013 Boardroom'





DEFINE_CONSTANT

////////////////////// Touch Panel Ports
integer nPortTpMain			= 1		// Main
integer nPortTpSourceSelect	= 2		// Source Selection
integer nPortTpLighting		= 3		// Lighting
integer nPortTpVolume		= 4		// Volume Control
integer nPortTpBluray		= 5		// Bluray Control
integer nPortTpRMS			= 7
integer nPortTpTv			= 8
integer nPortTpCamera		= 9
integer nPortTpMftx			= 10
integer nPortTpEnzo			= 11
integer nPortVTpVc			= 12
integer nPortTpCodeTesting	= 100		// Testing Code





(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE

dvNull		= 0:0:0
dvSystem	= 0:1:0

dvIpSocketToMonitorTouchCoordinates = 0:2:0

dvPDU_01		=	85:1:0		//pdu base address
dvPDU_02		=	86:1:0		//pdu base address

/////////////////////////// Table Touch Panel Ports
dvTpBoardroomTableMain				= 10001:nPortTpMain:0
dvTpBoardroomTableSourceselect		= 10001:nPortTpSourceSelect:0
dvTpBoardroomTableLighting			= 10001:nPortTpLighting:0
dvTpBoardroomTableVolume			= 10001:nPortTpVolume:0
dvTpBoardroomTableCodeTesting		= 10001:nPortTpCodeTesting:0
dvTpBoardroomTableBluray			= 10001:nPortTpBluray:0
dvTpBoardroomTableRMS				= 10001:nPortTpRMS:0 // RMS tp control device
dvTpBoardroomTableTv				= 10001:nPortTpTv:0
dvTpBoardroomTableCamera			= 10001:nPortTpCamera:0
dvTpBoardroomTableMftx				= 10001:nPortTpMftx:0
dvTpBoardroomTableEnzo				= 10001:nPortTpEnzo:0
dvTpBoardroomTableVc				= 10001:nPortVTpVc:0

dvTpWelcomeRmsBase			= 10005:1:0
dvTpWelcomeRmsGui			= 10005:9:0
dvTpWelcomeRmsGuiExtended	= 10005:10:0

/////////////////////////// Wall Touch Panel Ports
dvTpWallMain				= 10002:nPortTpMain:0
dvTpWallRMS					= 10002:nPortTpRMS:0 // RMS tp control device

/////////////////////////// DVX Ports
dvDvxMainPort				= 5002:1:0
dvDvxPort1 					= dvDvxMainPort

dvDvxVidOutMonitorLeft				= 5002:1:0
dvDvxVidOutMonitorRight				= 5002:2:0
dvDvxVidOutFeedToTrainingRoomDvx	= 5002:3:0
dvDvxVidOutMplInput					= 5002:4:0

dvDvxVidInNone				= 5002:0:0
dvDvxVidInVcCamera			= 5002:1:0
dvDvxVidInSignage			= 5002:2:0
dvDvxVidIn03				= 5002:3:0
dvDvxVidIn04				= 5002:4:0
dvDvxVidInDTV				= 5002:5:0
dvDvxVidInBluray			= 5002:6:0
dvDvxVidInVcMain			= 5002:7:0
dvDvxVidInEnzo				= 5002:8:0
dvDvxVidInLaptop			= 5002:9:0
dvDvxVidInRoomLink			= 5002:10:0

dvDvxAudOutSpeakersFrontOfHouse 	= 5002:2:0	// analog audio output 2 (1st line out)
dvDvxAudOutRackPcMicInput			= 5002:4:0

dvDvxAudInNone				= 5002:0:0
dvDvxAudInVcCamera			= 5002:1:0
dvDvxAudInSignage			= 5002:2:0
dvDvxAudIn03				= 5002:3:0
dvDvxAudIn04				= 5002:4:0
dvDvxAudInDTV				= 5002:5:0
dvDvxAudInBluray			= 5002:6:0
dvDvxAudInVcMain			= 5002:7:0
dvDvxAudInEnzo				= 5002:8:0
dvDvxAudInLaptop			= 5002:9:0
dvDvxAudInRoomLink		 	= 5002:10:0

dvDvxMicInDesk				= 5002:1:0

////////////////////////////// DXLink Devices
dvDxlinkMfTxLaptopMain			= 6001:1:0	// MFTX under boardroom table
dvDxlinkMfTxLaptopVidOut		= 6001:6:0
dvDxlinkMfTxLaptopAudOut		= 6001:6:0
dvDxlinkMfTxLaptopVidInDigital	= 6001:7:0
dvDxlinkMfTxLaptopAudIn			= 6001:7:0
dvDxlinkMfTxLaptopVidInAnalog	= 6001:8:0

dvDxlinkRxMonitorLeftMain		= 7001:1:0
dvDxlinkRxMonitorLeftSerial		= 7001:1:0
dvDxlinkRxMonitorLeftVidOut		= 7001:6:0
dvDxlinkRxMonitorLeftAudOut		= 7001:6:0
dvDxlinkRxMonitorLeftVidIn		= 7001:7:0
dvDxlinkRxMonitorLeftAudIn		= 7001:7:0

dvDxlinkRxMonitorRightMain		= 7002:1:0
dvDxlinkRxMonitorRightSerial	= 7002:1:0
dvDxlinkRxMonitorRightIrTx		= 7002:3:0
dvDxlinkRxMonitorRightIrRx		= 7002:4:0
dvDxlinkRxMonitorRightUsb		= 7002:5:0
dvDxlinkRxMonitorRightVidOut	= 7002:6:0
dvDxlinkRxMonitorRightAudOut	= 7002:6:0
dvDxlinkRxMonitorRightVidIn		= 7002:7:0
dvDxlinkRxMonitorRightAudIn		= 7002:7:0

/////////////////////////////// Enzo
dvEnzo 						= 5010:1:0

/////////////////////////////// IR Controlled Devices
dvIrBluray 					= 5001:9:0	// Sony BDP-S370 Bluray Player

////////////////////////////// RS232 Controlled Devices
dvMonitorLeft				= 0:3:0
vdvMonitorLeft				= 41001:1:0

dvMonitorRight				= 0:4:0
vdvMonitorRight				= 41002:1:0

dvCamera 					= 5001:1:0
vdvCamera 					= 41003:1:0

////////////////////////////// IO devices
dvIoPorts 					= 5001:17:0

////////////////////////////// RMS
vdvRMS 						= 41004:1:0 //virtual device for RMS Main
vdvRMSGui 					= 41005:1:0 //virtual device for RMS GUI

////////////////////////////// IPTV
vdvIpTv						= 41006:1:0

////////////////////////////// virtual devices for reporting laptop to rms
vdvLaptop						= 33102:1:0
vdvDimmer						= 33103:1:0
vdvRMSSourceUsage				= 33104:1:0
vdvRouter_01					= 33105:1:0
vdvRouter_02					= 33106:1:0
vdvEnzo							= 33107:1:0
vdvDTV							= 33108:1:0
vdvSignage						= 33109:1:0
vdvMPL							= 33111:1:0





include 'NecMonitorControl'
include 'SonyEvid100CameraControl'
include 'NecV551MonitorControl'

include 'TvControl'
include 'EnzoControl'
include 'EnzoVirtualKeyPad'
include 'User'
include 'RmsBookingUserAssociation'
include 'TimeUtil'





(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

nNUM_OF_SOURCES_TO_SELECT = 10
nNUM_OF_DESTINATIONS = 4

// Indexes to use for arrays storing source information
nINDEX_SOURCE_NONE = 0
nINDEX_SOURCE_VC_CAMERA = 1
nINDEX_SOURCE_SIGNAGE = 2
nINDEX_SOURCE_INPUT_03 = 3
nINDEX_SOURCE_INPUT_04 = 4
nINDEX_SOURCE_DTV = 5
nINDEX_SOURCE_BLURAY = 6
nINDEX_SOURCE_VC_MAIN = 7
nINDEX_SOURCE_ENZO = 8
nINDEX_SOURCE_LAPTOP = 9
nINDEX_SOURCE_ROOM_LINK = 10

// Indexes to use for arrays storing destination information
nINDEX_DEST_NONE = 0
nINDEX_DEST_MONITOR_LEFT = 1
nINDEX_DEST_MONITOR_RIGHT = 2
nINDEX_DEST_MULTI_PREVIEW = 3
nINDEX_DEST_TRAINING_DVX = 4

// Constants for the different options for each possible destination to choose from source select drag and drop feature
integer nDRAG_AND_DROP_DESTINATION_OPTION_NONE = 0
integer nDRAG_AND_DROP_DESTINATION_OPTION_MONITOR_LEFT = 1
integer nDRAG_AND_DROP_DESTINATION_OPTION_MONITOR_RIGHT = 2

/////////////////////// System Buttons
integer nBtnSystemShutdown = 1
integer nBtnSystemSendRmsHelpRequest = 2
integer nBtnSystemSplash = 3
integer nBtnSystemConfirmSwitchForInputWithNoSignal = 4
integer nBtnSystemCancelSwitchForInputWithNoSignal = 5
integer nBtnSystemPowerOffMonitors = 6
integer nBtnSystemBookAdHocMeeting = 10

integer nAdrSystemSplashScreenLockIcon = 7
integer nAdrSystemSplashScreenCurrentMeetingMessage = 8
integer nAdrSystemMeetingDueToCommenceInMinutes = 11
integer nAdrSystemMeetingReservationNotAllowedMsg1 = 12
integer nAdrSystemMeetingReservationNotAllowedMsg2 = 13
integer nAdrSystemBookingFailedReason = 14
integer nAdrSystemCreatingBookingMsg = 15
integer nAdrSystemMeetingDuration = 16
integer nAdrSystemWelcomeUserGreeting = 17

/////////////////////// Source/Destination Selection Buttons
integer nBtnSourceSelectVcCamera = 1
integer nBtnSourceSelectSignage = 2
integer nBtnSourceSelectInput03 = 3
integer nBtnSourceSelectInput04 = 4
integer nBtnSourceSelectDTV = 5
integer nBtnSourceSelectBluray = 6
integer nBtnSourceSelectVcMain = 7
integer nBtnSourceSelectEnzo = 8
integer nBtnSourceSelectLaptop = 9
integer nBtnSourceSelectRoomLink = 10

integer nAdrSourceSelectVcCamera = 1
integer nAdrSourceSelectSignage = 2
integer nAdrSourceSelectInput03 = 3
integer nAdrSourceSelectInput04 = 4
integer nAdrSourceSelectDTV = 5
integer nAdrSourceSelectBluray = 6
integer nAdrSourceSelectVcMain = 7
integer nAdrSourceSelectEnzo = 8
integer nAdrSourceSelectLaptop = 9
integer nAdrSourceSelectRoomLink = 10

integer nBtnSourceLabelVcCamera = 11
integer nBtnSourceLabelSignage = 12
integer nBtnSourceLabelInput03 = 13
integer nBtnSourceLabelInput04 = 14
integer nBtnSourceLabelDTV = 15
integer nBtnSourceLabelBluray = 16
integer nBtnSourceLabelVcMain = 17
integer nBtnSourceLabelEnzo = 18
integer nBtnSourceLabelLaptop = 19
integer nBtnSourceLabelRoomLink = 20

integer nAdrSourceLabelVcCamera = 11
integer nAdrSourceLabelSignage = 12
integer nAdrSourceLabelInput03 = 13
integer nAdrSourceLabelInput04 = 14
integer nAdrSourceLabelDTV = 15
integer nAdrSourceLabelBluray = 16
integer nAdrSourceLabelVcMain = 17
integer nAdrSourceLabelEnzo = 18
integer nAdrSourceLabelLaptop = 19
integer nAdrSourceLabelRoomLink = 20

integer nBtnDestinationSelectMonitorLeft = 21
integer nBtnDestinationSelectMonitorRight = 22

integer nAdrDestinationSelectMonitorLeft = 21
integer nAdrDestinationSelectMonitorRight = 22

integer nBtnDestinationSelectDragAndDropMonitorLeft = 23
integer nBtnDestinationSelectDragAndDropMonitorRight = 24

integer nAdrDestinationSelectDragAndDropMonitorLeft = 23
integer nAdrDestinationSelectDragAndDropMonitorRight = 24

integer nBtnAudioSelectMonitorLeft = 25
integer nBtnAudioSelectMonitorRight = 26

integer nAdrDragAndDropUserTouchCoordinateIcon = 100

////////////////////// Volume Control Buttons
integer nLvlTpVolumeBargraph = 1		// bargraph range 0-100 (same as DVX audio output volume range)

integer nBtnVolumeMuteToggle = 2

///////////////////// Video Conference buttons
integer nBtnVcAnswer = 200
integer nBtnVcHangup = 201
integer nBtnVcSelectCam = 202

///////////////////// Lighting Buttons
integer nBtnLightsUp = 1
integer nBtnLightsDown = 2
integer nBtnLightsOff = 3
integer nBtnLightsOn = 4
integer nBtnLightsMid = 5

///////////////////// Camera control buttons
integer nBtnCameraPanLeft	= 1
integer nBtnCameraPanRight	= 2
integer nBtnCameraTiltUp	= 3
integer nBtnCameraTiltDown	= 4
integer nBtnCameraFocusNear	= 5
integer nBtnCameraFocusFar	= 6
integer nBtnCameraZoomIn	= 7
integer nBtnCameraZoomOut	= 8

///////////////////// BluRay control buttons
integer nBtnBlurayPlay = 1
integer nBtnBlurayStop = 2
integer nBtnBlurayPause = 3
integer nBtnBlurayNextChapter = 4
integer nBtnBlurayPrevChapter = 5
integer nBtnBlurayFastForward = 6
integer nBtnBlurayFastReverse = 7
integer nBtnBlurayCursorUp = 45
integer nBtnBlurayCursorDown = 46
integer nBtnBlurayCursorLeft = 47
integer nBtnBlurayCursorRight = 48
integer nBtnBlurayExit = 50
integer nBtnBlurayReturn = 54
integer nBtnBluraySelect = 49
integer nBtnBlurayPowerToggle = 9
integer nBtnBlurayDigit0 = 10
integer nBtnBlurayDigit1 = 11
integer nBtnBlurayDigit2 = 12
integer nBtnBlurayDigit3 = 13
integer nBtnBlurayDigit4 = 14
integer nBtnBlurayDigit5 = 15
integer nBtnBlurayDigit6 = 16
integer nBtnBlurayDigit7 = 17
integer nBtnBlurayDigit8 = 18
integer nBtnBlurayDigit9 = 19
integer nBtnBlurayMenu = 44
integer nBtnBlurayOpenClose = 80
integer nBtnBlurayAudio = 89
integer nBtnBluraySearch = 75
integer nBtnBluraySubtitle = 57
integer nBtnBlurayTools = 113
integer nBtnBlurayInfo = 114
integer nBtnBlurayDiscMenu = 112
integer nBtnBlurayARed = 115
integer nBtnBlurayBGreen = 116
integer nBtnBlurayCYellow = 117
integer nBtnBlurayDBlue = 118
integer nBtnBlurayTitleMenuPopup = 51
integer nBtnBlurayBonusView = 111

///////////////////// TV control buttons
integer nBtnsTvSelectPresetChannels[] = {51,52,53,54,55,56,57,58,59,60}

///////////////////// MFTX control buttons
integer nBtnMftxSelectVga = 1
integer nBtnMftxSelectHdmi = 2

///////////////////// Enzo control buttons
integer nBtnEnzoSessionStart	= 1
integer nBtnEnzoSessionExit		= 2
integer nBtnEnzoPlay			= 3
integer nBtnEnzoStop			= 4
integer nBtnEnzoPause			= 5
integer nBtnEnzoFastForward		= 6
integer nBtnEnzoRewind			= 7
integer nBtnEnzoNext			= 8
integer nBtnEnzoPrevious		= 9
integer nBtnEnzoHome			= 10
integer nBtnEnzoBack			= 11
integer nBtnEnzoLeft			= 12
integer nBtnEnzoRight			= 13
integer nBtnEnzoUp				= 14
integer nBtnEnzoDown			= 15
integer nBtnEnzoEnter			= 16
integer nBtnEnzoPageUp			= 17
integer nBtnEnzoPageDown		= 18

///////////////////// BluRay IR channel codes
integer nIrBlurayPlay = 1
integer nIrBlurayStop = 2
integer nIrBlurayPause = 3
integer nIrBlurayNextChapter = 4
integer nIrBlurayPrevChapter = 5
integer nIrBlurayFastForward = 6
integer nIrBlurayFastReverse = 7
integer nIrBlurayCursorUp = 45
integer nIrBlurayCursorDown = 46
integer nIrBlurayCursorLeft = 47
integer nIrBlurayCursorRight = 48
integer nIrBluraySelect = 49
integer nIrBlurayExit = 50
integer nIrBlurayReturn = 54
integer nIrBlurayPowerToggle = 9
integer nIrBlurayDigit0 = 10
integer nIrBlurayDigit1 = 11
integer nIrBlurayDigit2 = 12
integer nIrBlurayDigit3 = 13
integer nIrBlurayDigit4 = 14
integer nIrBlurayDigit5 = 15
integer nIrBlurayDigit6 = 16
integer nIrBlurayDigit7 = 17
integer nIrBlurayDigit8 = 18
integer nIrBlurayDigit9 = 19
integer nIrBlurayMenu = 44
integer nIrBlurayOpenClose = 80
integer nIrBlurayAudio = 89
integer nIrBluraySearch = 75
integer nIrBluraySubtitle = 57
integer nIrBlurayTools = 113
integer nIrBlurayInfo = 114
integer nIrBlurayDiscMenu = 112
integer nIrBlurayARed = 115
integer nIrBlurayBGreen = 116
integer nIrBlurayCYellow = 117
integer nIrBlurayDBlue = 118
integer nIrBlurayTitleMenuPopup = 51
integer nIrBlurayBonusView = 111

///////////////////// IO channels
integer nIoOccSensor = 1

//////////////////// Power state constants
INTEGER nPOWER_OFF = 1
INTEGER nPOWER_ON = 2






DEFINE_VARIABLE

//////////////////// Device Arrays
dev dvDvxVidInPorts[nNUM_OF_SOURCES_TO_SELECT]	= {0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0}
dev dvDvxAudInPorts[nNUM_OF_SOURCES_TO_SELECT]	= {0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0}
dev dvDvxVidOutPorts[nNUM_OF_DESTINATIONS]	= {0:999:0, 0:999:0, 0:999:0, 0:999:0}

char cDvxSourceNames[nNUM_OF_SOURCES_TO_SELECT][30] = {'Input Source','Input Source','Input Source','Input Source','Input Source','Input Source','Input Source','Input Source','Input Source','Input Source'}

DEV dvDvxMainPorts[] = { dvDvxMainPort }

DEV dvDvxAudOutPorts[] = { dvDvxAudOutSpeakersFrontOfHouse, dvDvxAudOutRackPcMicInput }

DEV dvDvxMicInPorts[] = { dvDvxMicInDesk }

DEV dvPanelsToMonitor[] = { dvTpBoardroomTableMain }

dev dvDvxVidInPortsForMpl[] = {0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0, 0:999:0}

integer nAdrPreviewButtons[] = {999, 999, 999, 999, 999, 999, 999, 999, 999, 999}

integer nBtnsRightPopup[]= { 30,31,32,33,34,35};
integer nBtnSourceGroup = 900;

// Touch Panel IP address
char cPanelIpAddress[32] = '192.168.2.223'

volatile integer nVcMode

volatile integer nIndexSelectedInputWithNoSignal
volatile integer nIndexSelectedOutputForSourceWithNoSignal

volatile integer nVisibleStateOfDragAndDropIcon = 0






DEFINE_START

// Populate DVX video input devices array
dvDvxVidInPorts[nINDEX_SOURCE_VC_CAMERA	] 		= dvDvxVidInVcCamera
dvDvxVidInPorts[nINDEX_SOURCE_SIGNAGE] 			= dvDvxVidInSignage
dvDvxVidInPorts[nINDEX_SOURCE_INPUT_03] 		= dvDvxVidIn03
dvDvxVidInPorts[nINDEX_SOURCE_INPUT_04] 		= dvDvxVidIn04
dvDvxVidInPorts[nINDEX_SOURCE_DTV] 				= dvDvxVidInDTV
dvDvxVidInPorts[nINDEX_SOURCE_BLURAY] 			= dvDvxVidInBluray
dvDvxVidInPorts[nINDEX_SOURCE_VC_MAIN] 			= dvDvxVidInVcMain
dvDvxVidInPorts[nINDEX_SOURCE_ENZO] 			= dvDvxVidInEnzo
dvDvxVidInPorts[nINDEX_SOURCE_LAPTOP] 			= dvDvxVidInLaptop
dvDvxVidInPorts[nINDEX_SOURCE_ROOM_LINK] 		= dvDvxVidInRoomLink

// Populate DVX audio input devices array
dvDvxAudInPorts[nINDEX_SOURCE_VC_CAMERA] 		= dvDvxAudInVcCamera
dvDvxAudInPorts[nINDEX_SOURCE_SIGNAGE] 			= dvDvxVidInSignage
dvDvxAudInPorts[nINDEX_SOURCE_INPUT_03] 		= dvDvxVidIn03
dvDvxAudInPorts[nINDEX_SOURCE_INPUT_04] 		= dvDvxVidIn04
dvDvxAudInPorts[nINDEX_SOURCE_DTV] 				= dvDvxAudInDTV
dvDvxAudInPorts[nINDEX_SOURCE_BLURAY] 			= dvDvxAudInBluray
dvDvxAudInPorts[nINDEX_SOURCE_VC_MAIN] 			= dvDvxAudInVcMain
dvDvxAudInPorts[nINDEX_SOURCE_ENZO] 			= dvDvxAudInEnzo
dvDvxAudInPorts[nINDEX_SOURCE_LAPTOP] 			= dvDvxAudInLaptop
dvDvxAudInPorts[nINDEX_SOURCE_ROOM_LINK] 		= dvDvxAudInRoomLink

// Populate DVX video input devices array for MPL
// same as devices array

// Populate DVX video output devices array
dvDvxVidOutPorts[nINDEX_DEST_MONITOR_LEFT] = dvDvxVidOutMonitorLeft
dvDvxVidOutPorts[nINDEX_DEST_MONITOR_RIGHT] = dvDvxVidOutMonitorRight
dvDvxVidOutPorts[nINDEX_DEST_MULTI_PREVIEW] = dvDvxVidOutMplInput
dvDvxVidOutPorts[nINDEX_DEST_TRAINING_DVX] = dvDvxVidOutFeedToTrainingRoomDvx

cDvxSourceNames[nINDEX_SOURCE_VC_CAMERA] = 'VC Camera'
cDvxSourceNames[nINDEX_SOURCE_SIGNAGE] = 'Digital Signage'
cDvxSourceNames[nINDEX_SOURCE_INPUT_03] = 'Document Camera'
cDvxSourceNames[nINDEX_SOURCE_INPUT_04] = 'Input 04'
cDvxSourceNames[nINDEX_SOURCE_DTV] = 'Digital TV'
cDvxSourceNames[nINDEX_SOURCE_BLURAY] = 'Bluray Player'
cDvxSourceNames[nINDEX_SOURCE_VC_MAIN] = 'VC Main'
cDvxSourceNames[nINDEX_SOURCE_ENZO] = 'Enzo'
cDvxSourceNames[nINDEX_SOURCE_LAPTOP] = 'Laptop Input'
cDvxSourceNames[nINDEX_SOURCE_ROOM_LINK] = 'Room Link'

dvDvxVidInPortsForMpl[nINDEX_SOURCE_VC_CAMERA] = dvDvxVidInVcCamera
dvDvxVidInPortsForMpl[nINDEX_SOURCE_SIGNAGE] = dvDvxVidInSignage
dvDvxVidInPortsForMpl[nINDEX_SOURCE_INPUT_03] = dvDvxVidIn03
dvDvxVidInPortsForMpl[nINDEX_SOURCE_INPUT_04] = dvDvxVidIn04
dvDvxVidInPortsForMpl[nINDEX_SOURCE_DTV] = dvDvxVidInDTV
dvDvxVidInPortsForMpl[nINDEX_SOURCE_BLURAY] = dvDvxVidInBluray
dvDvxVidInPortsForMpl[nINDEX_SOURCE_VC_MAIN] = dvDvxVidInVcMain
dvDvxVidInPortsForMpl[nINDEX_SOURCE_ENZO] = dvDvxVidInEnzo
dvDvxVidInPortsForMpl[nINDEX_SOURCE_LAPTOP] = dvDvxVidInLaptop
dvDvxVidInPortsForMpl[nINDEX_SOURCE_ROOM_LINK] = dvDvxVidInRoomLink

nAdrPreviewButtons[nINDEX_SOURCE_VC_CAMERA] = nAdrSourceSelectVcCamera
nAdrPreviewButtons[nINDEX_SOURCE_SIGNAGE] = nAdrSourceSelectSignage
nAdrPreviewButtons[nINDEX_SOURCE_INPUT_03] = nAdrSourceSelectInput03
nAdrPreviewButtons[nINDEX_SOURCE_INPUT_04] = nAdrSourceSelectInput04
nAdrPreviewButtons[nINDEX_SOURCE_DTV] = nAdrSourceSelectDTV
nAdrPreviewButtons[nINDEX_SOURCE_BLURAY] = nAdrSourceSelectBluray
nAdrPreviewButtons[nINDEX_SOURCE_VC_MAIN] = nAdrSourceSelectVcMain
nAdrPreviewButtons[nINDEX_SOURCE_ENZO] = nAdrSourceSelectEnzo
nAdrPreviewButtons[nINDEX_SOURCE_LAPTOP] = nAdrSourceSelectLaptop
nAdrPreviewButtons[nINDEX_SOURCE_ROOM_LINK] = nAdrSourceSelectRoomLink

// rebuild the event table after setting the device and channel code array values
rebuild_event()







(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE

integer nWaitTimeMutingDvxVideoOutputBetweenSwitch = 5
integer nHoldTimeSourceSelectButtonsInMs = 3000
integer nFadeTimeDragAndDropPopupHideEffect = 4
integer nWaitTimeDemoMode = 1200
integer nWaitTimeToTurnLightsOffAfterMeetingEnd = 1200

char cPopupNameDragAndDropSourceSelect[] = 'SourceSelectDragAndDrop'
char cPopupNameDragAndDropSourceSelectMaskLeft[] = 'SourceSelectDragAndDropMaskLeft'
char cPopupNameDragAndDropSourceSelectMaskLeftBlank[] = 'SourceSelectDragAndDropMaskLeftBlank'
char cPopupNameDragAndDropSourceSelectMaskRight[] = 'SourceSelectDragAndDropMaskRight'
char cPopupNameDragAndDropSourceSelectMaskRightVcContent[] = 'SourceSelectDragAndDropMaskRightVcContent'
char cPopupNameDragAndDropIcon[] = 'DragAndDropIcon'
char cPopupNameSelectedInputSourceWithNoSignal[] = 'SelectedInputSourceWithNoSignal'
char cPageNameTechPageVideoAudio[] = '[TechPage]VideoAudio'
char cPageNameTechPageDeviceStatus[] = '[TechPage]DeviceStatus'
char cPageNameTechPagePowerControl[] = '[TechPage]PowerUsage'
char cPopupNameVolumeControls[] = '[paneLeft2]SubNavOnly_Vol'
char cPopupNameVcLightsHelpControls[] = '[paneRight2]SubNavOnly'

char cSoundFileNameValidId[] = 'valid-id.wav'
char cSoundFileNameInvalidid[] = 'invalid-id.wav'

// Variables to hold current source select/routed info
volatile integer nIndexSourceSelectedDragAndDrop
integer nIndexSourceVideoDisplayedOnMonitorLeft
integer nIndexSourceVideoDisplayedOnMonitorRight
integer nIndexSourceAudioToFrontOfHouseSpeakers

// Variable to act as a flag to indicate which output destination has been selected to send the selected source to
volatile integer nIndexDestinationSelectedDragAndDrop

// Arrays for source select button channel and address codes
integer nBtnsSourceSelect[nNUM_OF_SOURCES_TO_SELECT] = {999, 999, 999, 999, 999, 999, 999, 999, 999, 999}
integer nAdrsSourceSelect[nNUM_OF_SOURCES_TO_SELECT] = {999, 999, 999, 999, 999, 999, 999, 999, 999, 999}
integer nBtnsSourceLabels[nNUM_OF_SOURCES_TO_SELECT] = {999, 999, 999, 999, 999, 999, 999, 999, 999, 999}
integer nAdrsSourceLabels[nNUM_OF_SOURCES_TO_SELECT] = {999, 999, 999, 999, 999, 999, 999, 999, 999, 999}

// Arrays for destination select button channel and address codes
integer nBtnsDestinationSelectDragAndDrop[nNUM_OF_DESTINATIONS] = {999, 999, 999, 999}
integer nAdrsDestinationSelectDragAndDrop[nNUM_OF_DESTINATIONS] = {999, 999, 999, 999}
integer nBtnsAudioSelect[nNUM_OF_DESTINATIONS] = {999, 999, 999, 999}

// Array to keep track of which source is routed to which destination
//  - the index of the array relates to the destination
//  - the value stored at each element of the array is the index of the source stored in the dvDvxVidInPorts array
integer nVideoRoutesSourceIndexes[nNUM_OF_DESTINATIONS]

// Variable to act as a flag to indicate if a source select button is being held down
volatile integer nSourceSelectButtonBeingHeld

volatile char cRmsBookingIdCurrentMeeting[300]
volatile char cRmsBookingIdNextMeeting[300]
volatile char cRmsBookingIdMeetingJustEnded[300]

char cNfcUidTechPages[] = '93F88497'
char cNfcUids[][30] = { '926CFCAD', '', '', '' }
volatile char cRmsCurrentMeetingOrganizerNfcUid[30]
volatile char cRmsCurrentMeetingOrganizerName[50]
volatile char cRmsNextMeetingOrganizerNfcUid[30]
volatile char cRmsNextMeetingOrganizerName[50]

volatile char cCurrentUserNfcUid[30]

// variable to indicate whether the system is actually being used by a person
// Note: this is not the same thing as a room having an active meeting
// Because the Integrate demo flips to signage 2 minutes after a meeting ends
// it's possible to start using the system (without having a booking) and it
// will flip to signage on you
volatile integer nRoomInUse

volatile long lnRmsMinutesUntilNextMeeting

integer nMinutesToBookAdHocMeetingFor = 10

volatile integer nWaitingForCreateBookingResponse

volatile integer nAdHocMeetingBookedFromWelcomePanel

// variable to indicate if the occupancy sensor is sensing someone in the room
volatile integer nOccupancyDetected

integer nTcpIpPortModeroTouchCoordinatesNotifications = 1024

dev dvSelectedDvxInputMonitorLeft
dev dvSelectedDvxInputMonitorRight

integer nCurrentRightPopup;





define_start

// Populate source select buttons channel code array
nBtnsSourceSelect[nINDEX_SOURCE_VC_CAMERA] = nBtnSourceSelectVcCamera
nBtnsSourceSelect[nINDEX_SOURCE_SIGNAGE] = nBtnSourceSelectSignage
nBtnsSourceSelect[nINDEX_SOURCE_INPUT_03] = nBtnSourceSelectInput03
nBtnsSourceSelect[nINDEX_SOURCE_INPUT_04] = nBtnSourceSelectInput04
nBtnsSourceSelect[nINDEX_SOURCE_DTV] = nBtnSourceSelectDTV
nBtnsSourceSelect[nINDEX_SOURCE_BLURAY] = nBtnSourceSelectBluray
nBtnsSourceSelect[nINDEX_SOURCE_VC_MAIN] = nBtnSourceSelectVcMain
nBtnsSourceSelect[nINDEX_SOURCE_ENZO] = nBtnSourceSelectEnzo
nBtnsSourceSelect[nINDEX_SOURCE_LAPTOP] = nBtnSourceSelectLaptop
nBtnsSourceSelect[nINDEX_SOURCE_ROOM_LINK] = nBtnSourceSelectRoomLink

// Populate source select buttons address code array
nAdrsSourceSelect[nINDEX_SOURCE_VC_CAMERA] = nAdrSourceSelectVcCamera
nAdrsSourceSelect[nINDEX_SOURCE_SIGNAGE] = nAdrSourceSelectSignage
nAdrsSourceSelect[nINDEX_SOURCE_INPUT_03] = nAdrSourceSelectInput03
nAdrsSourceSelect[nINDEX_SOURCE_INPUT_04] = nAdrSourceSelectInput04
nAdrsSourceSelect[nINDEX_SOURCE_DTV] = nAdrSourceSelectDTV
nAdrsSourceSelect[nINDEX_SOURCE_BLURAY] = nAdrSourceSelectBluray
nAdrsSourceSelect[nINDEX_SOURCE_VC_MAIN] = nAdrSourceSelectVcMain
nAdrsSourceSelect[nINDEX_SOURCE_ENZO] = nAdrSourceSelectEnzo
nAdrsSourceSelect[nINDEX_SOURCE_LAPTOP] = nAdrSourceSelectLaptop
nAdrsSourceSelect[nINDEX_SOURCE_ROOM_LINK] = nAdrSourceSelectRoomLink

// Populate source label buttons channel code array
nBtnsSourceLabels[nINDEX_SOURCE_VC_CAMERA] = nBtnSourceLabelVcCamera
nBtnsSourceLabels[nINDEX_SOURCE_SIGNAGE] = nBtnSourceLabelSignage
nBtnsSourceLabels[nINDEX_SOURCE_INPUT_03] = nBtnSourceLabelInput03
nBtnsSourceLabels[nINDEX_SOURCE_INPUT_04] = nBtnSourceLabelInput04
nBtnsSourceLabels[nINDEX_SOURCE_DTV] = nBtnSourceLabelDTV
nBtnsSourceLabels[nINDEX_SOURCE_BLURAY] = nBtnSourceLabelBluray
nBtnsSourceLabels[nINDEX_SOURCE_VC_MAIN] = nBtnSourceLabelVcMain
nBtnsSourceLabels[nINDEX_SOURCE_ENZO] = nBtnSourceLabelEnzo
nBtnsSourceLabels[nINDEX_SOURCE_LAPTOP] = nBtnSourceLabelLaptop
nBtnsSourceLabels[nINDEX_SOURCE_ROOM_LINK] = nBtnSourceLabelRoomLink

// Populate source label buttons address code array
nAdrsSourceLabels[nINDEX_SOURCE_VC_CAMERA] = nAdrSourceLabelVcCamera
nAdrsSourceLabels[nINDEX_SOURCE_SIGNAGE] = nAdrSourceLabelSignage
nAdrsSourceLabels[nINDEX_SOURCE_INPUT_03] = nAdrSourceLabelInput03
nAdrsSourceLabels[nINDEX_SOURCE_INPUT_04] = nAdrSourceLabelInput04
nAdrsSourceLabels[nINDEX_SOURCE_DTV] = nAdrSourceLabelDTV
nAdrsSourceLabels[nINDEX_SOURCE_BLURAY] = nAdrSourceLabelBluray
nAdrsSourceLabels[nINDEX_SOURCE_VC_MAIN] = nAdrSourceLabelVcMain
nAdrsSourceLabels[nINDEX_SOURCE_ENZO] = nAdrSourceLabelEnzo
nAdrsSourceLabels[nINDEX_SOURCE_LAPTOP] = nAdrSourceLabelLaptop
nAdrsSourceLabels[nINDEX_SOURCE_ROOM_LINK] = nAdrSourceLabelRoomLink

// Populate drag and drop destination select buttons channel code array
nBtnsDestinationSelectDragAndDrop[nINDEX_DEST_MONITOR_LEFT] = nBtnDestinationSelectDragAndDropMonitorLeft
nBtnsDestinationSelectDragAndDrop[nINDEX_DEST_MONITOR_RIGHT] = nBtnDestinationSelectDragAndDropMonitorRight

// Populate drag and drop destination select buttons address code array
nAdrsDestinationSelectDragAndDrop[nINDEX_DEST_MONITOR_LEFT] = nAdrDestinationSelectDragAndDropMonitorLeft
nAdrsDestinationSelectDragAndDrop[nINDEX_DEST_MONITOR_RIGHT] = nAdrDestinationSelectDragAndDropMonitorRight

// Populate audio selection buttons channel code array
nBtnsAudioSelect[nINDEX_DEST_MONITOR_LEFT] = nBtnAudioSelectMonitorLeft
nBtnsAudioSelect[nINDEX_DEST_MONITOR_RIGHT] = nBtnAudioSelectMonitorRight

rebuild_event()	// rebuild the event table after setting the device and channel code array values






#DEFINE INCLUDE_SCHEDULING_BOOKINGS_RECORD_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_BOOKING_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_BOOKING_SUMMARIES_DAILY_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_BOOKING_SUMMARY_DAILY_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EXTEND_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_END_RESPONSE_CALLBACK
#DEFINE INCLUDE_SCHEDULING_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_ENDED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_STARTED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_EVENT_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_MONTHLY_SUMMARY_UPDATED_CALLBACK
#DEFINE INCLUDE_SCHEDULING_DAILY_COUNT_CALLBACK





INCLUDE 'DvxApi'
INCLUDE 'DvxControl'
INCLUDE 'MplControl'
INCLUDE 'LightingControl'
INCLUDE 'SourceSelectDragAndDrop'
INCLUDE 'ModeroControl'
INCLUDE 'MplDvxTp'
INCLUDE 'SystemConfigure'
INCLUDE 'RMSMain.axi'








//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// Implement RMS Listen Functions //////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////


	/*STRUCTURE RmsEventBookingResponse
	{
		CHAR bookingId[RMS_MAX_PARAM_LEN];
		LONG location;
		CHAR isPrivateEvent;
		CHAR startDate[RMS_MAX_DATE_TIME_LEN];
		CHAR startTime[RMS_MAX_DATE_TIME_LEN];
		CHAR endDate[RMS_MAX_DATE_TIME_LEN];
		CHAR endTime[RMS_MAX_DATE_TIME_LEN];
		CHAR subject[RMS_MAX_PARAM_LEN];
		CHAR details[RMS_MAX_PARAM_LEN];
		CHAR clientGatewayUid[RMS_MAX_PARAM_LEN];
		CHAR isAllDayEvent;
		CHAR organizer[RMS_MAX_PARAM_LEN];
		LONG elapsedMinutes;                          // Only used for active booking events
		LONG minutesUntilStart;                       // Only used for next active booking events
		LONG remainingMinutes;                        // Only used for active booking events
		CHAR onBehalfOf[RMS_MAX_PARAM_LEN];
		CHAR attendees[RMS_MAX_PARAM_LEN];            // Not used in some contexts such as adhoc creation
		CHAR isSuccessful;
		CHAR failureDescription[RMS_MAX_PARAM_LEN];   // Not used if result is from a successful event
    }*/

////////////////////////// Server Initiated Events //////////////////////////
define_function RmsEventSchedulingActiveUpdated(CHAR bookingId[], RmsEventBookingResponse eventBookingResponse)
{
	cRmsBookingIdCurrentMeeting = bookingId
	extractUserDetails(eventBookingResponse)
	cRmsCurrentMeetingOrganizerName = eventBookingResponse.organizer
	cRmsCurrentMeetingOrganizerNfcUid = getUserNfcUid( getUserIdFromName( cRmsCurrentMeetingOrganizerName ) )

	fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingReservationNotAllowedMsg1,nMODERO_BUTTON_STATE_ALL,"cRmsCurrentMeetingOrganizerName,' has booked a meeting in the boardroom for ',time12Hour(eventBookingResponse.startTime),' to ',time12Hour(eventBookingResponse.endTime),'.'")

	if( eventBookingResponse.remainingMinutes == 1)
		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingReservationNotAllowedMsg2,nMODERO_BUTTON_STATE_ALL,"'Please touch on with ',cRmsCurrentMeetingOrganizerName,$27,'s card to use system.'")
	else
		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingReservationNotAllowedMsg2,nMODERO_BUTTON_STATE_ALL,"'Please touch on with ',cRmsCurrentMeetingOrganizerName,$27,'s card to use system.'")

	fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'Welcome ',cRmsCurrentMeetingOrganizerName,', your meeting has commenced.'")

	if( lnRmsMinutesUntilNextMeeting == 1 )
		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"'This meeting will end in ',itoa(eventBookingResponse.remainingMinutes),' minute.'")
	else
		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"'This meeting will end in ',itoa(eventBookingResponse.remainingMinutes),' minutes.'")

	fnModeroSetButtonBitmap(dvTpBoardroomTableMain,nAdrSystemSplashScreenLockIcon,nMODERO_BUTTON_STATE_ALL,"'icon-locked.png'")
}



DEFINE_FUNCTION RmsEventSchedulingNextActiveUpdated(CHAR bookingId[], RmsEventBookingResponse eventBookingResponse)
{
	lnRmsMinutesUntilNextMeeting = eventBookingResponse.minutesUntilStart
	extractUserDetails(eventBookingResponse)
	cRmsNextMeetingOrganizerName = eventBookingResponse.organizer
	cRmsNextMeetingOrganizerNfcUid = getUserNfcUid( getUserIdFromName( cRmsNextMeetingOrganizerName ) )

	if(lnRmsMinutesUntilNextMeeting == 1)
		fnModeroSetButtonText(dvTpBoardroomTableMain, nAdrSystemMeetingDueToCommenceInMinutes, nMODERO_BUTTON_STATE_ALL, "'A meeting is due to commence in ',itoa(lnRmsMinutesUntilNextMeeting),' minute.'")
	else
		fnModeroSetButtonText(dvTpBoardroomTableMain, nAdrSystemMeetingDueToCommenceInMinutes, nMODERO_BUTTON_STATE_ALL, "'A meeting is due to commence in ',itoa(lnRmsMinutesUntilNextMeeting),' minutes.'")

	if( !nRoomInUse AND cRmsBookingIdCurrentMeeting == '' )
	{
		if(lnRmsMinutesUntilNextMeeting == 0)
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'No meeting currently scheduled.'")
		else if( lnRmsMinutesUntilNextMeeting == 1 )
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'The next meeting will commence in ',itoa(lnRmsMinutesUntilNextMeeting),' minute.'")
		else if( lnRmsMinutesUntilNextMeeting <= 15 )
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'The next meeting will commence in ',itoa(lnRmsMinutesUntilNextMeeting),' minutes.'")
		else
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'No meeting currently scheduled.'")
		fnModeroSetButtonBitmap(dvTpBoardroomTableMain,nAdrSystemSplashScreenLockIcon,nMODERO_BUTTON_STATE_ALL,"'icon-unlocked.png'")
	}

	if( eventBookingResponse.minutesUntilStart == 1 )
		cRmsBookingIdNextMeeting = bookingId
	else
		cRmsBookingIdNextMeeting = ''
}



define_function RmsEventSchedulingEventStarted(CHAR bookingId[], RmsEventBookingResponse eventBookingResponse)
{
	if(cRmsBookingIdMeetingJustEnded == bookingId)	// this event is starting because of meeting extension
	{
		cRmsBookingIdMeetingJustEnded = ''
		cancel_wait 'EVENT_MAY_HAVE_ENDED_BECAUSE_MEETING_GOT_EXTENDED_AND_IS_ABOUT_TO_START_AGAIN'
	}
	else
	{
		CANCEL_WAIT 'DEMO MODE'
		CANCEL_WAIT 'WAITING TO TURN OFF LIGHTS AFTER MEETING END'

		fnInitRoomAvLighting()

		if(nAdHocMeetingBookedFromWelcomePanel)
			OFF[nAdHocMeetingBookedFromWelcomePanel]

		cRmsBookingIdCurrentMeeting = bookingId
		extractUserDetails(eventBookingResponse)
		cRmsCurrentMeetingOrganizerName = eventBookingResponse.organizer
		cRmsCurrentMeetingOrganizerNfcUid = getUserNfcUid( getUserIdFromName( cRmsCurrentMeetingOrganizerName ) )

		cRmsBookingIdNextMeeting = ''
		cRmsNextMeetingOrganizerName = ''
		cRmsNextMeetingOrganizerNfcUid = ''

		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingReservationNotAllowedMsg1,nMODERO_BUTTON_STATE_ALL,"cRmsCurrentMeetingOrganizerName,' has booked a meeting in the boardroom for ',eventBookingResponse.startTime,' to ',eventBookingResponse.endTime,'.'")
		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingReservationNotAllowedMsg2,nMODERO_BUTTON_STATE_ALL,"'Please touch on with ',cRmsCurrentMeetingOrganizerName,$27,'s card to use system.'")

		lnRmsMinutesUntilNextMeeting = 0

		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'Welcome ',cRmsCurrentMeetingOrganizerName,', your meeting has commenced.'")

		if( lnRmsMinutesUntilNextMeeting == 1 )
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"'This meeting will end in ',itoa(eventBookingResponse.remainingMinutes),' minute.'")
		else
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"'This meeting will end in ',itoa(eventBookingResponse.remainingMinutes),' minutes.'")

		fnModeroSetButtonBitmap(dvTpBoardroomTableMain,nAdrSystemSplashScreenLockIcon,nMODERO_BUTTON_STATE_ALL,"'icon-locked.png'")
	}
}

define_function RmsEventSchedulingEventEnded(CHAR bookingId[], RmsEventBookingResponse eventBookingResponse)
{
	cRmsBookingIdMeetingJustEnded = bookingId

	wait 10 'EVENT_MAY_HAVE_ENDED_BECAUSE_MEETING_GOT_EXTENDED_AND_IS_ABOUT_TO_START_AGAIN'
	{
		cRmsBookingIdCurrentMeeting = ''
		cRmsCurrentMeetingOrganizerName = ''
		cRmsCurrentMeetingOrganizerNfcUid = ''

		OFF[nAdHocMeetingBookedFromWelcomePanel]

		fnModeroDisableAllPopups(dvTpBoardroomTableMain)

		fnModeroSetPage (dvTpBoardroomTableMain, 'SPLASH')
		OFF[nRoomInUse]

		if(lnRmsMinutesUntilNextMeeting == 0)
		{
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'No meeting currently scheduled.'")
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"''")
		}
		else if(lnRmsMinutesUntilNextMeeting == 1)
		{
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'The next meeting will commence in ',itoa(lnRmsMinutesUntilNextMeeting),' minute.'")
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"''")
		}
		else if(lnRmsMinutesUntilNextMeeting < 15)
		{
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'The next meeting will commence in ',itoa(lnRmsMinutesUntilNextMeeting),' minutes.'")
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"''")
		}
		else
		{
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemSplashScreenCurrentMeetingmessage,nMODERO_BUTTON_STATE_ALL,"'No meeting currently scheduled.'")
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemMeetingDuration,nMODERO_BUTTON_STATE_ALL,"''")
		}

		fnModeroSetButtonBitmap(dvTpBoardroomTableMain,nAdrSystemSplashScreenLockIcon,nMODERO_BUTTON_STATE_ALL,"'icon-unlocked.png'")

		fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
		fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

		fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_LOGO_2)
		fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_LOGO_2)

		WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
		{
			fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
			fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
		}

		fnDvxSwitchAudioOnly (dvDvxMainPort, 0, dvDvxAudOutSpeakersFrontOfHouse.port)
		nIndexSourceAudioToFrontOfHouseSpeakers = nINDEX_SOURCE_NONE

		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, '')
		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, '')

		dvSelectedDvxInputMonitorRight = dvDvxVidInSignage
		dvSelectedDvxInputMonitorLeft = dvDvxVidInSignage

		nIndexSourceVideoDisplayedOnMonitorLeft = 0
		nIndexSourceVideoDisplayedOnMonitorRight = 0

		dvSelectedDvxInputMonitorLeft = dvDvxVidInNone
		dvSelectedDvxInputMonitorRight = dvDvxVidInNone

		OFF[nVcMode]

		if( !length_string(cRmsBookingIdNextMeeting) )	// there is no meeting booked straight after this meeting
		{
			// turn the lights off after X seconds
			WAIT nWaitTimeToTurnLightsOffAfterMeetingEnd 'WAITING TO TURN OFF LIGHTS AFTER MEETING END'
			{
				send_command vdvLight, "'LIGHTSYSTEMSTATE-',cLightAddressBoardroom,',OFF'"
			}

			CANCEL_WAIT 'DEMO MODE'
			WAIT nWaitTimeDemoMode 'DEMO MODE'
			{
				if(!nRoomInUse)
				{
					fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
					fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

					fnDvxSwitchVideoOnly (dvDvxMainPort, dvDvxVidInSignage.port, dvDvxVidOutMonitorLeft.port)
					fnDvxSwitchVideoOnly (dvDvxMainPort, dvDvxVidInSignage.port, dvDvxVidOutMonitorRight.port)

					fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_OFF)
					fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_OFF)

					WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
					{
						fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
						fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
					}
				}
			}
		}
	}
}




(***********************************************************)
(* Name:  RmsEventSchedulingBookingsRecordResponse         *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* INTEGER recordIndex - The index position of this record *)
(*                                                         *)
(* INTEGER recordCount - Total record count                *)
(*                                                         *)
(* CHAR bookingId[] - The booking ID string                *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a query for booking events.              *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_BOOKINGS_RECORD_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingBookingsRecordResponse(CHAR isDefaultLocation,
																													INTEGER recordIndex,
																													INTEGER recordCount,
																													CHAR bookingId[],
																													RmsEventBookingResponse eventBookingResponse)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingBookingResponse                *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* CHAR bookingId[] - The booking ID string                *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a query for information about a specific *)
(* booking event ID                                        *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_BOOKING_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingBookingResponse(CHAR isDefaultLocation,
																									CHAR bookingId[],
																									RmsEventBookingResponse eventBookingResponse)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingActiveResponse                 *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* INTEGER recordIndex - The index position of this record *)
(*                                                         *)
(* INTEGER recordCount - Total record count                *)
(*                                                         *)
(* CHAR bookingId[] - The booking ID string                *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a query for the current active booking   *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_ACTIVE_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingActiveResponse(CHAR isDefaultLocation,
																									INTEGER recordIndex,
																									INTEGER recordCount,
																									CHAR bookingId[],
																									RmsEventBookingResponse eventBookingResponse)
{

}



(***********************************************************)
(* Name:  RmsEventSchedulingNextActiveResponse             *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* INTEGER recordIndex - The index position of this record *)
(*                                                         *)
(* INTEGER recordCount - Total record count                *)
(*                                                         *)
(* CHAR bookingId[] - The booking ID string                *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a query for the next active booking      *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_NEXT_ACTIVE_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingNextActiveResponse(CHAR isDefaultLocation,
																											INTEGER recordIndex,
																											INTEGER recordCount,
																											CHAR bookingId[],
																											RmsEventBookingResponse eventBookingResponse)
{
}



(***********************************************************)
(* Name: RmsEventSchedulingSummariesDailyResponse          *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if th location   *)
(* in the response is the default location                 *)
(*                                                         *)
(* RmsEventBookingDailyCount dailyCount - A                *)
(* structure with information about a specific date        *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a query summaries daily count            *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_BOOKING_SUMMARIES_DAILY_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingSummariesDailyResponse(CHAR isDefaultLocation,
																													RmsEventBookingDailyCount dailyCount)
{
}



(***********************************************************)
(* Name: RmsEventSchedulingSummaryDailyResponse            *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if th location   *)
(* in the response is the default location                 *)
(*                                                         *)
(* RmsEventBookingDailyCount dailyCount - A                *)
(* structure with information about a specific date        *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a query summary daily                    *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_BOOKING_SUMMARY_DAILY_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingSummaryDailyResponse(CHAR isDefaultLocation,
																												RmsEventBookingDailyCount dailyCount)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingCreateResponse                 *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if th location   *)
(* in the response is the default location                 *)
(*                                                         *)
(* CHAR responseText[] - Booking ID if successful else     *)
(* some error information.                                 *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a booking creation request               *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_CREATE_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingCreateResponse(CHAR isDefaultLocation,
																									CHAR responseText[],
																									RmsEventBookingResponse eventBookingResponse)
{
	if(nWaitingForCreateBookingResponse)
	{
		OFF[nWaitingForCreateBookingResponse]

		if( eventBookingResponse.isSuccessful )	// booking was successful
		{
			fnInitRoomFromTablePanelAdHocMeetingCreation()
		}
		else		// booking was not successful
		{
			fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemBookingFailedReason,nMODERO_BUTTON_STATE_ALL,"'Reason: ',responseText")
			fnModeroDisablePopup(dvTpBoardroomTableMain,'CreatingBooking')
			fnModeroEnablePopup(dvTpBoardroomTableMain,'BookingFailed')
		}
	}
	else	// it's either a notification for a meeting created in the future or an ad-hoc meeting created from the welcome panel
	{
		if( eventBookingResponse.isSuccessful )	// booking was successful
		{
			if(eventBookingResponse.startTime == TIME)
			{
				//fnInitRoomFromWelcomePanelAdHocMeetingCreation()
				fnInitRoomFromTablePanelAdHocMeetingCreation()	// decided to call this function instead after workflow discussion with GB and Kim
			}
			else if( TIME_TO_HOUR(eventBookingResponse.startTime) < TIME_TO_HOUR(TIME) )
			{
				//fnInitRoomFromWelcomePanelAdHocMeetingCreation()
				fnInitRoomFromTablePanelAdHocMeetingCreation()	// decided to call this function instead after workflow discussion with GB and Kim
			}
			else if (TIME_TO_HOUR(eventBookingResponse.startTime) == TIME_TO_HOUR(TIME) )
			{
				if( TIME_TO_MINUTE(eventBookingResponse.startTime) < TIME_TO_MINUTE(TIME) )
				{
					//fnInitRoomFromWelcomePanelAdHocMeetingCreation()
					fnInitRoomFromTablePanelAdHocMeetingCreation()	// decided to call this function instead after workflow discussion with GB and Kim
				}
				else if (TIME_TO_MINUTE(eventBookingResponse.startTime) == TIME_TO_MINUTE(TIME) )
				{
					if( TIME_TO_SECOND(eventBookingResponse.startTime) < TIME_TO_SECOND(TIME) )
					{
						//fnInitRoomFromWelcomePanelAdHocMeetingCreation()
						fnInitRoomFromTablePanelAdHocMeetingCreation()	// decided to call this function instead after workflow discussion with GB and Kim
					}
				}
			}
		}
	}
}



(***********************************************************)
(* Name:  RmsEventSchedulingExtendResponse                 *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* CHAR responseText[] - Booking ID if successful else     *)
(* some error information.                                 *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a extending a booking event              *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_EXTEND_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingExtendResponse(CHAR isDefaultLocation,
																									CHAR responseText[],
																									RmsEventBookingResponse eventBookingResponse)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingEndResponse                    *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* CHAR responseText[] - Booking ID if successful else     *)
(* some error information.                                 *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* in response to a ending a booking event                 *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_END_RESPONSE_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingEndResponse(CHAR isDefaultLocation,
																								CHAR responseText[],
																								RmsEventBookingResponse eventBookingResponse)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingEventUpdated                   *)
(* Args:                                                   *)
(* CHAR bookingId[] - The booking ID string                *)
(*                                                         *)
(* RmsEventBookingResponse eventBookingResponse - A        *)
(* structure with additional booking information           *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* when RMS indicates a booking event has updated          *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_EVENT_UPDATED_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingEventUpdated(CHAR bookingId[],
																								RmsEventBookingResponse eventBookingResponse)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingMonthlySummaryUpdated          *)
(* Args:                                                   *)
(* INTEGER dailyCountsTotal - The total number of daily    *)
(* count entries in the monthly summary                    *)
(*                                                         *)
(* RmsEventBookingMonthlySummary monthlySummary - A        *)
(* structure general summary information                   *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* when RMS indicates the monthly summary has updated      *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_MONTHLY_SUMMARY_UPDATED_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingMonthlySummaryUpdated(INTEGER dailyCountsTotal,
																													RmsEventBookingMonthlySummary monthlySummary)
{
}



(***********************************************************)
(* Name:  RmsEventSchedulingDailyCount                     *)
(* Args:                                                   *)
(* CHAR isDefaultLocation - boolean, TRUE if the location  *)
(* in the response is the default location                 *)
(*                                                         *)
(* RmsEventBookingDailyCount dailyCount - A                *)
(* structure with information about a specific date        *)
(*                                                         *)
(* Desc:  Implementations of this method will be called    *)
(* when RMS provides daily count information such as in    *)
(* when there is a monthly summary update                  *)
(*                                                         *)
(***********************************************************)
// #DEFINE INCLUDE_SCHEDULING_DAILY_COUNT_CALLBACK
DEFINE_FUNCTION RmsEventSchedulingDailyCount(CHAR isDefaultLocation,
																							RmsEventBookingDailyCount dailyCount)
{
}






//////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// NFC Functions ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

define_function integer fnNfcFoundMatchId (char cUid[])
{
	stack_var integer nIdx

	if(cUid == '')
		return false

	for(nIdx = 1; nIdx <= max_length_array(cNfcUids); nIdx++)
	{
		if (cUid == cNfcUids[nIdx])
			return true
	}

	return false
}






//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// Implement DVX Listen Functions //////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_NAME_CALLBACK
define_function fnDvxNotifyVideoInputName (dev dvDvxVideoInput, char cName[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cName is the name of the video input
	stack_var integer nIdx

    for (nIdx = 1; nIdx <= LENGTH_ARRAY(dvDvxVidInPorts); nIdx++)
    {
		if( dvDvxVidInPorts[nIdx] == dvDvxVideoInput)
		{
			// update the touch panel with the name
			cDvxSourceNames[nIdx] = cName
			fnModeroSetButtonText (dvTpBoardroomTableSourceselect, nAdrsSourceLabels[nIdx], nMODERO_BUTTON_STATE_ALL, cName)
			break
		}
    }
}


#define INCLUDE_DVX_NOTIFY_VIDEO_INPUT_STATUS_CALLBACK
define_function fnDvxNotifyVideoInputStatus (dev dvDvxVideoInput, char cSignalStatus[])
{
    // dvDvxVideoInput is the D:P:S of the video input port on the DVX switcher. The input number can be taken from dvDvxVideoInput.PORT
    // cSignalStatus is the input signal status (cDVX_SIGNAL_STATUS_NO_SIGNAL | cDVX_SIGNAL_STATUS_UNKNOWN | cDVX_SIGNAL_STATUS_OK)
    stack_var integer nIdx
    stack_var integer nIdy

    for (nIdx = 1; nIdx <= LENGTH_ARRAY(dvDvxVidInPorts); nIdx++)
    {
		if( dvDvxVidInPorts[nIdx] == dvDvxVideoInput)
		{
			fnMplPreviewNotifyDvxVideoInputSignalStatus(dvDvxVideoInput, cSignalStatus)
			switch (cSignalStatus)
			{
				case cDVX_SIGNAL_STATUS_VALID_SIGNAL:
				{
					cDvxVideoInputSignalStatus[nIdx] = cDVX_SIGNAL_STATUS_VALID_SIGNAL
					if(nDvxVideoInputSignalStatus[nIdx] != 1)
						fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrsSourceSelect[nIdx], nMODERO_BUTTON_STATE_ALL, "'MXA_PREVIEW_',itoa(nIdx)")
					nDvxVideoInputSignalStatus[nIdx] = 1				// Oh well....use this line instead
					OFF[dvTpBoardroomTableSourceselect, nBtnsSourceLabels[nIdx]]
				}
				case cDVX_SIGNAL_STATUS_NO_SIGNAL:
				{
					cDvxVideoInputSignalStatus[nIdx] = cDVX_SIGNAL_STATUS_NO_SIGNAL
					nDvxVideoInputSignalStatus[nIdx] = 0
					ON[dvTpBoardroomTableSourceselect, nBtnsSourceLabels[nIdx]]
					fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrsSourceSelect[nIdx], nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
				}
			}
			break
		}
    }
}



//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

define_function fnSwitchDragAndDropSelectedSourceToSelectedDestination ()
{
	local_var dev dvTempDestination

	// Mute the video output on the DVX selected from the source->destination drag and drop operation
	fnDvxEnableVideoOutputMute (dvDvxVidOutPorts[nIndexDestinationSelectedDragAndDrop])

	// Switch the video of the selected source to the selected destination on the DVX
	fnDvxSwitchVideoOnly (dvDvxMainPort, dvDvxVidInPorts[nIndexSourceSelectedDragAndDrop].port, dvDvxVidOutPorts[nIndexDestinationSelectedDragAndDrop].port)
	fnDvxSetVideoOutputTestPattern(dvDvxVidOutPorts[nIndexDestinationSelectedDragAndDrop],cDVX_TEST_PATTERN_OFF)

	dvTempDestination = dvDvxVidOutPorts[nIndexDestinationSelectedDragAndDrop]
	// wait a short amount of time
	WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
	{
		// Turn off mute on the video output on the DVX selected from the source->destination drag and drop operation
		fnDvxDisableVideoOutputMute(dvTempDestination)
	}

	// Update some values used elsewhere in the code to show which input is routed to the output
	switch (nIndexDestinationSelectedDragAndDrop)
	{
	    case nINDEX_DEST_MONITOR_LEFT:
	    {
		nIndexSourceVideoDisplayedOnMonitorLeft = nIndexDestinationSelectedDragAndDrop
		dvSelectedDvxInputMonitorLeft = dvDvxVidInPorts[nIndexSourceSelectedDragAndDrop]
		fnNecMonitorEnablePower(vdvMonitorLeft)

	    }
	    case nINDEX_DEST_MONITOR_RIGHT:
	    {
		nIndexSourceVideoDisplayedOnMonitorRight = nIndexDestinationSelectedDragAndDrop
		dvSelectedDvxInputMonitorRight = dvDvxVidInPorts[nIndexSourceSelectedDragAndDrop]
		fnNecMonitorEnablePower(vdvMonitorRight)
	    }
	}

	nVideoRoutesSourceIndexes[nIndexDestinationSelectedDragAndDrop] = nIndexSourceSelectedDragAndDrop

	// Update the preview buttons for the left and right monitor to show on teh panel a snapshot of the video routed to each output
	fnUpdateMonitorPreviewSourceButtons()

	// Switch the audio of the selected source to the front of house speakers audio output on the DVX
	fnDvxSwitchAudioOnly (dvDvxMainPort, dvDvxAudInPorts[nIndexSourceSelectedDragAndDrop].port, dvDvxAudOutSpeakersFrontOfHouse.port)

	// Set flag to indicate which audio source is being routed to the front of house speakers
	nIndexSourceAudioToFrontOfHouseSpeakers = nIndexSourceSelectedDragAndDrop

	// Turn on feedback for the audio selection button associated with the selected destination to show that the audio of the source routed to the
	// last selected destination is currently what's being heard through the front of house speakers.
	on[dvTpBoardroomTableSourceselect, nBtnsAudioSelect[nIndexDestinationSelectedDragAndDrop]]
}



define_function fnUserSelectedSourceForDragAndDrop (integer nIndexSource)
{
	// Set flag to indicate that a source select button is being held down
	on[nSourceSelectButtonBeingHeld]

	// Set global variable to indicate the index allocated to the source that was selected
	nIndexSourceSelectedDragAndDrop = nIndexSource

	// cancel the wait timer which hides the drag and drop popup
	CANCEL_WAIT 'WAIT::Kill Drag And Drop Popup'

	// turn on feedback for the associated source select button
	on[dvTpBoardroomTableSourceselect, nBtnsSourceSelect[nIndexSource]]

	// Set the bitmap for the drag & drop overlay button on the drag & drop popup to the icon used to show the user their touch coordinates
	if(nDvxVideoInputSignalStatus[nIndexSource])
		SEND_COMMAND dvTpPreview,"'^BBR-',ITOA(nAdrDragAndDropUserTouchCoordinateIcon),',0,','MXA_PREVIEW_',itoa(nIndexSource)"
	else
		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')

	// Set variable to indicate that no destination has been chosen for the selected source
	nDragAndDropDestinationSelected = nDRAG_AND_DROP_DESTINATION_OPTION_NONE

	// Set hide effect on the drag & drop popup to fade out
	fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, cMODERO_HIDE_EFFECT_FADE)
	fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, cMODERO_HIDE_EFFECT_FADE)
	fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, cMODERO_HIDE_EFFECT_FADE)
	fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, cMODERO_HIDE_EFFECT_FADE)

	// Set hide effect time on the drag and drop popup
	fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, 30)
	fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, 30)
	fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, 30)
	fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, 30)

	// Show the drag and drop popup
	if( nVcMode )
	{
		fnModeroEnablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank)
		fnModeroEnablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent)
	}
	else
	{
		fnModeroEnablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft)
		fnModeroEnablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight)
	}

	fnModeroEnablePopup(dvTpBoardroomTableSourceselect, cPopupNameDragAndDropIcon)
}



define_function fnShowSelectedSourceDeviceControlsOnPanel (integer nIndexSource, integer nIndexDestination)
{

	switch (nIndexDestination)
    {
		case nINDEX_DEST_MONITOR_LEFT:
		{
			switch (nIndexSource)
			{
				case nINDEX_SOURCE_BLURAY:	fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicBluray')
				case nINDEX_SOURCE_DTV:		fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicTv')
				case nINDEX_SOURCE_LAPTOP:	fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicLaptop')
				case nINDEX_SOURCE_ENZO:	fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicEnzo')

				case nINDEX_SOURCE_VC_CAMERA:
				CASE nINDEX_SOURCE_ROOM_LINK:
				case nINDEX_SOURCE_SIGNAGE:
				case nINDEX_SOURCE_INPUT_03:
				case nINDEX_SOURCE_INPUT_04:
				case nINDEX_SOURCE_NONE:
				case nINDEX_SOURCE_VC_MAIN:
				{
					fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicBluray')
					fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlAdvancedBluray')
					fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicTv')
				}
			}
		}
		case nINDEX_DEST_MONITOR_RIGHT:
		{
			if( !nVcMode )
			{
				switch (nIndexSource)
				{
					case nINDEX_SOURCE_BLURAY:	fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicBluray')
					case nINDEX_SOURCE_DTV:		fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicTv')
					case nINDEX_SOURCE_LAPTOP:	fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicLaptop')
					case nINDEX_SOURCE_ENZO:	fnModeroEnablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicEnzo')

					case nINDEX_SOURCE_VC_CAMERA:
					CASE nINDEX_SOURCE_ROOM_LINK:
					case nINDEX_SOURCE_SIGNAGE:
					case nINDEX_SOURCE_INPUT_03:
					case nINDEX_SOURCE_INPUT_04:
					case nINDEX_SOURCE_NONE:
					case nINDEX_SOURCE_VC_MAIN:
					{
						fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicBluray')
						fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlAdvancedBluray')
						fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicTv')
					}
				}
			}
		}
    }
}



define_function fnUserDeselectedSourceForDragAndDrop (integer nIndexSource)
{
    // Set flag to indicate that a source select button is not being held down anymore
    off[nSourceSelectButtonBeingHeld]

    // turn off feedback for the associated source select button
    off[dvTpBoardroomTableSourceselect, nBtnsSourceSelect[nIndexSource]]

    // turn off feedback for the destination select buttons on the drag and drop popup
    off[dvTpBoardroomTableSourceselect, nBtnDestinationSelectDragAndDropMonitorLeft]
    off[dvTpBoardroomTableSourceselect, nBtnDestinationSelectDragAndDropMonitorRight]

    // clear the bitmap for the user touch coordinates over button on the drag & drop popup
    fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon, nMODERO_BUTTON_STATE_ALL, '')

    if (nIndexDestinationSelectedDragAndDrop != nINDEX_DEST_NONE)	// if a destination was chosen for the selected source
    {
		if (nDvxVideoInputSignalStatus[nIndexSource] != 1)	// source chosen has no signal
		{
			// Disable the hide effect on the drag & drop popup
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, cMODERO_HIDE_EFFECT_NONE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, cMODERO_HIDE_EFFECT_NONE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, cMODERO_HIDE_EFFECT_NONE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, cMODERO_HIDE_EFFECT_NONE)

			// Hide the drag & drop popup
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropIcon)

			fnModeroEnablePopup(dvTpBoardroomTableMain, cPopupNameSelectedInputSourceWithNoSignal)
		}
		else	// source chosen has a signal
		{
			// Show controls for that source device on the panel
			fnShowSelectedSourceDeviceControlsOnPanel(nIndexSourceSelectedDragAndDrop, nIndexDestinationSelectedDragAndDrop)

			// Switch the selected source input to the selected destination output
			fnSwitchDragAndDropSelectedSourceToSelectedDestination ()

			// Disable the hide effect on the drag & drop popup
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, cMODERO_HIDE_EFFECT_NONE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, cMODERO_HIDE_EFFECT_NONE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, cMODERO_HIDE_EFFECT_NONE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, cMODERO_HIDE_EFFECT_NONE)

			// Hide the drag & drop popup
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropIcon)

			nIndexSourceSelectedDragAndDrop = nINDEX_SOURCE_NONE
			nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_NONE
		}
    }
    else	// if no destination was chosen by the user
    {
		// make sure the drag and drag popup is displayed for at least 3 seconds so the user unfamiliar with the system can see the drag and drop instructions
		// if they quickly press/release a source select button thinking that is how you use the system.

		if( button.holdtime <= nHoldTimeSourceSelectButtonsInMs)	// if the button has not been held for at least 3 seconds
		{
			local_var integer nHoldTimeRemainingInTenthsOfSeconds

			nHoldTimeRemainingInTenthsOfSeconds = TYPE_CAST( ((nHoldTimeSourceSelectButtonsInMs - button.holdtime) / 100) )
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropIcon)
			WAIT nHoldTimeRemainingInTenthsOfSeconds 'WAIT::Kill Drag And Drop Popup'
			{
				fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, cMODERO_HIDE_EFFECT_FADE)
				fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, cMODERO_HIDE_EFFECT_FADE)
				fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, cMODERO_HIDE_EFFECT_FADE)
				fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, cMODERO_HIDE_EFFECT_FADE)
				fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, nFadeTimeDragAndDropPopupHideEffect)
				fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, nFadeTimeDragAndDropPopupHideEffect)
				fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, nFadeTimeDragAndDropPopupHideEffect)
				fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, nFadeTimeDragAndDropPopupHideEffect)
				fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft)
				fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank)
				fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight)
				fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent)
			}
		}
		else				// if the button has been held for at least 3 seconds
		{
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, cMODERO_HIDE_EFFECT_FADE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, cMODERO_HIDE_EFFECT_FADE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, cMODERO_HIDE_EFFECT_FADE)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, cMODERO_HIDE_EFFECT_FADE)
			fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft, nFadeTimeDragAndDropPopupHideEffect)
			fnModeroSetPopupHideEffect (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank, cMODERO_HIDE_EFFECT_FADE)
			fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight, nFadeTimeDragAndDropPopupHideEffect)
			fnModeroSetPopupHideEffectTime (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent, nFadeTimeDragAndDropPopupHideEffect)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeft)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskLeftBlank)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRight)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropSourceSelectMaskRightVcContent)
			fnModeroDisablePopup (dvTpBoardroomTableSourceselect, cPopupNameDragAndDropIcon)
		}

		nIndexSourceSelectedDragAndDrop = nINDEX_SOURCE_NONE
		nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_NONE
    }

    fnModeroSetButtonHide(dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon)
	OFF[nVisibleStateOfDragAndDropIcon]
}




#define INCLUDE_MODERO_NOTIFY_TOUCH_COORDINATES_MOVE
// Note: This will get triggered BEFORE a push event handler in a button_event
// Note: If push/release coordinate reporting is enabled a movement in user touch anywhere on the panel will trigger this function
define_function fnModeroNotifyTouchCoordinatesMove (dev dvPanel, integer nX, integer nY)
{
    if (nSourceSelectButtonBeingHeld)
    {
		select
		{
			active (dvPanel == dvTpBoardroomTableMain):
			{
				stack_var _Boundary uBoundaryAbsoluteUserIcon

				nTouchCoordinateMoveX = nX
				nTouchCoordinateMoveY = nY

				uBoundaryAbsoluteUserIcon.nLeft = (nX - (nDragIconWidth/2))
				uBoundaryAbsoluteUserIcon.nTop = (nY - (nDragIconHeight/2))
				uBoundaryAbsoluteUserIcon.nWidth = nDragIconWidth
				uBoundaryAbsoluteUserIcon.nWidth = nDragIconHeight

				fnUpdateUserTouchCoordinates (nTouchCoordinateMoveX, nTouchCoordinateMoveY)

				if( !nVisibleStateOfDragAndDropIcon )
				{
					fnModeroSetButtonPositionAndSize(dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon,fnGetUserTouchIconLeft(),fnGetUserTouchIconTop(),fnGetUserTouchIconWidth(),fnGetUserTouchIconHeight())
					fnModeroSetButtonShow(dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon)
					ON[nVisibleStateOfDragAndDropIcon]
				}
				else
				{
					WAIT .5
					fnModeroSetButtonPositionAndSize(dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon,fnGetUserTouchIconLeft(),fnGetUserTouchIconTop(),fnGetUserTouchIconWidth(),fnGetUserTouchIconHeight())
				}

				if ( !nVcMode AND fnCheckForCollision(uBoundaryAbsoluteUserIcon, uDragAndDropDestinationLeftMonitor))
				{
					off[dvTpBoardroomTableSourceselect,nBtnDestinationSelectDragAndDropMonitorRight]
					on[dvTpBoardroomTableSourceselect,nBtnDestinationSelectDragAndDropMonitorLeft]
					nDragAndDropDestinationSelected = nDRAG_AND_DROP_DESTINATION_OPTION_MONITOR_LEFT
					nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_MONITOR_LEFT
				}
				else if (fnCheckForCollision(uBoundaryAbsoluteUserIcon, uDragAndDropDestinationRightMonitor))
				{
					off[dvTpBoardroomTableSourceselect,nBtnDestinationSelectDragAndDropMonitorLeft]
					on[dvTpBoardroomTableSourceselect,nBtnDestinationSelectDragAndDropMonitorRight]
					nDragAndDropDestinationSelected = nDRAG_AND_DROP_DESTINATION_OPTION_MONITOR_RIGHT
					nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_MONITOR_RIGHT
				}
				else
				{
					off[dvTpBoardroomTableSourceselect,nBtnDestinationSelectDragAndDropMonitorLeft]
					off[dvTpBoardroomTableSourceselect,nBtnDestinationSelectDragAndDropMonitorRight]
					nDragAndDropDestinationSelected = nDRAG_AND_DROP_DESTINATION_OPTION_NONE
					nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_NONE
				}
			}
		}
    }
}




define_function fnInitRoomAvLighting()
{
	CANCEL_WAIT 'DEMO MODE'

	// turn lights on
	CANCEL_WAIT 'WAITING TO TURN OFF LIGHTS AFTER MEETING END'
	send_command vdvLight, "'LIGHTSYSTEMSTATE-',cLightAddressBoardroom,',ON'"

	// start the meeting
	fnDvxSwitchAudioOnly (dvDvxMainPort, 0, dvDvxAudOutSpeakersFrontOfHouse.port)
	nIndexSourceAudioToFrontOfHouseSpeakers = nINDEX_SOURCE_NONE

	// #1 turn the monitors on
	fnNecMonitorEnablePower(vdvMonitorLeft)
	fnNecMonitorEnablePower(vdvMonitorRight)

	fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
	fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

	// #2 display the AMX logo on the monitors
	fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_LOGO_2)
	fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_LOGO_2)

	// #3 show the no video icon on the monitor preview buttons on the panel
	fnModeroSetButtonBitmap(dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
	fnModeroSetButtonBitmap(dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')

	WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
	{
		fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
		fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
	}
}



define_function fnInitRoomFromWelcomePanelAdHocMeetingCreation()
{
	ON[nAdHocMeetingBookedFromWelcomePanel]
	fnInitRoomAvLighting()
}



define_function fnInitRoomFromTablePanelAdHocMeetingCreation()
{
	// ad-hoc booking created from welcome panel
	fnModeroSetPage(dvTpBoardroomTableMain,'rmsSchedulingPage')
	fnModeroEnablePopup(dvTpBoardroomTableMain,'[paneLeft2]SubNavOnly_Vol')
	fnModeroEnablePopup(dvTpBoardroomTableMain,'[paneRight2]SubNavOnly')
	ON[nRoomInUse]

	fnInitRoomAvLighting()
}




(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

define_function fnDisplaySourceBothMonitors (DEV dvDvxVideoInputPort)
{
    fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
    fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

	fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_OFF)
	fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_OFF)

    fnDvxSwitchVideoOnly(dvDvxMainPort, dvDvxVideoInputPort.PORT, dvDvxVidOutMonitorLeft.PORT)
    fnDvxSwitchVideoOnly(dvDvxMainPort, dvDvxVideoInputPort.PORT, dvDvxVidOutMonitorRight.PORT)

	WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
    {
		fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
		fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
    }

    dvSelectedDvxInputMonitorLeft = dvDvxVideoInputPort
    dvSelectedDvxInputMonitorRight = dvDvxVideoInputPort

    fnDvxSwitchAudioOnly (dvDvxMainPort, dvDvxVideoInputPort.port, dvDvxAudOutSpeakersFrontOfHouse.port)
    on[dvTpBoardroomTableSourceselect,nBtnAudioSelectMonitorLeft]
    on[dvTpBoardroomTableSourceselect,nBtnAudioSelectMonitorLeft]
}



define_function fnDisplaySourceLeftMonitor (DEV dvDvxVideoInputPort)
{
    fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
	fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_OFF)
    fnDvxSwitchVideoOnly(dvDvxMainPort, dvDvxVideoInputPort.PORT, dvDvxVidOutMonitorLeft.PORT)

	WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
    {
		fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
    }

    dvSelectedDvxInputMonitorLeft = dvDvxVideoInputPort

    fnDvxSwitchAudioOnly (dvDvxMainPort, dvDvxVideoInputPort.port, dvDvxAudOutSpeakersFrontOfHouse.port)
    on[dvTpBoardroomTableSourceselect,nBtnAudioSelectMonitorLeft]
}



define_function fnDisplaySourceRightMonitor (DEV dvDvxVideoInputPort)
{
    fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)
	fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_OFF)
    fnDvxSwitchVideoOnly(dvDvxMainPort, dvDvxVideoInputPort.PORT, dvDvxVidOutMonitorRight.PORT)

	WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
    {
		fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
    }

    dvSelectedDvxInputMonitorRight = dvDvxVideoInputPort

    fnDvxSwitchAudioOnly (dvDvxMainPort, dvDvxVideoInputPort.port, dvDvxAudOutSpeakersFrontOfHouse.port)
    on[dvTpBoardroomTableSourceselect,nBtnAudioSelectMonitorRight]
}



define_function fnUpdateMonitorPreviewSourceButtons()
{
    local_var integer nIndexLeft
	local_var integer nIndexRight

	nIndexLeft = 0
	nIndexRight = 0

	if(dvSelectedDvxInputMonitorLeft == dvDvxVidInNone)
	{
		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
	}
	else
	{
		for (nIndexLeft=1; nIndexLeft<=LENGTH_ARRAY(dvDvxVidInPortsForMpl); nIndexLeft++)
		{
			if (dvSelectedDvxInputMonitorLeft == dvDvxVidInPortsForMpl[nIndexLeft])
			{
				local_var char cDynamicImageName[30]
				cDynamicImageName = "'MXA_PREVIEW_',itoa(nIndexLeft)"

				// copy the bitmap from the input source select button
				if( nDvxVideoInputSignalStatus[nIndexLeft] == 1 )
					SEND_COMMAND dvTpPreview,"'^BBR-',ITOA(nAdrDestinationSelectMonitorLeft),',0,',cDynamicImageName"
				else
					fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')

				break	// exit the for loop
			}
		}
	}

	if(dvSelectedDvxInputMonitorRight == dvDvxVidInNone )
		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
	else
	{
		for (nIndexRight=1; nIndexRight<=LENGTH_ARRAY(dvDvxVidInPortsForMpl); nIndexRight++)
		{
			if (dvSelectedDvxInputMonitorRight == dvDvxVidInPortsForMpl[nIndexRight])
			{
				local_var char cDynamicImageName[30]
				cDynamicImageName = "'MXA_PREVIEW_',itoa(nIndexRight)"

				if( nDvxVideoInputSignalStatus[nIndexRight] == 1 )
					SEND_COMMAND dvTpPreview,"'^BBR-',ITOA(nAdrDestinationSelectMonitorRight),',0,',cDynamicImageName"
				else
					fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')

				break	// exit the for loop
			}
		}
	}
}



#define INCLUDE_DVX_NOTIFY_AUDIO_OUT_MUTE_CALLBACK
define_function fnDvxNotifyAudioOutMute (dev dvDvxAudioOutput, char cMuteStatus[])
{
    // dvDvxAudioOutput is the D:P:S of the video output port on the DVX switcher. The output number can be taken from dvDvxAudioOutput.PORT
    // cMuteStatus is the mute status (cENABLE | cDISABLE)
    if (dvDvxAudioOutput == dvDvxAudOutSpeakersFrontOfHouse)
    {
		switch (cMuteStatus)
		{
			case cENABLE:	ON[dvTpBoardroomTableVolume, nBtnVolumeMuteToggle]
			case cDISABLE:	OFF[dvTpBoardroomTableVolume, nBtnVolumeMuteToggle]
		}
    }
}






(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

///////// Initialise the collision boundary data
uDragAndDropDestinationLeftMonitor.nLeft = nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_LEFT
uDragAndDropDestinationLeftMonitor.nTop = nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_TOP
uDragAndDropDestinationLeftMonitor.nWidth = nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_WIDTH
uDragAndDropDestinationLeftMonitor.nHeight = nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_HEIGHT

uDragAndDropDestinationRightMonitor.nLeft = nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_LEFT
uDragAndDropDestinationRightMonitor.nTop = nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_TOP
uDragAndDropDestinationRightMonitor.nWidth = nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_WIDTH
uDragAndDropDestinationRightMonitor.nHeight = nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_HEIGHT

fnUpdateUserTouchIconSize (nDragIconWidth, nDragIconHeight)





(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

data_event[dvIrBluray]
{
	online:
	{
		send_command dvIrBluray, "'CTON',2"
		send_command dvIrBluray, "'CTOF',3"
	}
}



data_event[dvTpBoardroomTableMain]
{
    online:
    {
		stack_var integer nIdx

		cPanelIpAddress = data.sourceip

		fnModeroSetButtonHide(dvTpBoardroomTableSourceselect, nAdrDragAndDropUserTouchCoordinateIcon)
		off[nVisibleStateOfDragAndDropIcon]
    }
}



button_event[dvTpBoardroomTableSourceselect,nBtnsSourceSelect]
{
    push:
    {
		stack_var integer nIndexSourceSelected

		// Enable touch coordinate tracking
		fnModeroEnableTouchCoordinateTrackingPressReleaseMove (dvTpBoardroomTableMain)

		// grab the index of the channel code array that contains the channel code that triggered this button_event
		nIndexSourceSelected = GET_LAST(nBtnsSourceSelect)

		// Call the function to handle what to do when the user selects a source
		fnUserSelectedSourceForDragAndDrop (nIndexSourceSelected)
    }
    release:
    {
		stack_var integer nIndexSourceSelected

		// grab the index of the channel code array that contains the channel code that triggered this button_event
		nIndexSourceSelected = GET_LAST(nBtnsSourceSelect)

		// Call the function to handle what to do when the user deselects a source
		fnUserDeselectedSourceForDragAndDrop (nIndexSourceSelected)

		// Disable touch coordinate tracking
		fnModeroDisableTouchCoordinateTracking (dvTpBoardroomTableMain)
    }
}



level_event[dvTpBoardroomTableVolume, nLvlTpVolumeBargraph]
{
    fnDvxSetAudioOutputVolume(dvDvxAudOutSpeakersFrontOfHouse, level.value)
}



button_event[dvTpBoardroomTableVolume, nBtnVolumeMuteToggle]
{
    push:
    {
		fnDvxCycleAudioOutputVolumeMute (dvDvxAudOutSpeakersFrontOfHouse)
    }
}



button_event[dvTpBoardroomTableCodeTesting,0]
{
    push:
    {
		switch (button.input.channel)
		{
			case 1:	fnModeroEnableTouchNotificationIpPort(dvTpBoardroomTableMain, nTcpIpPortModeroTouchCoordinatesNotifications)
			case 2:	fnModeroDisableTouchNotificationIpPort(dvTpBoardroomTableMain)
			case 3:	fnModeroConnectToTouchNotificationPort(dvIpSocketToMonitorTouchCoordinates, cPanelIpAddress, nTcpIpPortModeroTouchCoordinatesNotifications)
			case 4:	fnModeroDisconnectFromTouchNotificationPort (dvIpSocketToMonitorTouchCoordinates)

			case 5: fnMplDvxTpPreviewCycleStart()
			case 6: fnMplDvxTpPreviewCycleStop()
		}
    }
}



button_event[dvTpBoardroomTableLighting, nBtnLightsOff]
button_event[dvTpBoardroomTableLighting, nBtnLightsOn]
button_event[dvTpBoardroomTableLighting, nBtnLightsMid]
button_event[dvTpBoardroomTableLighting, nBtnLightsUp]
button_event[dvTpBoardroomTableLighting, nBtnLightsDown]
{
    PUSH:
    {
		min_to[button.input]	// button feedback

		switch (button.input.channel)
		{
			case nBtnLightsOff:		send_command vdvLight, "'LIGHTSYSTEMSTATE-',cLightAddressBoardroom,',OFF'"
			case nBtnLightsOn:		send_command vdvLight, "'LIGHTSYSTEMSTATE-',cLightAddressBoardroom,',ON'"
			case nBtnLightsMid:		send_command vdvLight, "'LIGHTSYSTEMLEVEL-',cLightAddressBoardroom,',75'"	// set to 50% light (logarithmic scale so choose 75%)
			case nBtnLightsUp:		send_command vdvLight, "'LIGHTSYSTEMRAMP-',cLightAddressBoardroom,',UP'"
			case nBtnLightsDown:	send_command vdvLight, "'LIGHTSYSTEMRAMP-',cLightAddressBoardroom,',DOWN'"
		}
    }
    RELEASE:
    {
		switch (button.input.channel)
		{
			case nBtnLightsUp:
			case nBtnLightsDown:
			send_command vdvLight, "'LIGHTSYSTEMRAMP-',cLightAddressBoardroom,',STOP'"
		}
    }
}



// Audio source selection buttons
button_event[dvTpBoardroomTableSourceselect, nBtnsAudioSelect]
{
    push:
    {
		stack_var integer nIndexDestination
		stack_var integer nIndexSource
		stack_var integer nIndex

		// get the destination corresponding to the audio selection button that was pushed
		nIndexDestination = GET_LAST(nBtnsAudioSelect)

		// find out what VIDEO source is routed to that destination
		nIndexSource = nVideoRoutesSourceIndexes[nIndexDestination]

		// switch the audio of that source to the front of house speakers
		fnDvxSwitchAudioOnly (dvDvxMainPort, dvDvxAudInPorts[nIndexSource].port, dvDvxAudOutSpeakersFrontOfHouse.port)

		// set the variable to store the index number of the source routed to the front of house speakers
		nIndexSourceAudioToFrontOfHouseSpeakers = nIndexSource
    }
}




button_event[dvTpBoardroomTableMain, nBtnSystemShutdown]
{
    push:
    {
		fnModeroDisableAllPopups(dvTpBoardroomTableMain)

		fnModeroSetPage (dvTpBoardroomTableMain, 'SPLASH')
		OFF[nRoomInUse]

		fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
		fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

		fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_LOGO_2)
		fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_LOGO_2)

		WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
		{
			fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
			fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
		}

		fnDvxSwitchAudioOnly (dvDvxMainPort, 0, dvDvxAudOutSpeakersFrontOfHouse.port)
		nIndexSourceAudioToFrontOfHouseSpeakers = nINDEX_SOURCE_NONE

		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, '')
		fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, '')

		dvSelectedDvxInputMonitorRight = dvDvxVidInSignage
		dvSelectedDvxInputMonitorLeft = dvDvxVidInSignage

		nIndexSourceVideoDisplayedOnMonitorLeft = 0
		nIndexSourceVideoDisplayedOnMonitorRight = 0

		dvSelectedDvxInputMonitorLeft = dvDvxVidInNone
		dvSelectedDvxInputMonitorRight = dvDvxVidInNone

		OFF[nVcMode]

		// cancel the current meeting through RMS
		RmsBookingEnd(cRmsBookingIdCurrentMeeting, 0)

		fnModeroEnablePopup(dvTpBoardroomTableMain,'CancellingBooking')

		CANCEL_WAIT 'DEMO MODE'
		WAIT nWaitTimeDemoMode 'DEMO MODE'
		{
			if( !nRoomInUse )
			{
				fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)
				fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

				fnDvxSwitchVideoOnly (dvDvxMainPort, dvDvxVidInSignage.port, dvDvxVidOutMonitorLeft.port)
				fnDvxSwitchVideoOnly (dvDvxMainPort, dvDvxVidInSignage.port, dvDvxVidOutMonitorRight.port)

				fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_OFF)
				fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_OFF)

				WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
				{
					fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
					fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
				}
			}
		}
    }
}



button_event[dvTpBoardroomTableMain, nBtnSystemSendRmsHelpRequest]
{
	push:
	{
		RmsSendHelpRequest('Assistance required.')
	}
}



button_event[dvTpBoardroomTableBluray, 0]
{
    push:
    {
		switch (button.input.channel)
		{
			case nBtnBlurayPlay:			send_command dvIrBluray, "'SP',nIrBlurayPlay"
			case nBtnBluRayPause:			send_command dvIrBluray, "'SP',nIrBlurayPause"
			case nBtnBluRayStop:			send_command dvIrBluray, "'SP',nIrBlurayStop"
			case nBtnBluRayFastForward:		send_command dvIrBluray, "'SP',nIrBlurayFastForward"
			case nBtnBlurayfastReverse:		send_command dvIrBluray, "'SP',nIrBlurayFastReverse"
			case nBtnBlurayNextChapter:		send_command dvIrBluray, "'SP',nIrBlurayNextChapter"
			case nBtnBlurayPrevChapter:		send_command dvIrBluray, "'SP',nIrBlurayPrevChapter"

			case nBtnBlurayOpenClose:		send_command dvIrBluray, "'SP',nIrBlurayOpenClose"
			case nBtnBlurayPowerToggle:		send_command dvIrBluray, "'SP',nIrBlurayPowerToggle"

			case nBtnBlurayCursorUp:		send_command dvIrBluray, "'SP',nIrBlurayCursorUp"
			case nBtnBlurayCursorDown:		send_command dvIrBluray, "'SP',nIrBlurayCursorDown"
			case nBtnBlurayCursorLeft:		send_command dvIrBluray, "'SP',nIrBlurayCursorLeft"
			case nBtnBlurayCursorRight:		send_command dvIrBluray, "'SP',nIrBlurayCursorRight"

			case nBtnBluraySelect:			send_command dvIrBluray, "'SP',nIrBluraySelect"
			case nBtnBlurayReturn:			send_command dvIrBluray, "'SP',nIrBlurayReturn"
			case nBtnBlurayExit:			send_command dvIrBluray, "'SP',nIrBlurayExit"
			case nBtnBlurayTools:			send_command dvIrBluray, "'SP',nIrBlurayTools"
			case nBtnBlurayInfo:			send_command dvIrBluray, "'SP',nIrBlurayInfo"

			case nBtnBlurayDiscMenu:		send_command dvIrBluray, "'SP',nIrBlurayDiscMenu"
			case nBtnBlurayTitleMenuPopup:	send_command dvIrBluray, "'SP',nIrBlurayTitleMenuPopup"
			case nBtnBluraySubtitle:		send_command dvIrBluray, "'SP',nIrBluraySubtitle"

		}
    }
}



button_event[dvTpBoardroomTableMain,nBtnsRightPopup]
{
	push:
	{
		nCurrentRightPopup = get_last(nBtnsRightPopup);
		switch (nCurrentRightPopup)
		{
			case 1: //Conf
			{
				if(!nVcMode)
				{
					ON[nVcMode]
					nIndexSourceVideoDisplayedOnMonitorLeft = nINDEX_SOURCE_VC_MAIN
					dvSelectedDvxInputMonitorLeft = dvDvxVidInPorts[nIndexSourceVideoDisplayedOnMonitorLeft]
					nIndexSourceVideoDisplayedOnMonitorRight = nINDEX_SOURCE_VC_CAMERA
					dvSelectedDvxInputMonitorRight = dvDvxVidInPorts[nIndexSourceVideoDisplayedOnMonitorRight]

					// Send Signage to left screen
					fnDisplaySourceLeftMonitor (dvDvxVidInVcMain)

					// send camera to right screen
					fnDisplaySourceRightMonitor (dvDvxVidInVcCamera)

					fnNecMonitorEnablePower(vdvMonitorLeft)

					fnNecMonitorEnablePower(vdvMonitorRight)

					SEND_COMMAND dvTpPreview,"'^BBR-',ITOA(nAdrDestinationSelectMonitorLeft),',0,','MXA_PREVIEW_',itoa(nINDEX_SOURCE_VC_MAIN)"
					SEND_COMMAND dvTpPreview,"'^BBR-',ITOA(nAdrDestinationSelectMonitorRight),',0,','MXA_PREVIEW_',itoa(nINDEX_SOURCE_VC_CAMERA)"

					// Hide source control popups
					fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomRight]SourceControlBasicBluray')	// will hide all popups in paneBottomRight group
					fnModeroDisablePopup (dvTpBoardroomTableSourceselect, '[paneBottomLeft]SourceControlBasicBluray')	// will hide all popups in paneBottomLeft group
				}
			}
			case 2: //Lights
			case 3: //Camera
			case 4: //Spare
			{
			}
		}
	}
}



button_event[dvTpBoardroomTableCamera,0]
{
	push:
	{
		switch(button.input.channel)
		{
			case nBtnCameraPanRight:		fnCameraEnablePanLeft(vdvCamera)	// back the front on purpose
			case nBtnCameraPanLeft:			fnCameraEnablePanRight(vdvCamera)	// back the front on purpose

			case nBtnCameraTiltDown:		fnCameraEnableTiltDown(vdvCamera)
			case nBtnCameraTiltUp:			fnCameraEnableTiltUp(vdvCamera)

			case nBtnCameraFocusFar:		fnCameraEnableFocusFar(vdvCamera)
			case nBtnCameraFocusNear:		fnCameraEnableFocusNear(vdvCamera)

			case nBtnCameraZoomIn:			fnCameraEnableZoomIn(vdvCamera)
			case nBtnCameraZoomOut:			fnCameraEnableZoomOut(vdvCamera)
		}
	}
	release:
	{
		switch(button.input.channel)
		{
			case nBtnCameraPanRight:		fnCameraDisablePanLeft(vdvCamera)	// back the front on purpose
			case nBtnCameraPanLeft:			fnCameraDisablePanRight(vdvCamera)	// back the front on purpose

			case nBtnCameraTiltDown:		fnCameraDisableTiltDown(vdvCamera)
			case nBtnCameraTiltUp:			fnCameraDisableTiltUp(vdvCamera)

			case nBtnCameraFocusFar:		fnCameraDisableFocusFar(vdvCamera)
			case nBtnCameraFocusNear:		fnCameraDisableFocusNear(vdvCamera)

			case nBtnCameraZoomIn:			fnCameraDisableZoomIn(vdvCamera)
			case nBtnCameraZoomOut:			fnCameraDisableZoomOut(vdvCamera)
		}
	}
}



button_event[dvTpBoardroomTableTv,nBtnsTvSelectPresetChannels]
{
	push:
	{
		fnIpTvSelectChannelNumber(iIpTvRxIdxBoardroom,get_last(nBtnsTvSelectPresetChannels))
	}
}



button_event[dvTpBoardroomTableMftx,0]
{
	push:
	{
		switch (button.input.channel)
		{
			case nBtnMftxSelectHdmi:
			{
				if(nVideoRoutesSourceIndexes[dvDvxVidOutMonitorLeft.port] == dvDvxVidInLaptop)
				{
					fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)

					WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
					{
						fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
					}
				}

				if(nVideoRoutesSourceIndexes[dvDvxVidOutMonitorRight.port] == dvDvxVidInLaptop)
				{
					fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

					WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
					{
						fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
					}
				}

				send_command dvDxlinkMfTxLaptopMain, 'VI7O6'
			}
			case nBtnMftxSelectVga:
			{
				if(nVideoRoutesSourceIndexes[dvDvxVidOutMonitorLeft.port] == dvDvxVidInLaptop)
				{
					fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorLeft)

					WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
					{
						fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorLeft)
					}
				}

				if(nVideoRoutesSourceIndexes[dvDvxVidOutMonitorRight.port] == dvDvxVidInLaptop)
				{
					fnDvxEnableVideoOutputMute(dvDvxVidOutMonitorRight)

					WAIT nWaitTimeMutingDvxVideoOutputBetweenSwitch
					{
						fnDvxDisableVideoOutputMute(dvDvxVidOutMonitorRight)
					}
				}

				send_command dvDxlinkMfTxLaptopMain, 'VI8O6'
			}
		}
	}
}



data_event[dvDxlinkMfTxLaptopMain]
{
	command:
	{
		stack_var char cHeader[25]
		stack_var char cMsg[25]

		cHeader = remove_string(data.text,"'-'",1)
		cMsg = data.text

		switch(cHeader)
		{
			case 'SWITCH-':
			{
				if(find_string(cMsg,'LVIDEO',1) == 1)
				{
					// LVIDEOI<input>O<output>
					stack_var integer iInput
					iInput = atoi(cMsg)
					switch (iInput)
					{
						case 7:	// digital input selected
						{
							OFF[dvTpBoardroomTableMftx,nBtnMftxSelectVga]
							ON[dvTpBoardroomTableMftx,nBtnMftxSelectHdmi]
						}
						case 8:	// analog input selected
						{
							OFF[dvTpBoardroomTableMftx,nBtnMftxSelectHdmi]
							ON[dvTpBoardroomTableMftx,nBtnMftxSelectVga]
						}
					}
				}
			}
		}
	}
}



button_event[dvTpBoardroomTableEnzo,0]
{
	push:
	{
		switch (button.input.channel)
		{
			case nBtnEnzoBack:			fnEnzoBack(dvEnzo)
			case nBtnEnzoDown:			fnEnzoDown(dvEnzo)
			case nBtnEnzoEnter:			fnEnzoEnter(dvEnzo)
			case nBtnEnzoFastForward:	fnEnzoFastForward(dvEnzo)
			case nBtnEnzoHome:			fnEnzoHome(dvEnzo)
			case nBtnEnzoLeft:			fnEnzoLeft(dvEnzo)
			case nBtnEnzoNext:			fnEnzoNext(dvEnzo)
			case nBtnEnzoPageDown:		fnEnzoPageDown(dvEnzo)
			case nBtnEnzoPageUp:		fnEnzoPageUp(dvEnzo)
			case nBtnEnzoPause:			fnEnzoPause(dvEnzo)
			case nBtnEnzoPlay:			fnEnzoPlay(dvEnzo)
			case nBtnEnzoPrevious:		fnEnzoPrevious(dvEnzo)
			case nBtnEnzoRewind:		fnEnzoRewind(dvEnzo)
			case nBtnEnzoRight:			fnEnzoRight(dvEnzo)
			case nBtnEnzoSessionExit:	fnEnzoSessionExit(dvEnzo)
			case nBtnEnzoSessionStart:	fnEnzoSessionStart(dvEnzo)
			case nBtnEnzoStop:			fnEnzoStop(dvEnzo)
			case nBtnEnzoUp:			fnEnzoUp(dvEnzo)
		}
	}
}



button_event[dvTpBoardroomTableVc,0]
{
	push:
	{
		switch(button.input.channel)
		{
			case nBtnVcHangup:
			{
				OFF[nVcMode]

				// switch no input to both outputs
				nIndexSourceVideoDisplayedOnMonitorLeft = nINDEX_SOURCE_NONE
				dvSelectedDvxInputMonitorLeft = dvDvxVidInPorts[nIndexSourceVideoDisplayedOnMonitorLeft]

				nIndexSourceVideoDisplayedOnMonitorRight = nINDEX_SOURCE_NONE
				dvSelectedDvxInputMonitorRight = dvDvxVidInPorts[nIndexSourceVideoDisplayedOnMonitorRight]

				// Send no input to left and right screen
				fnDisplaySourceLeftMonitor (dvDvxVidInNone)

				// send no input to right screen
				fnDisplaySourceRightMonitor (dvDvxVidInNone)

				fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorLeft,cDVX_TEST_PATTERN_LOGO_2)
				fnDvxSetVideoOutputTestPattern(dvDvxVidOutMonitorRight,cDVX_TEST_PATTERN_LOGO_2)

				fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
				fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
			}
			case nBtnVcSelectCam:
			{
				nIndexSourceVideoDisplayedOnMonitorRight = nINDEX_SOURCE_VC_CAMERA
				dvSelectedDvxInputMonitorRight = dvDvxVidInPorts[nIndexSourceVideoDisplayedOnMonitorRight]

				// send camera to right screen
				fnDisplaySourceRightMonitor (dvDvxVidInVcCamera)
				fnNecMonitorEnablePower(vdvMonitorRight)

				SEND_COMMAND dvTpPreview,"'^BBR-',ITOA(nAdrDestinationSelectMonitorRight),',0,','MXA_PREVIEW_',itoa(nINDEX_SOURCE_VC_CAMERA)"
			}
		}
	}
}



button_event[dvTpBoardroomTableMain,nBtnSystemSplash]
{
	hold[50]:
	{
		fnModeroSetPage(dvTpBoardroomTableMain,'rmsSchedulingPage')
		fnModeroEnablePopup(dvTpBoardroomTableMain,'[paneLeft2]SubNavOnly_Vol')
		fnModeroEnablePopup(dvTpBoardroomTableMain,'[paneRight2]SubNavOnly')
		ON[nRoomInUse]

		fnInitRoomAvLighting()
	}
}



button_event[dvTpBoardroomTableMain,nBtnSystemConfirmSwitchForInputWithNoSignal]
{
	push:
	{
		// Show controls for that source device on the panel
		fnShowSelectedSourceDeviceControlsOnPanel(nIndexSourceSelectedDragAndDrop, nIndexDestinationSelectedDragAndDrop)

		// Switch the selected source input to the selected destination output
		fnSwitchDragAndDropSelectedSourceToSelectedDestination ()

		// Set the flag to indicate that no destination is chosen anymore
		nIndexSourceSelectedDragAndDrop = nINDEX_SOURCE_NONE
		nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_NONE
	}
}



button_event[dvTpBoardroomTableMain,nBtnSystemCancelSwitchForInputWithNoSignal]
{
	push:
	{
		// Set the flag to indicate that no destination is chosen anymore
		nIndexSourceSelectedDragAndDrop = nINDEX_SOURCE_NONE
		nIndexDestinationSelectedDragAndDrop = nINDEX_DEST_NONE
	}
}



custom_event[dvTpBoardroomTableMain,1,700]	// NFC tap
{
    stack_var char    cUid[40]

	// custom.text contains the unique ID from the NFC device
	cUid = custom.text

	cCurrentUserNfcUid = cUid

	if( cUid == cNfcUidTechPages )	// if the technical pages NFC card is used
	{
		fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameValidId)
		fnModeroSetPage(dvTpBoardroomTableMain, cPageNameTechPageDeviceStatus)
	}
	else if( !nRoomInUse )	// if  room is not in use
	{
		if( length_string(cRmsBookingIdCurrentMeeting) )	// if there a scheduled meeting is currently occuring
		{
			// compare ID from tap to ID database
			if( userExists(getUserIdFromNfcUid(cUid)) )
			{
				if( cUid == cRmsCurrentMeetingOrganizerNfcUid )	// if user is the one who booked the room
				{
					fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemWelcomeUserGreeting,nMODERO_BUTTON_STATE_ALL,"'Welcome, ',getUserName(getUserIdFromNfcUid(cUid)),'.'")
					fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorLeft, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
					fnModeroSetButtonBitmap (dvTpBoardroomTableSourceselect, nAdrDestinationSelectMonitorRight, nMODERO_BUTTON_STATE_ALL, 'icon-novideo.png')
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameValidId)
					fnModeroSetPage(dvTpBoardroomTableMain,'rmsSchedulingPage')
					fnModeroEnablePopup(dvTpBoardroomTableMain,cPopupNameVolumeControls)
					fnModeroEnablePopup(dvTpBoardroomTableMain,cPopupNameVcLightsHelpControls)
					ON[nRoomInUse]
				}
				else// if user is not the one who booked the room, display a warning popup
				{
					// popup message saying "only user who booked the room can use the room"
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameInvalidid)
					fnModeroEnablePopup(dvTpBoardroomTableMain,'TapOnMsgIncorrectUser')
				}
			}
			else
			{
				fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameInvalidid)
			}
		}
		else // there is no meeting current scheduled
		{
			// compare ID from tap to ID database
			if( userExists(getUserIdFromNfcUid(cUid)) )
			{
				if( (lnRmsMinutesUntilNextMeeting > 12) OR (lnRmsMinutesUntilNextMeeting == 0) )
				{
					nMinutesToBookAdHocMeetingFor = 10
					// display popup saying "creating Ad-hoc meeting"
					fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemWelcomeUserGreeting,nMODERO_BUTTON_STATE_ALL,"'Welcome, ',getUserName(getUserIdFromNfcUid(cUid)),'.'")
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameValidId)
					fnModeroEnablePopup(dvTpBoardroomTableMain,'TapOnMsgBookAdHocMeeting')
				}
				else if( lnRmsMinutesUntilNextMeeting > 7 )
				{
					nMinutesToBookAdHocMeetingFor = 5
					// display popup saying "creating quick Ad-hoc meeting"
					fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemWelcomeUserGreeting,nMODERO_BUTTON_STATE_ALL,"'Welcome, ',getUserName(getUserIdFromNfcUid(cUid)),'.'")
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameValidId)
					fnModeroEnablePopup(dvTpBoardroomTableMain,'TapOnMsgBook5MinuteAdHocMeeting')
				}
				else // lnRmsMinutesUntilNextMeeting < 7
				{
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameInvalidid)
					fnModeroEnablePopup(dvTpBoardroomTableMain,'TapOnMsgAdHocBookingsNotAllowedNextMeetingTooSoon')
				}
			}
			else
			{
				fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameInvalidid)
			}
		}
	}
	else	// room is in use
	{
		if( length_string(cRmsBookingIdCurrentMeeting) )	// if there a scheduled meeting is currently occuring
		{
			if( userExists(getUserIdFromNfcUid(cUid)) )
			{
				if( cUid == cRmsCurrentMeetingOrganizerNfcUid )	// if user is the one who booked the room
				{
					fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemWelcomeUserGreeting,nMODERO_BUTTON_STATE_ALL,"'Welcome, ',getUserName(getUserIdFromNfcUid(cUid)),'.'")
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameValidId)
					fnModeroSetPage(dvTpBoardroomTableMain,'rmsSchedulingPage')
					fnModeroEnablePopup(dvTpBoardroomTableMain,cPopupNameVolumeControls)
					fnModeroEnablePopup(dvTpBoardroomTableMain,cPopupNameVcLightsHelpControls)
				}
				else// if user is not the one who booked the room, display a warning popup
				{
					// popup message saying "only user who booked the room can use the room"
					fnPanelPlaySoundFile(dvTpBoardroomTableMain, cSoundFileNameInvalidid)
					fnModeroEnablePopup(dvTpBoardroomTableMain,'TapOnMsgIncorrectUser')
				}
			}
		}
	}
}



button_event[dvTpBoardroomTableMain,nBtnSystemPowerOffMonitors]
{
	push:
	{
		pulse[button.input]

		fnNecMonitorDisablePower(vdvMonitorLeft)
		fnNecMonitorDisablePower(vdvMonitorRight)
	}
}



button_event[dvIoPorts,nIoOccSensor]
{
	push:
	{
		ON[nOccupancyDetected]
		send_command vdvLight, "'LIGHTSYSTEMSTATE-',cLightAddressBoardroom,',ON'"
	}
	release:
	{
		OFF[nOccupancyDetected]
	}
}



button_event[dvTpBoardroomTableMain,nBtnSystemBookAdHocMeeting]
{
	push:
	{
		fnModeroSetButtonText(dvTpBoardroomTableMain,nAdrSystemCreatingBookingMsg,nMODERO_BUTTON_STATE_ALL,"'Booking meeting in Boardroom for ',getUserName(getUserIdFromNfcUid(cCurrentUserNfcUid)),'.'")

		RmsBookingCreate(LDATE,TIME,nMinutesToBookAdHocMeetingFor,getAdHocBookingSubject(getUserIdFromNfcUid(cCurrentUserNfcUid)),getAdHocBookingDetails(getUserIdFromNfcUid(cCurrentUserNfcUid)),29)

		fnModeroEnablePopup(dvTpBoardroomTableMain,'CreatingBooking')

		ON[nWaitingForCreateBookingResponse]
	}
}






//// Listener include files need to go at end of main program so that the symbols used by the
//// #define compiler directives in the main code are visible within the Listener include files.
INCLUDE 'DvxListener'
INCLUDE 'ModeroListener'






(***********************************************************)
(*            THE ACTUAL PROGRAM GOES BELOW                *)
(***********************************************************)
DEFINE_PROGRAM

// feedback for audio mute button
[dvTpBoardroomTableVolume,nBtnVolumeMuteToggle] = [dvDvxAudOutSpeakersFrontOfHouse,nDVX_CHANNEL_AUDIO_OUTPUT_VOLUME_MUTE]

// Feedback for audio source selection buttons
[dvTpBoardroomTableSourceselect, nBtnsAudioSelect[nINDEX_DEST_MONITOR_LEFT]] = (nIndexSourceAudioToFrontOfHouseSpeakers != nINDEX_SOURCE_NONE) AND (nIndexSourceAudioToFrontOfHouseSpeakers == nVideoRoutesSourceIndexes[nINDEX_DEST_MONITOR_LEFT])
[dvTpBoardroomTableSourceselect, nBtnsAudioSelect[nINDEX_DEST_MONITOR_RIGHT]] = (nIndexSourceAudioToFrontOfHouseSpeakers != nINDEX_SOURCE_NONE) AND (nIndexSourceAudioToFrontOfHouseSpeakers == nVideoRoutesSourceIndexes[nINDEX_DEST_MONITOR_RIGHT])

[dvTpBoardroomTableMain,30] = nVcMode

(***********************************************************)
(*                     END OF PROGRAM                      *)
(*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
(***********************************************************)

