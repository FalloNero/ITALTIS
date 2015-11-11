/*
	File: fn_fuelStationAddAction.sqf
	Author: MarioF
	
	Description:
	Adds the Action to Fueltrucks
*/

private["_vehicle"];

_vehicle = [_this,0,objNull] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};

_vehicle addAction["Andere Fahrzeuge betanken",life_fnc_fuelStationMenu,["FUELTRUCK",1],-1,false,false,"","vehicle player == player && !life_action_inUse && _target in life_vehicles"];