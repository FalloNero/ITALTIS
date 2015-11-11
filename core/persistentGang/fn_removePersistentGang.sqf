/*
	File: fn_removePersistentGang.sqf
	Author: Mario2002
	
	Description:
	remove a player from a persistent gang
*/
private["_remover", "_player"];

_remover = [_this, 0, objNull] call BIS_fnc_param;
_playerId = [_this, 1, ""] call BIS_fnc_param;
if(isNull _remover) exitWith {};

_group = createGroup civilian;    
[player] joinSilent _group;

_var = player getVariable ["persistent_gang", []];
player setVariable ["persistent_gang", [], true];

life_my_gang = objNull;
life_persistent_gang = objNull;

[[_remover, _playerId, side _remover, (_var select 0)],"GANG_fnc_removeMember",false,false] spawn life_fnc_MP;
