/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,0,[0]] call BIS_fnc_param;

_spCfg = [playerSide] call life_fnc_spawnPointCfg;
_sp = _spCfg select _selection;
[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];

/* Per il video di ingresso
[] spawn {
			//scriptName "initMission.hpp: mission start";
			["rsc\ARMA_3.ogv", false] spawn BIS_fnc_titlecard;	
			//waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
			//[[2879.289,5618.516,0],"Alpha and Bravo have been engaged by hostile forces, provide backup"] spawn BIS_fnc_establishingShot;	
			//OR , The above is a bit more user friendly and easier to control.
			//[getPos orbit1,"Alpha and Bravo have been engaged by hostile forces, provide backup",300,200,180,0,[]] spawn BIS_fnc_establishingShot;   
		};
*/