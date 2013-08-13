PROGRAM_NAME='UI'


#INCLUDE 'RmsGuiApi';


define_variable

// touch panels for control from RMS client UI module
volatile dev rmsTp[] = {
	dvDemo1TpRms,
	dvDemo2TpRms,
	dvBoardroomSchedulingTpRms
};

// base TP addresses for rms client UI module usage
volatile dev rmsTpBase[] = {
	dvDemo1Tp,
	dvDemo2Tp,
	dvBoardroomSchedulingTp
};


define_module 'RmsClientGui_dr4_0_0' mdlRmsGui(vdvRmsGui, rmsTp, rmsTpBase);

define_module 'RmsClientGuiAux' mdlRmsGuiBoardroomAux(vdvRMS, dvBoardroomSchedulingTpRmsAux, dvBoardroomSchedulingTp);


define_event

data_event[vdvRmsGui] {

	online: {
		RmsSetInternalPanel(dvDemo1Tp, dvDemo1TpRms);

		RmsSetInternalPanel(dvDemo2Tp, dvDemo2TpRms);

		RmsSetExternalPanel(dvBoardroomSchedulingTp, dvBoardroomSchedulingTpRms);

		RmsSetDefaultEventBookingSubject('Ad-hoc booking');

		RmsSetDefaultEventBookingBody(' ');
	}

}
