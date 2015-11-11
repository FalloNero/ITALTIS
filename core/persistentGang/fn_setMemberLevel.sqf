/*
	File: fn_setMemberLevel.sqf
	Author: Mario2002
	
	Description:
	sets the gang level of a member
*/
private["_dialog", "_playerList", "_selectedPlayer", "_members", "_receiver", "_playerObjectString", "_newRank", "_oldRank", "_increment", "_gang"];
disableSerialization;

_increment = [_this, 0, 0, [0]] call BIS_fnc_param;
_dialog = findDisplay 8600;
_playerList = _dialog displayCtrl 8601;
_selectedPlayer = lbCurSel 8601;
_members = _dialog displayCtrl 8601;

if(_selectedPlayer == -1) exitWith {hint "No player selected!"};

_gang = player getVariable ["persistent_gang", []];
_newRank = (_members lbValue _selectedPlayer) + _increment;
_oldRank = (_members lbValue _selectedPlayer);

if(_newRank < 0 || _newRank > 2) exitWith {hint "Invalid Rank"};
if((_gang select 3) < 3 && _oldRank == 3 &&  _newRank == 2) exitWith {hint "You can't degrade the leader"};

_playerObjectString = lbData [8601, _selectedPlayer];

if (count (toArray _playerObjectString) != 17)then {
	
    _receiver = missionNamespace getVariable [_playerObjectString, objNull];
	if(isNull _receiver) exitWith {hint "Invalid Player"};
	
	[[player, _receiver, _newRank], "life_fnc_receiveNewLevel", _receiver, false] spawn life_fnc_MP;	
}
else {
    
    [[getPlayerUID player, _playerObjectString, playerSide, (_gang select 0), _newRank], "GANG_fnc_updateMemberLevel", false, false] spawn life_fnc_MP;
};

lbClear _members;
[[player, (_gang select 0), playerSide], "GANG_fnc_queryMembers", false, false] spawn life_fnc_MP;
