/*
	File: fn_useFuelStation.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	uses the fuelstation
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

private["_veh","_veh_type","_fuelstation","_fuel_old","_fuel_new","_fuel_price","_steps","_spent_money","_fuel_min_distance"];
_fuel_price = 200;
_steps = 100.0;
_fuel_min_distance = 7;
_fuel_price_one_step = _fuel_price / _steps;

while {true} do
{
	waitUntil {sleep 1; ((vehicle player != player) && ((driver (vehicle player)) == player) && (fuel (vehicle player)) < 0.99 && (speed (vehicle player)) < 0.1 && count (nearestObjects [player, ["Land_fs_feed_F","Land_FuelStation_Feed_F"], _fuel_min_distance]) > 0)};
	hint format["Distributore di benzina trovata.Resta fermo in modo che possano rifornirti. (Costo Un pieno € %1)",_fuel_price];
	_veh = vehicle player;
	_veh_type = typeof _veh;
	
	//clean the fuelstation to prevent automatic refuel
	_fuelstation = (nearestObjects [player, ["Land_fs_feed_F","Land_FuelStation_Feed_F"], _fuel_min_distance]) select 0;
	
	sleep 1;
	_spent_money = 0;
	
	while {true} do
	{
		if(vehicle player == player) exitWith {};
		if((driver (vehicle player)) != player) exitWith {};
		if((fuel (vehicle player)) >= 0.99) exitWith {};
		if((speed (vehicle player)) > 0.1) exitWith {};
		if(!(alive (vehicle player))) exitWith {};
		if((player distance _fuelstation) > _fuel_min_distance) exitWith {};
		if(life_atmcash < _fuel_price_one_step) exitWith {hint "Non hai abbastanza soldi"; sleep 1;};

		_fuel_old = fuel _veh;
		_fuel_new = _fuel_old + (1 / _steps);
		_veh setFuel _fuel_new;
		
		life_atmcash = life_atmcash - _fuel_price_one_step;
		_spent_money = _spent_money + _fuel_price_one_step;
		
		hintSilent format["Rifornimento:\n%1%2 €%3", ceil (_fuel_new * 100), "%", _spent_money];
		
		sleep 0.5;
	};

	[1,false] call SOCK_fnc_updateRequest;
};