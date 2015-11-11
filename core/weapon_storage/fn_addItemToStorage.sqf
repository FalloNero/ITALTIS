#include "macro.hpp"
/*
	File: fn_addItem.sqf
	Author: Mario2002
	
	Description:
	adds an item to a player's backpack
*/
private["_house", "_weaponStorage", "_houseCfg", "_weaponCargo", "_magazineCargo", "_itemCargo", "_backpackCargo"];
waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

if (isNil "WS_filter") exitWith {diag_log "invalid filter"};

diag_log format ["Filter : %1", WS_filter];

_house = cursorTarget;
_display = findDisplay 8700;
_storageList = _display displayCtrl 8715;
_gearList = _display displayCtrl 8716;

_index = lbCurSel _storageList;
if (_index == -1) exitWith {hint "Select an item!"};

_storage = _house getVariable ["weapon_storage", [[], [], [], []]];
_containers = _house getVariable ["containers", []];

if (count (_containers) == 0) exitWith {hint "No Weaponstorage!"};
if (count (_storage) == 0) then {
    _house setVariable ["weapon_storage", [[[],[]],[[],[]],[[],[]],[[],[]]], true];
    _storage = [[[],[]],[[],[]],[[],[]],[[],[]]];
};

_weaponStorage = (_storage select 0);
_magazineStorage = (_storage select 1);
_itemStorage = (_storage select 2);
_backpackStorage = (_storage select 3);
_className = _storageList lbData _index;
diag_log format ["_className : %1", _className];

switch (WS_filter select 0) do {
    
    case "weapons" : {          	
        
        _baseClass = [_className, "CfgWeapons"] call life_fnc_getBaseClass;
           
        if ((primaryWeapon player == "" && _baseClass == "RifleCore") || (handgunWeapon player == "" && _baseClass == "PistolCore") || (binocular player == "" && _baseClass == "Binocular")) then {
            player addWeapon _className;
        	_weaponStorage = ["remove", _weaponStorage, _className] call life_fnc_updateStorageData;
        } 
        else {
            
            hint "This weaponslot is already in use!";
        };       
    };
    
    case "magazines" : {        
    	
        if(backpack player != "") then {
		        
	        _mass = getNumber(configFile >> "CfgMagazines" >> _className >> "mass");
	        _massBP = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumLoad");
	        
	        if((loadBackpack player + _mass) <= _massBP) then {
	        	(unitBackpack player) addMagazineCargo [_className, 1];
	            _magazineStorage = ["remove", _magazineStorage, _className] call life_fnc_updateStorageData;
	        }
	        else {
	            hint "This item doesnt fit into your backpack!";
	        };     
        } else {
            hint "Get a backpack first!";
        };     
    };       
    
    case "items" : {        
    	
        if(backpack player != "") then {
	       	
            _mass = getNumber(configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "mass");	                    
	        _massBP = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumLoad");
	        
	        if((loadBackpack player + _mass) <= _massBP) then {
	        	(unitBackpack player) addItemCargo [_className, 1];
	            _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;
	        }
	        else {
	            hint "This item doesnt fit into your backpack!";
	        };     
        } else {
            hint "Get a backpack first!";
        }; 
    };      
    
    case "backpacks" : {        
    		        
        _mass = getNumber(configFile >> "CfgVehicles" >> _className >> "mass");
        _massBP = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumLoad");
        
        _superClass = [_className, "CfgWeapons"] call life_fnc_getItemSuperClass;
        diag_log format ["_superClass : %1", _superClass];
        
        if(uniform player == "" && _superClass == "Uniform_Base") then {
        	player addUniform _className;
            _backpackStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;
        }
        else {
            hint "You already wearing an uniform!";
        };  
        if((vest player == "" && _superClass == "Vest_Camo_Base") || (vest player == "" && _superClass == "Vest_NoCamo_Base")) then {
        	player addVest _className;
            _backpackStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;
        }
        else {
            hint "You already wearing a vest!";
        };  
        _superClass = [_className, "CfgVehicles"] call life_fnc_getItemSuperClass;      
        if(backpack player == "" && _superClass == "Bag_Base") then {
        	player addBackpack _className;
            _backpackStorage = ["remove", _backpackStorage, _className] call life_fnc_updateStorageData;
        }
        else {
            hint "You already wearing a backpack!";
        };      
    }; 
    
    case "primary" : {        
    	
		if (primaryWeapon player != "") then {            
        	
            _acc_m = getArray(configFile >> "CfgWeapons" >> primaryWeapon player >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	        _acc_p = getArray(configFile >> "CfgWeapons" >> primaryWeapon player >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");			
            _acc_o = getArray(configFile >> "CfgWeapons" >> primaryWeapon player >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
	        _weaponItems = primaryWeaponItems player;
            
            if ((_weaponItems select 0) == "" && (_className in _acc_m)) then {	    
                player addPrimaryWeaponItem _className;
                _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;	                
            };
            if ((_weaponItems select 1) == "" && (_className in _acc_p)) then {	    
                player addPrimaryWeaponItem _className;
                _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;	                
            };
            if ((_weaponItems select 2) == "" && (_className in _acc_o)) then {	    
                player addPrimaryWeaponItem _className;
                _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;	                
            };	        
        };
    };
    
    case "handgun" : {        
    	
		if (handgunWeapon player != "") then {            
        
	        _acc_p = getArray(configFile >> "CfgWeapons" >> handgunWeapon player >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			_acc_o = getArray(configFile >> "CfgWeapons" >> handgunWeapon player >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			_acc_m = getArray(configFile >> "CfgWeapons" >> handgunWeapon player >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	        _weaponItems = handgunItems player;            
            
            if ((_weaponItems select 0) == "" && (_className in _acc_m)) then {	    
                player addHandgunItem _className;
                _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;	                
            };
            if ((_weaponItems select 1) == "" && (_className in _acc_p)) then {	    
                player addHandgunItem _className;
                _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;	                
            };
            if ((_weaponItems select 2) == "" && (_className in _acc_o)) then {	    
                player addHandgunItem _className;
                _itemStorage = ["remove", _itemStorage, _className] call life_fnc_updateStorageData;	                
            };	        
        };
    };
};

[] call life_fnc_updateLoad;

[(WS_filter select 0)] call life_fnc_updateWeaponStorage;
[(WS_filter select 1)] call life_fnc_updatePlayerGear;

_house setVariable ["weapon_storage", [_weaponStorage, _magazineStorage, _itemStorage, _backpackStorage], true];
[[_house, [_weaponStorage, _magazineStorage, _itemStorage, _backpackStorage]],"BRUUUDIS_fnc_updateHouseWeaponStorage",false,false] spawn life_fnc_MP;
_handle = [] spawn life_fnc_sessionUpdate;
