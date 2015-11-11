/*
	File: fn_cellphoneReceive.sqf
	Author: MarioF
	
	Description:
	Fill the Cellphone with DATA

*/

private["_index","_data"];
disableSerialization;

_index = [_this,0,0] call BIS_fnc_param;

waitUntil {!isNull findDisplay 3200};

_display = findDisplay 3200;
_CmessageHeader = _display displayCtrl 3204;
_CmessageText = _display displayCtrl 3205;
_Clist = _display displayCtrl 3203;

_data = call compile (_Clist lnbData[_index,0]);
_player = objNull;
_status = "[OFFLINE]";

{
	if(name _x == (_data select 1) && _x != player) then { _player = _x; _status = "[ONLINE]"; };
} foreach playableUnits;

if(!isNull _player) then { [3,-1,_player] spawn life_fnc_cellphonePlayer; };

_CmessageHeader ctrlSetText format["%1 %2 %3 am %4", _data select 0, _data select 1, _status, _data select 2];
_CmessageText ctrlSetText format["%1", _data select 3];