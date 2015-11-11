/*
	File: fn_initPersistentGang.sqf
	Author: Mario2002
	
	Description:
	sets the group id
*/

private ["_group", "_id"];

_group = [_this, 0, objNull] call BIS_fnc_param;
_id = [_this, 1, ""] call BIS_fnc_param;

if(isNull _group) exitWith {diag_log "_group is null in fn_setGroupId";};

_group setGroupid [_id];
