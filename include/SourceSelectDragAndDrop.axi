PROGRAM_NAME='SourceSelectDragAndDrop'


DEFINE_TYPE

STRUCT _Boundary
{
    integer nLeft
    integer nTop
    integer nWidth
    integer nHeight
}


DEFINE_CONSTANT

/*integer nSOURCE_SELECT_DRAG_AND_DROP_POPUP_LEFT = 90
integer nSOURCE_SELECT_DRAG_AND_DROP_POPUP_TOP = 46
integer nSOURCE_SELECT_DRAG_AND_DROP_POPUP_WIDTH = 1740
integer nSOURCE_SELECT_DRAG_AND_DROP_POPUP_HEIGHT = 484*/

integer nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_LEFT = 286//(nSOURCE_SELECT_DRAG_AND_DROP_POPUP_LEFT + 196)
integer nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_TOP = 117//(nSOURCE_SELECT_DRAG_AND_DROP_POPUP_TOP + 71)
integer nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_WIDTH = 480
integer nDRAG_AND_DROP_DESTINATION_LEFT_MONITOR_HEIGHT = 270

integer nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_LEFT = 1151//(nSOURCE_SELECT_DRAG_AND_DROP_POPUP_LEFT + 1061)
integer nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_TOP = 117//(nSOURCE_SELECT_DRAG_AND_DROP_POPUP_TOP + 71)
integer nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_WIDTH = 480
integer nDRAG_AND_DROP_DESTINATION_RIGHT_MONITOR_HEIGHT = 270



integer nDRAG_AND_DROP_DESTINATION_OPTION_NONE = 0
integer nDRAG_AND_DROP_DESTINATION_OPTION_MONITOR_LEFT = 1
integer nDRAG_AND_DROP_DESTINATION_OPTION_MONITOR_RIGHT = 2



DEFINE_VARIABLE


_Boundary uUserTouchDragAndDropIcon
_Boundary uDragAndDropDestinationLeftMonitor
_Boundary uDragAndDropDestinationRightMonitor


volatile integer nDragAndDropDestinationSelected = nDRAG_AND_DROP_DESTINATION_OPTION_NONE

/// User Touch Coordinates
volatile integer nTouchCoordinatePressX
volatile integer nTouchCoordinatePressY
volatile integer nTouchCoordinateMoveX
volatile integer nTouchCoordinateMoveY
volatile integer nTouchCoordinateReleaseX
volatile integer nTouchCoordinateReleaseY


char cImageNameDragIcon[100] = 'Green Ring.png'
integer nDragIconWidth = 142
integer nDragIconHeight = 77












define_function integer fnCheckForCollision (_Boundary uBoundaryA, _Boundary uBoundaryB)
{
    // grab X/Y coordinate of center point of each boundary.
    // for each boundary, check if its X coordinate is within the range of the other boundaries' space on the X plane
    // for each boundary, check if its X coordinat is within the range of the other boundaries' space on the Y plane

    stack_var integer nBoundaryA_CenterCoordX
    stack_var integer nBoundaryA_CenterCoordY
    stack_var integer nBoundaryB_CenterCoordX
    stack_var integer nBoundaryB_CenterCoordY
    
    
    nBoundaryA_CenterCoordX = (uBoundaryA.nLeft + (uBoundaryA.nWidth/2))
    nBoundaryA_CenterCoordY = (uBoundaryA.nTop + (uBoundaryA.nHeight/2))
    
    nBoundaryB_CenterCoordX = (uBoundaryB.nLeft + (uBoundaryB.nWidth/2))
    nBoundaryB_CenterCoordY = (uBoundaryB.nTop + (uBoundaryB.nHeight/2))
    
    
    // check if boundary A's X/Y coordinates fall within boundary B's area
    if ( ( (nBoundaryA_CenterCoordX >= uBoundaryB.nLeft) AND (nBoundaryA_CenterCoordX <= (uBoundaryB.nLeft + uBoundaryB.nWidth)) ) AND
         ( (nBoundaryA_CenterCoordY >= uBoundaryB.nTop)  AND (nBoundaryA_CenterCoordY <= (uBoundaryB.nTop + uBoundaryB.nHeight))  ) )
    {
	return true
    }
    
    // check if boundary B's X/Y coordinates fall within boundary A's area
    if ( ( (nBoundaryB_CenterCoordX >= uBoundaryA.nLeft) AND (nBoundaryB_CenterCoordX <= (uBoundaryA.nLeft + uBoundaryA.nWidth)) ) AND
         ( (nBoundaryB_CenterCoordY >= uBoundaryA.nTop)  AND (nBoundaryB_CenterCoordY  <= (uBoundaryA.nTop + uBoundaryA.nHeight))  ) )
    {
	return true
    }
    
    return false
}





define_function fnUpdateUserTouchCoordinates (integer nX, integer nY)
{
    //fnUpdateUserTouchIconCoordinates ( (nX - (uUserTouchDragAndDropIcon.nWidth/2) - nSOURCE_SELECT_DRAG_AND_DROP_POPUP_LEFT), (nY - (uUserTouchDragAndDropIcon.nHeight/2) - nSOURCE_SELECT_DRAG_AND_DROP_POPUP_TOP) )
    fnUpdateUserTouchIconCoordinates ( (nX - (uUserTouchDragAndDropIcon.nWidth/2)), (nY - (uUserTouchDragAndDropIcon.nHeight/2)) )
    
}


define_function fnUpdateUserTouchIconCoordinates (integer nLeft, integer nTop)
{
    uUserTouchDragAndDropIcon.nLeft = nLeft
    uUserTouchDragAndDropIcon.nTop = nTop
}

define_function fnUpdateUserTouchIconSize (integer nWidth, integer nHeight)
{
    uUserTouchDragAndDropIcon.nWidth = nWidth
    uUserTouchDragAndDropIcon.nHeight = nHeight
}

define_function integer fnGetUserTouchIconLeft ()
{
    return uUserTouchDragAndDropIcon.nLeft
}

define_function integer fnGetUserTouchIconTop ()
{
    return uUserTouchDragAndDropIcon.nTop
}

define_function integer fnGetUserTouchIconWidth ()
{
    return uUserTouchDragAndDropIcon.nWidth
}



define_function integer fnGetUserTouchIconHeight ()
{
    return uUserTouchDragAndDropIcon.nHeight
}


























