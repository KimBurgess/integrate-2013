PROGRAM_NAME='TvControl'


include 'SNAPI'


define_device

//vdvIpTv = 41001:1:0

define_constant


char cIpTvRxAddressBoardroom[] = '0016e88c24f5'

integer MENU_F1 = 250
integer MENU_RED = 251
integer MENU_GREEN = 252
integer MENU_BLUE = 253
integer MENU_YELLOW = 254
integer MENU_AMX = 255

define_function fnEmulateRxRemote(integer iRxIdx, integer iRemoteKey)
{
	switch (iRemoteKey)
	{
		case VOL_DN:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',VOL_DOWN'"
		case VOL_UP:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',VOL_UP'"
		case VOL_MUTE:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',MUTE'"
		
		case POWER:			send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',POWER'"
		
		case DIGIT_0:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_0'"
		case DIGIT_1:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_1'"
		case DIGIT_2:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_2'"
		case DIGIT_3:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_3'"
		case DIGIT_4:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_4'"
		case DIGIT_5:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_5'"
		case DIGIT_6:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_6'"
		case DIGIT_7:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_7'"
		case DIGIT_8:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_8'"
		case DIGIT_9:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',DIGIT_9'"
		
		case MENU_GUIDE:	send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',GUIDE'"
		case MENU_SELECT:	send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',SELECT'"
		case MENU_TOP_MENU:	send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',MENU'"
		case MENU_EXIT:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',EXIT'"
		case MENU_INFO:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',INFO'"
		case MENU_F1:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',F1'"
		
		case MENU_RED:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',RED'"
		case MENU_GREEN:	send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',GREEN'"
		case MENU_BLUE:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',BLUE'"
		case MENU_YELLOW:	send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',YELLOW'"
		
		case MENU_AMX:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',AMX'"
		
		case MENU_RT:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',NAV_RIGHT'"
		case MENU_LT:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',NAV_LEFT'"
		case MENU_DN:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',NAV_DOWN'"
		case MENU_UP:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',NAV_UP'"
		
		case CHAN_UP:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',CH_UP'"
		case CHAN_DN:		send_command vdvIptv, "'RXKEY-',itoa(iRxIdx),',CH_DOWN'"
	}
}

define_variable

volatile integer iIpTvNumOfRxUnits

volatile integer iIpTvRxIdxBoardroom

volatile char cIpTvRxAddresses[20][20]


define_module 'AMX_DIGITAL_TV_SERVER_dr1_0_0' mdlIpTv(vdvIptv, vdvIptv)


define_function fnIpTvSelectChannelNumber(integer iRxIdx, integer iChannelNum)
{
	send_command vdvIptv, "'RXCHANNELSELECTNUM-',itoa(iRxIdx),',',itoa(iChannelNum)"
}

define_function fnIpTvSelectChannelName(integer iRxIdx, char iChannelName[])
{
	send_command vdvIptv, "'RXCHANNELSELECTNAME-',itoa(iRxIdx),',',iChannelName"
}

define_event

data_event[vdvIptv]
{
    ONLINE:
    {
	SEND_COMMAND vdvIptv,"'PROPERTY-IP_Address,192.168.4.133'" //Change to the IP address of the Management Appliance
	SEND_COMMAND vdvIptv,"'PROPERTY-Port,2008'" //Leave as port 2008
	
	SEND_COMMAND vdvIptv,"'?RXCOUNT'"
    }
	command:
	{
		stack_var char cHeader[DUET_MAX_HDR_LEN]
		stack_var char cCmd[DUET_MAX_CMD_LEN]
		
		cHeader = DuetParseCmdHeader(data.text)
		cCmd = data.text
		
		SWITCH (cHeader)
        {
			CASE 'RXADDR' :
			{
				/*
					RXADDR-<ID>,<MacAddress>,<Name>
						<ID> : Index number
						<MacAddress> : Mac Address of the unit requested
						<Name> : Devices user given name
					"'RXADDR-1,001fd90000cb,Lobby'"
				*/
				stack_var integer iRxIdx
				stack_var char cRxMacAddress[DUET_MAX_CMD_LEN]
				stack_var char cRxName[DUET_MAX_CMD_LEN]
				
				iRxIdx = atoi(DuetParseCmdParam(cCmd))
				cRxMacAddress = DuetParseCmdParam(cCmd)
				cRxName = DuetParseCmdParam(cCmd)
				
				if(cRxMacAddress == cIpTvRxAddressBoardroom)
				{
					iIpTvRxIdxBoardroom = iRxIdx
				}
				
				break
			}	
			CASE 'TXADDR' :
			{
				DuetParseCmdParam(cCmd)
				break
			}	    
			case 'RXPASSBACK' :
			{
				break
			}
			
			case 'RXREMOTEPASSBACK':
			{
				break;
			}
			case 'RXCOUNT':
			{
				stack_var integer iIdx
				
				iIpTvNumOfRxUnits = atoi(DuetParseCmdParam(cCmd))
				
				for(iIdx = 1; iIdx <= iIpTvNumOfRxUnits; iIdx++)
				{
					send_command vdvIptv, "'?RXADDR-',itoa(iIdx)"
				}
				
				break;
			}
			case 'RXCHANNELCHANGE':
			{
				/*
					RXCHANNELCHANGE-<ID>,<CHNUM>,<CHNAME>,<Name>
						<ID> : Receiver Number
						<CHNUM> : Channel position
						<CHNAME> : Name of the channel
						<Name> : Devices user given name
					E.g: "'RXCHANNELCHANGE-1,4,19 DAVE,Lobby'"
				*/
				
				stack_var integer iRxIdx
				stack_var integer iChannelNum
				stack_var char cChannelName[DUET_MAX_CMD_LEN]
				stack_var char cRxName[DUET_MAX_CMD_LEN]
				
				
				iRxIdx = atoi(DuetParseCmdParam(cCmd))
				iChannelNum = atoi(DuetParseCmdParam(cCmd))
				cChannelName = DuetParseCmdParam(cCmd)
				cRxName = DuetParseCmdParam(cCmd)
				
				select
				{
					active (iIpTvRxIdxBoardroom == iRxIdx):
					{
						RmsAssetParameterSetValue(cIpTvRxAddressBoardroom, 'Channel', cChannelName)
					}
				}
				
				
				break;
			}
			case 'RXONLINE':
			{
				/*
					RXONLINE-<ID>,<MAC>,<Name>
						<ID> : Receiver Number
						<MAC> : Mac address of the unit
						<Name> : Devices user given name
						
					"'RXONLINE-1,000000000000,Lobby'"
				*/
				stack_var integer iRxIdx
				stack_var char cRxMacAddress[20]
				stack_var char cRxName[20]
				
				iRxIdx = atoi(DuetParseCmdParam(cCmd))
				cRxMacAddress = DuetParseCmdParam(cCmd)
				cRxName = DuetParseCmdParam(cCmd)
				
				if(cRxMacAddress == cIpTvRxAddressBoardroom)
				{
					iIpTvRxIdxBoardroom = iRxIdx
				}
			}
			case 'TXCOUNT':
			{
				break;
			}
			case 'DEBUG':
			{
				break;
			}	 
			case 'RXCONTMAIN':
			{
				break;
			}
		}
	}
}





