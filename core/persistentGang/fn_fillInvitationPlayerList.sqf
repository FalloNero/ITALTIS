/*
	File: fn_fillInvitationPlayerList.sqf
	Author: Mario2002
	
	Description:
	fills the item list
*/
private["_dialog","_playerList","_data"];
disableSerialization;

_dialog = findDisplay 8620;
_playerList = _dialog displayCtrl 8621;

{
    _data = _x getVariable ["persistent_gang", []];
    if(count _data == 0 && side _x == civilian) then {
        _i = _playerList lbAdd format["%1", name _x];
        _playerList lbSetData [_i, format["%1", _x]];
    };
} forEach playableUnits;


