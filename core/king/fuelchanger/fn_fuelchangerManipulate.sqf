/*
	File: fn_fuelchangerManipulate.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	manipulation of the vehicle
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_veh","_var_item","_value_item","_success","_manipulation"];
_veh = cursorTarget;
if(isNull _veh) exitwith {};
if(vehicle player != player) exitWith {hint "Hai mai provato a fare benzina all'interno del veicolo ? Se si sei un pirla";};
if((player distance _veh) > 5) exitwith {hint "Avvicinati al veicolo";};

_var_item = ["fuelManipulator",0] call life_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {};

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "Motorcycle")) then
{
    _success = [20, "Caricando il serbatoio", _veh] call life_fnc_progressWaitUntilFinished;
    if(!_success) exitWith {};

	_manipulation = _veh getVariable["king_fuel_manipulation_factor",0];
	if(_manipulation == 0) then
	{
		if(([false,"fuelManipulator",1] call life_fnc_handleInv)) then
		{
			_veh setVariable["king_fuel_manipulation_factor",100,true];
			hint "Il veicolo è stato modificato.Il veicolo ora consuma di più.";
		};
	}
	else
	{
		hint "Veicolo già modificato";
	};  
};