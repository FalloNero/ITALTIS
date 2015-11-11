/*
	File: fn_speedtrapAdd.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/
if(isNil "king_speedtrap") then {king_speedtrap = ObjNull;};

private["_speedtrap","_var_speedtrap","_value_speedtrap"];

if!((playerSide == west) or (playerSide == east)) exitWith {hint "Non hai le capacità tecniche di montarlo";};
if(vehicle player != player) exitWith {hint "Impossibile montare autovelox dentro un veicolo";};
if(!isNull king_speedtrap) exitWith {hint "Ne hai uno in mano -.-";};

_var_speedtrap = ["speedtrap",0] call life_fnc_varHandle;
_value_speedtrap = missionNamespace getVariable _var_speedtrap;
if(_value_speedtrap <= 0) exitWith {};

_speedtrap = "Land_Runway_PAPI_4" createVehicle (position player);
_speedtrap setpos  (player modelToWorld [0,1,0]);
_speedtrap setDir ([_speedtrap, player] call BIS_fnc_dirTo);
_speedtrap allowdamage false;
_speedtrap attachTo[player,[0,1.5,0.5]];
_speedtrap setDir 180;

life_action_speedtrapDeploy = player addAction["Posizione autovelox",{if(!isNull king_speedtrap) then {detach king_speedtrap; king_speedtrap = ObjNull;}; player removeAction life_action_speedtrapDeploy; life_action_speedtrapDeploy = nil;},"",999,false,false,"",'!isNull king_speedtrap'];
king_speedtrap = _speedtrap;
waitUntil {isNull king_speedtrap};
if(!isNil "life_action_speedtrapDeploy") then {player removeAction life_action_speedtrapDeploy;};
if(isNull _speedtrap) exitWith {};
_speedtrap setPos [(getPos _speedtrap select 0),(getPos _speedtrap select 1),0];

_speedtrap setVariable ["speedtrap_registered", true, true];
_speedtrap setVariable ["speedtrap_active", true, true];
_speedtrap setVariable ["speedtrap_speedlimit", 50, true];
_speedtrap setVariable ["speedtrap_photos", [], true];

if(!([false,"speedtrap",1] call life_fnc_handleInv)) exitWith
{
    deleteVehicle _speedtrap;
};

[["", _speedtrap, "Radarfalle", 9999999],"king_fnc_addTrackingInfosToPlayers",west,false] spawn life_fnc_MP;
[["", _speedtrap, "Radarfalle", 9999999],"king_fnc_addTrackingInfosToPlayers",east,false] spawn life_fnc_MP;
diag_log format ["::King:: speedtrap id=%1 pos=%2 add...", _speedtrap, position _speedtrap];
