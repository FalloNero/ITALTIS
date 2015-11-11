/*
	File: fn_receiveInvitation.sqf
	Author: Mario2002
	
	Description:
	sends a gang invitation to a specific player
*/
private["_sender", "_receiver", "_accepted", "_message"];
disableSerialization;

_sender = [_this, 0, objNull] call BIS_fnc_param;
_receiver = [_this, 1, objNull] call BIS_fnc_param;
_newRank = [_this, 2, 0, [0]] call BIS_fnc_param;

hint format ["Promotion received from %1", name _sender];

_var = player getVariable ["persistent_gang", []];
_var set [3, _newRank];

[[getPlayerUID _sender, getPlayerUID player, playerSide, (_gang select 0), _newRank], "GANG_fnc_updateMemberLevel", false, false] spawn life_fnc_MP;

