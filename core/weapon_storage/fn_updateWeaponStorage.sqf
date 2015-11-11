#include "macro.hpp"
/*
	File: fn_updateWeaponStorage.sqf
	Author: Mario2002
	
	Description:
	updated the weapon storage menu list
*/
private["_house", "_weaponStorage", "_filter", "_display", "_storageList", "_gearList", "_cargo", "_length", "_name", "_amount", "_left"];
//waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

_filter = _this select 0;
_house = cursorTarget;

_display = findDisplay 8700;
_storageList = _display displayCtrl 8715;
_gearList = _display displayCtrl 8716;
_weaponStorage = _house getVariable ["weapon_storage", [[[],[]],[[],[]],[[],[]],[[],[]]]];

if (count (_weaponStorage) == 0) then {
    _house setVariable ["weapon_storage", [[[],[]],[[],[]],[[],[]],[[],[]]], true];
    _weaponStorage = [[[],[]],[[],[]],[[],[]],[[],[]]];
};

_houseCfg = [_house] call life_fnc_housingCfg;
_weight = [_weaponStorage] call life_fnc_calcUsedStorage;
ctrlSetText[8720, format["%1 / %2", _weight, (_houseCfg select 1)]];

lbClear 8715;

switch (_filter) do {
    
    case "weapons" : {
    	
        _cargo = _weaponStorage select 0;
        _length = count (_cargo select 0);
		
		for [{_i = 0},{_i < _length},{_i = _i + 1}] do {		    
		    _name = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "displayName");
            _picture = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "picture");
		    _amount = (_cargo select 1) select _i;
	        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
			_storageList lbSetValue [_index, _amount];
            _storageList lbSetData [_index, (_cargo select 0) select _i];
            _storageList lbSetPicture [_index, _picture];
		};        
    };
    
    case "magazines" : {
        
    	_cargo = _weaponStorage select 1;
        _length = count (_cargo select 0);
		
		for [{_i = 0},{_i < _length},{_i = _i + 1}] do {		    
		    _name = getText(configFile >> "CfgMagazines" >> (_cargo select 0) select _i >> "displayName");
            _picture = getText(configFile >> "CfgMagazines" >> (_cargo select 0) select _i >> "picture");
		    _amount = (_cargo select 1) select _i;
	        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
			_storageList lbSetValue [_index, _amount];
            _storageList lbSetData [_index, (_cargo select 0) select _i];
            _storageList lbSetPicture [_index, _picture];
		};
    };
    
    case "items" : {
        
    	_cargo = _weaponStorage select 2;
        _length = count (_cargo select 0);
		
		for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
            
            _name = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "displayName");
        	_picture = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "picture");
            	    
            _amount = (_cargo select 1) select _i;
	        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
			_storageList lbSetValue [_index, _amount];
            _storageList lbSetData [_index, (_cargo select 0) select _i];
            _storageList lbSetPicture [_index, _picture];
		};
    };
    
    case "backpacks" : {
        
    	_cargo = _weaponStorage select 3;
        _length = count (_cargo select 0);
		
		for [{_i = 0},{_i < _length},{_i = _i + 1}] do {		    
		    _name = getText(configFile >> "CfgVehicles" >> (_cargo select 0) select _i >> "displayName");
            _picture = getText(configFile >> "CfgVehicles" >> (_cargo select 0) select _i >> "picture");
		    _amount = (_cargo select 1) select _i;
	        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
			_storageList lbSetValue [_index, _amount];
            _storageList lbSetData [_index, (_cargo select 0) select _i];
            _storageList lbSetPicture [_index, _picture];
		};
        
        _cargo = _weaponStorage select 2;
        _length = count (_cargo select 0);
        
        for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
            
            _superClass = [(_cargo select 0) select _i, "CfgWeapons"] call life_fnc_getItemSuperClass;
            if (_superClass == "Uniform_Base" || _superClass == "Vest_Camo_Base" || _superClass == "Vest_NoCamo_Base") then {		    
			    _name = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "displayName");
	            _picture = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "picture");
			    _amount = (_cargo select 1) select _i;
		        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
				_storageList lbSetValue [_index, _amount];
	            _storageList lbSetData [_index, (_cargo select 0) select _i];
	            _storageList lbSetPicture [_index, _picture];
            };
		};
    };
    
    case "primary" : {        
    	
		if (primaryWeapon player != "") then {            
        
	        _acc_p = getArray(configFile >> "CfgWeapons" >> primaryWeapon player >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			_acc_o = getArray(configFile >> "CfgWeapons" >> primaryWeapon player >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			_acc_m = getArray(configFile >> "CfgWeapons" >> primaryWeapon player >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	        
	        _cargo = _weaponStorage select 2;
	        _length = count (_cargo select 0);    
			
	        for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
	            	
	        	if (((_cargo select 0) select _i) in _acc_p || ((_cargo select 0) select _i) in _acc_o || ((_cargo select 0) select _i) in _acc_m) then {
		            
	                _name = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "displayName");
		            _picture = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "picture");
				    _amount = (_cargo select 1) select _i;
			        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
					_storageList lbSetValue [_index, _amount];
		            _storageList lbSetData [_index, (_cargo select 0) select _i];
		            _storageList lbSetPicture [_index, _picture];    
	            };		    
			};
        };
    };
    
    case "handgun" : {        
    	
		if (handgunWeapon player != "") then {            
        
	        _acc_p = getArray(configFile >> "CfgWeapons" >> handgunWeapon player >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			_acc_o = getArray(configFile >> "CfgWeapons" >> handgunWeapon player >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			_acc_m = getArray(configFile >> "CfgWeapons" >> handgunWeapon player >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	        
	        _cargo = _weaponStorage select 2;
	        _length = count (_cargo select 0);    
			
	        for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
	            	
	        	if (((_cargo select 0) select _i) in _acc_p || ((_cargo select 0) select _i) in _acc_o || ((_cargo select 0) select _i) in _acc_m) then {
		            
	                _name = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "displayName");
		            _picture = getText(configFile >> "CfgWeapons" >> (_cargo select 0) select _i >> "picture");
				    _amount = (_cargo select 1) select _i;
			        _index = _storageList lbAdd format ["[%1] %2", _amount, _name];
					_storageList lbSetValue [_index, _amount];
		            _storageList lbSetData [_index, (_cargo select 0) select _i];
		            _storageList lbSetPicture [_index, _picture];    
	            };		    
			};
        };
    };
};





