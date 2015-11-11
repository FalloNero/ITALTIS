/*
	File: fn_kickPersistentGang.sqf
	Author: Mario2002
	
	Description:
	the gang menu
*/
private["_dialog", "_playerList", "_selectedPlayer", "_members", "_receiver", "_playerObjectString", "_gang"];
disableSerialization;

_dialog = findDisplay 8600;
_playerList = _dialog displayCtrl 8601;
_selectedPlayer = lbCurSel 8601;
_members = _dialog displayCtrl 8601;

_gang = player getVariable ["persistent_gang", []];

if(_selectedPlayer == -1) exitWith {hint "No player selected!"};
_playerObjectString = lbData [8601, _selectedPlayer];

if (count (toArray _playerObjectString) != 17)then {
	
    _receiver = missionNamespace getVariable [_playerObjectString, objNull];
	if(isNull _receiver) exitWith {hint "Invalid Player"};
    _receiverGang = _receiver getVariable ["persistent_gang", []];
    if((_receiverGang select 3) > 2) exitWith {hint "You can't kick a leader!"};
	
	[[player, getPlayerUID _receiver], "life_fnc_removePersistentGang", _receiver, false] spawn life_fnc_MP;	
    _members lbDelete _selectedPlayer;
}
else {
    
    [[player, _playerObjectString, playerSide, (_gang select 0)], "GANG_fnc_removeMember", false, false] spawn life_fnc_MP;
    _members lbDelete _selectedPlayer;
};




