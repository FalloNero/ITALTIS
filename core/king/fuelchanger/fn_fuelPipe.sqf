/*
	File: fn_fuelPipe.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	pump fuel from a vehicle into an empty fuelcan
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_veh","_error","_fuel","_fuel_limit","_fuel_new"];
_veh = cursorTarget;

if(isNull _veh) exitwith {};
if(vehicle player != player) exitWith {hint "Devi essere fuori dal veicolo";};
if((player distance _veh) > 5) exitwith {hint "Devi essere più vicino al veicolo";};
if(!(_veh isKindOF "LandVehicle") && !(_veh isKindOf "Air") && !(_veh isKindOf "Ship")) exitWith {};

_error = false;

switch (true) do
{
	case (_veh isKindOF "LandVehicle"):
	{
		_fuel_limit = 0.5;
	};

	case (_veh isKindOf "Air"):
	{
		_fuel_limit = 0.2;
	};

	case (_veh isKindOf "Ship"):
	{
		_fuel_limit = 0.35;
	};
};

_var_item = ["fuelPipe",0] call life_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {hint "Non hai manette del carburante";};

_var_item = ["fuelE",0] call life_fnc_varHandle;
_value_item = missionNamespace getVariable _var_item;
if(_value_item <= 0) exitWith {hint "Nessun contenitore carburante";};

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if(isNull (driver _veh)) then
	{
		//Verifica se il veicolo è locale sul client
		if(!local _veh) then
		{
			//tenta di recuperare il veicolo locale dal client altrimenti ci attacchiamo
			[[_veh, player],"TON_fnc_setVehicleLocal",false,false] spawn life_fnc_MP;
			_success = [20, "Montando il tubo", _veh] call life_fnc_progressWaitUntilFinished;
			if(!_success) then
			{
				_error = true;
			};
			sleep 1;
		};
		
		if(!_error) then
		{
			_error = false;
			if(local _veh) then
			{
				_fuel = fuel _veh;
				if(_fuel >= _fuel_limit) then
				{
					_success = [20, "Pompa benzina", _veh] call life_fnc_progressWaitUntilFinished;
					if(_success) then
					{
						if(local _veh) then
						{
							//Nessuno è al posto del conducente
							//Contenitore carburante vuoto
							if(([false,"fuelE",1] call life_fnc_handleInv)) then
							{
								//Inserisci contenitore pieno
								if(([true,"fuelF",1] call life_fnc_handleInv)) then
								{
									//Rimuovi benzina dal veicolo
									_fuel_new = _fuel - _fuel_limit;
									if(_fuel_new < 0.1) then
									{
										//TOGLIE carburante alla vittima
										_fuel_new = 0.1;
									};
									_veh setfuel _fuel_new;
								}
								else
								{
									hint "Il tuo inventario è pieno.";
								};
							}
							else
							{
								hint "Non hai tanica di combustibile vuoto.";
							};
						}
						else
						{
							hint "Tubo caduto...";
						};						
					};
				}
				else
				{
					hint "Nel veicolo non c'è carburante";
				};
			}
			else
			{
				hint "Tubo caduto...";
			};
		};
	}
	else
	{
		hint "Il veicolo non è vuoto";
	};
};