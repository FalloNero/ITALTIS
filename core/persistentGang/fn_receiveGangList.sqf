/*
	File: fn_receiveGangList.sqf
	Author: Mario2002
	
	Description:
	fills the item list
*/
private["_dialog","_playerList","_data"];
disableSerialization;

_data = [_this, 0, []] call BIS_fnc_param;

_dialog = findDisplay 8650;
_gangList = _dialog displayCtrl 8653;
_cashText = _dialog displayCtrl 8651;

_gang = player getVariable ["persistent_gang", []];

{
    if((_gang select 0) == (_x select 0)) then {
        
        _cashText ctrlSetText format ["%1", _x select 3];
        
        // temporär
        // zeigt einem auch die eigene gang an
        //_i = _gangList lbAdd format["%1", (_x select 1)];
    	//_gangList lbSetValue [_i, (_x select 0)];
    }
    else {
        _i = _gangList lbAdd format["%1", (_x select 1)];
    	_gangList lbSetValue [_i, (_x select 0)];
    };    
} forEach _data;


