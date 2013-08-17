PROGRAM_NAME='NfcListener'


#IF_NOT_DEFINED __NFC_LISTENER__
#DEFINE __NFC_LISTENER__


define_constant

// Touch panel custom event addresses
TP_CUSTOM_EVENT_NFC = 1

// NFC custom events
NFC_EVENT_TAG_READ = 700;

// NFC tag types
NFC_TAG_TYPE_ISO15693 = 1;
NFC_TAG_TYPE_ISO14443A = 2;
NFC_TAG_TYPE_ISO14443B = 3;
NFC_TAG_TYPE_FELICA = 4;

// NFC data payloads
NFC_DATA_TYPE_UID = 0;
NFC_DATA_TYPE_CARD_DATA = 1;

/*

/**
 * Called when a NFC tag is read.
 */
// #DEFINE INCLUDE_NFC_TAG_READ_CALLBACK
define_function NfcTagRead(integer tagType, char uid[], integer uidLength) {}

*/



define_event

#IF_DEFINED INCLUDE_NFC_TAG_READ_CALLBACK
custom_event[dvTp.number:1:dvTp.system,
		TP_CUSTOM_EVENT_NFC,
		NFC_EVENT_TAG_READ] {
	stack_var integer tagType;
	stack_var integer dataType; 
	stack_var integer dataLength;

	tagType = type_cast(custom.value1);
	dataType = type_cast(custom.value2);
	dataLength = type_cast(custom.value3);

	switch (dataType) {
		case NFC_DATA_TYPE_UID:{
			NfcTagRead(tagType, custom.text, dataLength);
		}
		case NFC_DATA_TYPE_CARD_DATA: {
			// not implemented in current firmware
		}
	}
	
}
#END_IF


#END_IF // __NFC_LISTENER__
