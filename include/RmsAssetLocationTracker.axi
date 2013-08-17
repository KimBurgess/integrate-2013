PROGRAM_NAME='assetLocationTracker'


#IF_DEFINED __ASSET_LOCATION_TRACKER__
#WARN 'AssetLocationTracker already in use for this scope'
#ELSE
#DEFINE __ASSET_LOCATION_TRACKER__


#DEFINE INCLUDE_RMS_EVENT_ASSET_REGISTERED_CALLBACK
#DEFINE INCLUDE_RMS_EVENT_ASSET_RELOCATED_CALLBACK
#DEFINE INCLUDE_RMS_EVENT_ASSET_LOCATION_CALLBACK


#INCLUDE 'RmsExtendedApi'
#INCLUDE 'RmsExtendedEventListener'


define_type

structure assetLocationnTracker {
	long locationId;
	char assetClientKey[50];
}

define_variable

volatile assetLocationnTracker locationTracker;


/**
 * Sets the client key to track.
 *
 * @param	assetClientKey	a string continating the asset client key of the
 *							asset to track
 */
define_function setLocationTrackerAsset(char assetClientKey[]) {
	locationTracker.assetClientKey = assetClientKey;
	RmsAssetLocationRequest(locationTracker.assetClientKey)
}


// RMS callbacks

define_function RmsEventAssetRegistered(char registeredAssetClientKey[],
		long assetId,
		char newAssetRegistration) {
	if (registeredAssetClientKey == locationTracker.assetClientKey) {
		RmsAssetLocationRequest(locationTracker.assetClientKey)
	}
}

define_function RmsEventAssetRelocated(char assetClientKey[],
		long assetId,
		long newLocationId) {
	if (assetClientKey == locationTracker.assetClientKey) {
		locationTracker.locationId = newLocationId;
	}
}

define_function RmsEventAssetLocation(char assetClientKey[], RmsLocation location) {
	/*if (assetClientKey == locatioTracker.assetClientKey) {
		uiLocation.id = location.id;
	}*/
	#WARN 'As we cannot currently associate an ?ASSET.LOCATION response with a device this is a hard coded hack'
	locationTracker.locationId = initialLocation;
}


#END_IF // __ASSET_LOCATION_TRACKER__
