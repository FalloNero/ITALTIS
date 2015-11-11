/*
	File: fn_receiveMessage.sqf
	Author: Mario2002
	
	Description:
	receive a message from a player
*/
private["_message"];

_message = [_this, 0, ""] call BIS_fnc_param;

hint _message;
