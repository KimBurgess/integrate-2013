PROGRAM_NAME='SonyEvid100CameraControl'



define_device

//vdvCamera = 33001;1:0
//dvCamera = 5001:1:0







define_module 'Sony_EVID100_Comm_dr1_0_0' mCamDev1(vdvCamera, dvCamera)




define_function fnCameraEnableTiltUp(dev vdvCam)
{
	ON[vdvCam, TILT_UP]
}

define_function fnCameraDisableTiltUp(dev vdvCam)
{
	OFF[vdvCam, TILT_UP]
}

define_function fnCameraEnableTiltDown(dev vdvCam)
{
	ON[vdvCam, TILT_DN]
}

define_function fnCameraDisableTiltDown(dev vdvCam)
{
	OFF[vdvCam, TILT_DN]
}




define_function fnCameraEnablePanLeft(dev vdvCam)
{
	ON[vdvCam, PAN_LT]
}

define_function fnCameraDisablePanLeft(dev vdvCam)
{
	OFF[vdvCam, PAN_LT]
}

define_function fnCameraEnablePanRight(dev vdvCam)
{
	ON[vdvCam, PAN_RT]
}

define_function fnCameraDisablePanRight(dev vdvCam)
{
	OFF[vdvCam, PAN_RT]
}






define_function fnCameraEnableZoomOut(dev vdvCam)
{
	ON[vdvCam, ZOOM_OUT]
}

define_function fnCameraDisableZoomOut(dev vdvCam)
{
	OFF[vdvCam, ZOOM_OUT]
}

define_function fnCameraEnableZoomIn(dev vdvCam)
{
	ON[vdvCam, ZOOM_IN]
}

define_function fnCameraDisableZoomIn(dev vdvCam)
{
	OFF[vdvCam, ZOOM_IN]
}




define_function fnCameraEnableFocusNear(dev vdvCam)
{
	ON[vdvCam, FOCUS_NEAR]
}

define_function fnCameraDisableFocusNear(dev vdvCam)
{
	OFF[vdvCam, FOCUS_NEAR]
}

define_function fnCameraEnableFocusFar(dev vdvCam)
{
	ON[vdvCam, FOCUS_FAR]
}

define_function fnCameraDisableFocusFar(dev vdvCam)
{
	OFF[vdvCam, FOCUS_FAR]
}






















































