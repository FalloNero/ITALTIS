#include <macro.h>
/*
	File: fn_adminMarkers.sqf
	Sourced from Lystics Player Markers Loop
*/

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
life_markers = !life_markers;
if(life_markers) then {
	hint localize "STR_ANOTF_MEnabled";
	PlayerMarkers = [];
	FinishedLoop = false;
	while{life_markers} do {
		{
			{
				if !(_x in allUnits) then {
					deleteMarkerLocal str _x;
				};
			} forEach PlayerMarkers;
			PlayerMarkers = [];
			if(alive _x && isPlayer _x) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
				_pSee setMarkerColorLocal ("ColorRed");
				PlayerMarkers set [count PlayerMarkers,_x];
			};
		} forEach allUnits;
		sleep 1;
	};
	FinishedLoop = false;
} else {
	if(isNil "FinishedLoop") exitWith {};
	hint localize "STR_ANOTF_MDisabled";
	waitUntil{FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach PlayerMarkers;	
};