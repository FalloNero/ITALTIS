#include "macro.hpp"
/*
	File: fn_calcUsedStorage.sqf
	Author: Mario2002
	
	Description:
	
*/
private["_house", "_weaponStorage", "_filter", "_display", "_storageList", "_gearList", "_cargo", "_length", "_name", "_amount"];
//waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

_storage = _this select 0;
_weight = 0;
_weaponStorage = (_storage select 0);
_magazineStorage = (_storage select 1);
_itemStorage = (_storage select 2);
_backpackStorage = (_storage select 3);

_length = count (_weaponStorage select 0);

for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
	
    _w = getNumber (configFile >> "CfgWeapons" >> (_weaponStorage select 0) select _i >> "WeaponSlotsInfo" >> "mass");
    //diag_log format ["%1 : %2", (_weaponStorage select 0) select _i, _w];
    _weight = _weight + (_w * ((_weaponStorage select 1) select _i));
};

_length = count (_magazineStorage select 0);

for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
	
    _w = getNumber (configFile >> "CfgMagazines" >> (_magazineStorage select 0) select _i >> "mass");
    //diag_log format ["%1 : %2", (_magazineStorage select 0) select _i, _w];
    _weight = _weight + (_w * ((_magazineStorage select 1) select _i));
};

_length = count (_itemStorage select 0);

for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
	
    _w = getNumber (configFile >> "CfgWeapons" >> (_itemStorage select 0) select _i >> "ItemInfo" >> "mass");
    //diag_log format ["%1 : %2", (_itemStorage select 0) select _i, _w];
    _weight = _weight + (_w * ((_itemStorage select 1) select _i));
};

_length = count (_backpackStorage select 0);

for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
	
    _w = getNumber (configFile >> "CfgVehicles" >> (_backpackStorage select 0) select _i >> "mass");
    //diag_log format ["%1 : %2", (_backpackStorage select 0) select _i, _w];
    _weight = _weight + (_w * ((_backpackStorage select 1) select _i));
};

_weight;









