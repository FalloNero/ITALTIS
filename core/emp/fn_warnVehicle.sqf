/*
	File: warnVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "AVVERTIMENTO IN CORSO"; };
	nn_empInUse = true;
	((findDisplay 3494) displayCtrl 2030) ctrlSetText "IN CORSO";
	((findDisplay 3494) displayCtrl 2070) ctrlEnable false;
	((findDisplay 3494) displayCtrl 2060) ctrlEnable false;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	[[_vehicle], "life_fnc_vehicleWarned",crew _vehicle,false] spawn life_fnc_MP;
	sleep 10;
	nn_empInUse = false;
	((findDisplay 3494) displayCtrl 2070) ctrlEnable true;
	((findDisplay 3494) displayCtrl 2060) ctrlEnable true;
	((findDisplay 3494) displayCtrl 2030) ctrlSetText "PRONTO";
};