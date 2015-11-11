/*
	File: empVehicles.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_index","_vehicle","_CD"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { hint "EMP IN RICARICA"; };
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[[_vehicle], "life_fnc_vehicleEmpd",crew _vehicle,false] spawn life_fnc_MP;
	_CD = time + (1 * 60) ;
	((findDisplay 3494) displayCtrl 2070) ctrlEnable false;
	((findDisplay 3494) displayCtrl 2060) ctrlEnable false;
	waitUntil {((findDisplay 3494) displayCtrl 2030) ctrlSetText format["%1",[(_CD - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_CD - time) <= 0};
	nn_empInUse = false;
	((findDisplay 3494) displayCtrl 2070) ctrlEnable true;
	((findDisplay 3494) displayCtrl 2060) ctrlEnable true;
	((findDisplay 3494) displayCtrl 2030) ctrlSetText "PRONTO";
};
