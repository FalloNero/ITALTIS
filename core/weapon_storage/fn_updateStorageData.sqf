#include "macro.hpp"
/*
	File: fn_updateStorageData.sqf
	Author: Mario2002
	
	Description:
	updates the houses weapon storage data
*/
private["_house", "_weaponStorage", "_filter", "_display", "_storageList", "_gearList", "_cargo", "_length", "_name", "_amount"];
//waitUntil {!isNull (findDisplay 8700)};
disableSerialization;

_action = _this select 0;
_array = _this select 1;
_item = _this select 2;

diag_log format ["storage action : %1", _action];
diag_log format ["storage data : %1", _array];
diag_log format ["storage item : %1", _item];

switch (_action) do {
    
    case "add" : {
         
         _index = [_item, (_array select 0)] call life_fnc_getItemIndex;
         diag_log format ["storage index : %1", _index];
         
         if (_index == -1) then {
             (_array select 0) pushBack _item;
             (_array select 1) pushBack 1;
         } else {
             (_array select 1) set [_index, ((_array select 1) select _index) + 1];
         };
    };
    case "remove" : {
        
        _index = [_item, (_array select 0)] call life_fnc_getItemIndex;
         diag_log format ["storage index : %1", _index];
        
        if ((_array select 1) select _index == 1) then {
            (_array select 0) set [_index, objNull];
            (_array select 1) set [_index, objNull];
            _array set [0, (_array select 0) - [objNull]];
            _array set [1, (_array select 1) - [objNull]];
        } else {
            (_array select 1) set [_index, ((_array select 1) select _index) - 1];
        };
    };
};

diag_log format ["storage result : %1", _array];
_array;





