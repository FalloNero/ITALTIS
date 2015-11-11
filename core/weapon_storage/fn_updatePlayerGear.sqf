#include "macro.hpp"
/*
	File: fn_updateWeaponStorage.sqf
	Author: Mario2002
	
	Description:
	updated the weapon storage menu
*/
private["_filter", "_display", "_storageList", "_gearList", "_objects", "_gearList", "_index", "_name", "_c", "_picture", "_length", "_mags", "_left"];
//waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

_filter = _this select 0;
_display = findDisplay 8700;
_storageList = _display displayCtrl 8715;
_gearList = _display displayCtrl 8716;
_gearHeader = _display displayCtrl 8721;

lbClear 8716;

switch (_filter) do {
    
    case "weapons" : {
    	
        _objects = getWeaponCargo backpackContainer player;        
		_length = count (_objects select 0);
        _gearHeader ctrlSetText "Your Backpack";
        
		for [{_i = 0},{_i < _length},{_i = _i + 1}] do {		    
		    _name = getText(configFile >> "CfgWeapons" >> (_objects select 0) select _i >> "displayName");
            _picture = getText(configFile >> "CfgWeapons" >> (_objects select 0) select _i >> "picture");
		    _amount = (_objects select 1) select _i;
	        _index = _gearList lbAdd format ["[%1] %2", _amount, _name];
			_gearList lbSetValue [_index, _amount];
            _gearList lbSetData [_index, (_objects select 0) select _i];
            _gearList lbSetPicture [_index, _picture];
		};   
    }; 
   
    case "magazines" : {
    	
        _objects = magazinesAmmo backpackContainer player;      
		_length = count (_objects);     
        _gearHeader ctrlSetText "Your Backpack";
        _mags = [[],[]];
        
        for [{_i = 0},{_i < _length},{_i = _i + 1}] do {        	
             _count = getNumber(configFile >> "CfgMagazines" >> (_objects select _i) select 0 >> "count");             
             if(_count == ((_objects select _i) select 1)) then {
	         	_mags = ["add", _mags, (_objects select _i) select 0] call life_fnc_updateStorageData;
             };	    
		};   
        
        _length = count (_mags select 0); 
        for [{_i = 0},{_i < _length},{_i = _i + 1}] do {	
    		_name = getText(configFile >> "CfgMagazines" >> (_mags select 0) select _i >> "displayName");
            _picture = getText(configFile >> "CfgMagazines" >> (_mags select 0) select _i >> "picture");
		    _amount = (_mags select 1) select _i;
	        _index = _gearList lbAdd format ["[%1] %2", _amount, _name];
			_gearList lbSetValue [_index, _amount];
            _gearList lbSetData [_index, (_mags select 0) select _i];
            _gearList lbSetPicture [_index, _picture];    
        };
    }; 
   
    case "items" : {
    	
        _objects = getItemCargo backpackContainer player;      
		_length = count (_objects select 0);   
        _gearHeader ctrlSetText "Your Backpack";
        
        for [{_i = 0},{_i < _length},{_i = _i + 1}] do {
           
            _name = getText(configFile >> "CfgWeapons" >> (_objects select 0) select _i >> "displayName");
            _picture = getText(configFile >> "CfgWeapons" >> (_objects select 0) select _i >> "picture");            
            
		    _amount = (_objects select 1) select _i;
	        _index = _gearList lbAdd format ["[%1] %2", _amount, _name];
			_gearList lbSetValue [_index, _amount];
            _gearList lbSetData [_index, (_objects select 0) select _i];
            _gearList lbSetPicture [_index, _picture];
		};   
    }; 
   
    case "backpacks" : {
    	
        _objects = [uniform player, vest player, backpack player];
        _c = 0;
        _gearHeader ctrlSetText "Your Clothes";
        
        {
            if (_x != "") then { 
	            if(_c == 2) then {
		            _name = getText(configFile >> "CfgVehicles" >> _x >> "displayName");      
			        _picture = getText(configFile >> "CfgVehicles" >> _x >> "picture");	            
	            }
	            else {
	                _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");      
			        _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");	
	            };
		                    
	            _index = _gearList lbAdd format ["[%1] %2", 1, _name];
		        _gearList lbSetValue [_index, 1];
				_gearList lbSetData [_index, _x];  
		        _gearList lbSetPicture [_index, _picture];
	            
	            if(_c == 0 && loadUniform player > 0) then {
	                _gearList lbSetColor [_index, [1, 0, 0, 1]];
	            };
	            if(_c == 1 && loadVest player > 0) then {
	                _gearList lbSetColor [_index, [1, 0, 0, 1]];
	            };
	            if(_c == 2 && loadBackpack player > 0) then {
	                _gearList lbSetColor [_index, [1, 0, 0, 1]];
	            };
            };            
            _c = _c + 1;
        } forEach _objects;
    };  
   
    case "primary" : {
    	
        _objects = [primaryWeapon player, primaryWeaponItems player];
        _c = 0;
        _gearHeader ctrlSetText "Your Primary Weapon";
        
        if ((_objects select 0) != "") then { 
	        {
	            if (_c == 0) then {
		            _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");      
			        _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");       
			        _index = _gearList lbAdd format ["[%1] %2", 1, _name];
			        _gearList lbSetValue [_index, 1];
					_gearList lbSetData [_index, (_objects select _c)];  
			        _gearList lbSetPicture [_index, _picture];    
	            }
	            else {
	                _items = _x;
	            	{
	                    if (_x != "") then {
		                    _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");      
					        _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");       
					        _index = _gearList lbAdd format ["[%1] %2", 1, _name];
					        _gearList lbSetValue [_index, 1];
							_gearList lbSetData [_index, _x];  
					        _gearList lbSetPicture [_index, _picture]; 
	                    };
	                } forEach _items; 
	            };	         
	            
	            _c = _c + 1;
	        } forEach _objects;
        };
    }; 
   
    case "handgun" : {
    	
        _objects = [handgunWeapon player, handgunItems player];
        _c = 0;
        _gearHeader ctrlSetText "Your Handgun";
        
        if ((_objects select 0) != "") then {       
	        {
	            if (_c == 0) then {
		            _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");      
			        _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");       
			        _index = _gearList lbAdd format ["[%1] %2", 1, _name];
			        _gearList lbSetValue [_index, 1];
					_gearList lbSetData [_index, (_objects select _c)];  
			        _gearList lbSetPicture [_index, _picture];    
	            }
	            else {
	                _items = _x;
	            	{
	                    if (_x != "") then {
		                    _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");      
					        _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");       
					        _index = _gearList lbAdd format ["[%1] %2", 1, _name];
					        _gearList lbSetValue [_index, 1];
							_gearList lbSetData [_index, _x];  
					        _gearList lbSetPicture [_index, _picture];     
	                    };                    
	                } forEach _items;                
	            };	         
	            
	            _c = _c + 1;
	        } forEach _objects;
        };
    };
};





