PROGRAM_NAME='UI'


#INCLUDE 'RmsGuiApi';


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

// touch panel RMS location ID's
volatile integer rmsLocationBoardroom = 29;


define_module 'RmsClientGui_dr4_0_0' mdlRmsGui(vdvRmsGui, rmsTpRms, rmsTp);

define_module 'RmsClientGuiAux' mdlRmsGuiBoardroomAux(vdvRMS, dvBoardroomSchedulingTpRmsAux, dvBoardroomSchedulingTp, rmsLocationBoardroom);


define_event

data_event[vdvRmsGui] {

	online: {
		RmsSetInternalPanel(dvDemo1Tp, dvDemo1TpRms);

		RmsSetInternalPanel(dvDemo2Tp, dvDemo2TpRms);

		RmsSetExternalPanel(dvBoardroomSchedulingTp, dvBoardroomSchedulingTpRms);
	}

}
