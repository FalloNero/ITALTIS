/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units","_unconscious"];
_markers = [];
_units = [];
_unconscious = 0;
sleep 0.25;
if(visibleMap) then {
	{
		_unconscious = _x getVariable "FAR_isUnconscious";				//FAR REVIVE
		_name = _x getVariable["realname",name player];
		_down = _x getVariable ["Revive",false];
		//if(!isNil "_name" && !_down) then {
		if(_unconscious == 1) then {
			_units pushBack _x;
		};
	} foreach playableUnits;

	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x getVariable["realname","Unknown Player"])];
		_markers pushBack _marker;
	} foreach _units;

	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};