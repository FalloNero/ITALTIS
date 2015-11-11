/*
	File: fn_sendInvitation.sqf
	Author: Mario2002
	
	Description:
	receives a gang invitation
*/
private["_dialog","_playerList","_selectedPlayer", "_receiver", "_playerObjectString"];
disableSerialization;

_dialog = findDisplay 8620;
_playerList = _dialog displayCtrl 8621;
_selectedPlayer = lbCurSel 8621;

if(_selectedPlayer == -1) exitWith {hint "No player selected!"};
_playerObjectString = lbData [8621, _selectedPlayer];

_receiver = missionNamespace getVariable [_playerObjectString, objNull];
if(isNull _receiver) exitWith {hint "Invalid Player"};

_gang = player getVariable ["persistent_gang", []];
[[player, _gang], "life_fnc_receiveInvitation", _receiver, false] spawn life_fnc_MP;





