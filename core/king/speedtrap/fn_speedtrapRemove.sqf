/*
	File: fn_speedtrapRemove.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/
private["_speedtrap"];

if!((playerSide == west) or (playerSide == east)) exitWith {};

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

deleteVehicle _speedtrap;

[true,"speedtrap",1] call life_fnc_handleInv;

diag_log format ["::King:: speedtrap id=%1 pos=%2 removed...", _speedtrap, position _speedtrap];
