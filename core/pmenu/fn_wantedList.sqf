/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;
_units = [];
{
	_uidx = getPlayerUID _x;
	_namex = _x getVariable["realname",name _x];
	_units pushBack ([_uidx,_namex]);
} foreach playableUnits;

{
	_entry = _x;
	{
		_unit = _x;
		if((_entry select 1) in _unit) then
		{
			_list lbAdd format["%1",_unit select 1 ];//_entry select 0];
			_list lbSetData [(lbSize _list)-1,str(_entry)];
		};
	}foreach _units;
} foreach _info;

ctrlSetText[2404,"Connection Established"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No criminals";
};