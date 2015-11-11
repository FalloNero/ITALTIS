/*
	File: fn_initFuelstations.sqf
	Author: MarioF
	
	Description:
	Emtpy the Fuelstations and add the Refill action
*/

private["_stations"];

waitUntil{!isNil "life_fuelstation_stationlist"};
sleep 1;

{
	_x setFuelCargo 0;
	if((typeOf _x) == "Land_fs_feed_F") then {
		_x addAction["Auftanken",life_fnc_fuelStationMenu,["CAR",1],0,false,false,"","vehicle player == player && !life_action_inUse"];
	};
} foreach life_fuelstation_stationlist;

// Init all existing Fueltrucks as well
{
	if((typeOf _x) in life_fuelstation_cfgTrucks) then {
		_x addAction["Andere Fahrzeuge betanken",life_fnc_fuelStationMenu,["FUELTRUCK",1],-1,false,false,"","vehicle player == player && !life_action_inUse && _target in life_vehicles"];
	};
} foreach vehicles;