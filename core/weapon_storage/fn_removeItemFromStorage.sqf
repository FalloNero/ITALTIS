#include "macro.hpp"
/*
	File: fn_removeItemFromStorage.sqf
	Author: Mario2002
	
	Description:
	creates the markers for player houses locally
*/
private["_house", "_weaponStorage", "_houseCfg", "_weaponCargo", "_magazineCargo", "_itemCargo", "_backpackCargo"];
waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

if (isNil "WS_filter") exitWith {diag_log "invalid filter"};

_house = cursorTarget;
_display = findDisplay 8700;
_storageList = _display displayCtrl 8715;
_gearList = _display displayCtrl 8716;

_index = lbCurSel _gearList;
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

_houseCfg = [_house] call life_fnc_housingCfg;
_className = _gearList lbData _index;
_weight = [_storage] call life_fnc_calcUsedStorage;

diag_log format ["classname : %1", _className];

switch (WS_filter select 1) do {       
    
    case "weapons" : {        
    	
        _mass = getNumber(configFile >> "CfgWeapons" >> _className >> "WeaponSlotsInfo" >> "mass");
        
        if((_weight + _mass) <= (_houseCfg select 1)) then {        
        	player removeItemFromBackpack _className; 	        
	        _weaponStorage = ["add", _weaponStorage, _className] call life_fnc_updateStorageData;	            
        } else {
            hint "This item doesnt fit into your storage!";
        }; 
    };           
    
    case "magazines" : {        
    	
        _mass = getNumber(configFile >> "CfgMagazines" >> _className >> "mass");
        
        if((_weight + _mass) <= (_houseCfg select 1)) then {        
        	player removeItemFromBackpack _className; 	        
	        _magazineStorage = ["add", _magazineStorage, _className] call life_fnc_updateStorageData;	            
        } else {
            hint "This item doesnt fit into your storage!";
        }; 
    }; 
    
    case "items" : {        
    	
        _mass = getNumber(configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "mass");
                
        if((_weight + _mass) <= (_houseCfg select 1)) then {        
        	player removeItemFromBackpack _className; 	        
	        _itemStorage = ["add", _itemStorage, _className] call life_fnc_updateStorageData;	            
        } else {
            hint "This item doesnt fit into your storage!";
        }; 
    };       
    
    case "backpacks" : {            	
        
        _baseClass = [_className, "CfgWeapons"] call life_fnc_getBaseClass;        
        diag_log format ["base : %1", _baseClass];
        
        if(_baseClass == "ItemCore") then {
            
            _mass = getNumber(configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "mass");
            if((_weight + _mass) <= (_houseCfg select 1)) then { 
            	 
                 _superClass = [_className, "CfgWeapons"] call life_fnc_getItemSuperClass;
                 diag_log format ["_superClass : %1", _superClass];
                 
                 if(_superClass == "Uniform_Base") then {
                    if(loadUniform player == 0) then {
	                    removeUniform player;
	                    _itemStorage = ["add", _itemStorage, _className] call life_fnc_updateStorageData;
	                } else {
	                    hint "Uniform is not empty!";
	                };
                 };
                 
                 if(_superClass == "Vest_Camo_Base" || _superClass == "Vest_NoCamo_Base") then {
                    if(loadVest player == 0) then {
	                    removeVest player;
	                    _itemStorage = ["add", _itemStorage, _className] call life_fnc_updateStorageData;
	                } else {
	                    hint "Vest is not empty!";
	                };
                 };   
            } else {
                hint "This item doesnt fit into your storage!";
            };	 
        } else {
            
            _mass = getNumber(configFile >> "CfgVehicles" >> _className >> "mass");
            if((_weight + _mass) <= (_houseCfg select 1)) then {  
            	if(loadBackpack player == 0) then {
                    removeBackpack player;
                    _backpackStorage = ["add", _backpackStorage, _className] call life_fnc_updateStorageData;
                } else {
                    hint "Backpack is not empty!";
                };           		
            };
        };
        
        diag_log format ["clothes item : %1 (%2)", _className, _mass];
    };  
    
    case "primary" : {        
        
        _baseClass = [_className, "CfgWeapons"] call life_fnc_getBaseClass;        
        diag_log format ["base : %1", _baseClass];
        
        if(primaryWeapon player != "" && _baseClass == "RifleCore") then {            
        	
            _pItems = primaryWeaponItems player; 
            diag_log format ["_pItems : %1", _pItems];
            {
                if(_x != "") then {
	                _massItem = getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
                    diag_log format ["_massItem : %1", _massItem];	                
	                if((_weight + _massItem) <= (_houseCfg select 1)) then {
	                   	player removePrimaryWeaponItem _x;  
	                    _itemStorage = ["add", _itemStorage, _x] call life_fnc_updateStorageData;
	                };
                };
            } forEach _pItems;
                
            _massWeapon = getNumber(configFile >> "CfgWeapons" >> _className >> "WeaponSlotsInfo" >> "mass");
            diag_log format ["_massWeapon : %1", _massWeapon];
            _weight = [_storage] call life_fnc_calcUsedStorage;
            if((_weight + _massWeapon) <= (_houseCfg select 1)) then {
                player removeWeapon _className;
                _weaponStorage = ["add", _weaponStorage, _className] call life_fnc_updateStorageData;
            };           
        } else {
            if(primaryWeapon player != "" && _baseClass == "ItemCore") then {  
            	if(_className in primaryWeaponItems player) then {
                    player removePrimaryWeaponItem _className;
                    _itemStorage = ["add", _itemStorage, _className] call life_fnc_updateStorageData;
                };
            };
        };
    };  
    
    case "handgun" : {        
        
        _baseClass = [_className, "CfgWeapons"] call life_fnc_getBaseClass;        
        diag_log format ["base : %1", _baseClass];
        
        if(handgunWeapon player != "" && _baseClass == "PistolCore") then {            
        	
            _pItems = handgunItems player; 
            diag_log format ["_pItems : %1", _pItems];
            {
                if(_x != "") then {
	                _massItem = getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
                    diag_log format ["_massItem : %1", _massItem];	                
	                if((_weight + _massItem) <= (_houseCfg select 1)) then {
	                   	player removeHandgunItem _x;  
	                    _itemStorage = ["add", _itemStorage, _x] call life_fnc_updateStorageData;
	                };
                };
            } forEach _pItems;
                
            _massWeapon = getNumber(configFile >> "CfgWeapons" >> _className >> "WeaponSlotsInfo" >> "mass");
            diag_log format ["_massWeapon : %1", _massWeapon];
            _weight = [_storage] call life_fnc_calcUsedStorage;
            if((_weight + _massWeapon) <= (_houseCfg select 1)) then {
                player removeWeapon _className;
                _weaponStorage = ["add", _weaponStorage, _className] call life_fnc_updateStorageData;
            };           
        } else {
            if(handgunWeapon player != "" && _baseClass == "ItemCore") then {  
            	if(_className in handgunItems player) then {
                    player removeHandgunItem _className;
                    _itemStorage = ["add", _itemStorage, _className] call life_fnc_updateStorageData;
                };
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