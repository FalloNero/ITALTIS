private["_vehicles","_pUID"];
sleep 15;

_vehicles = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
_name = name player;
_uid = getPlayerUID player;

{
	_owners = _x getVariable ["vehicle_info_owners",[]];
	_index = [_uid,_owners] call TON_fnc_index;

	if(!(_index == -1)) then {
		life_vehicles pushBack _x;
	};
} foreach _vehicles;

hint format ["Chiavi veicoli caricate"];

