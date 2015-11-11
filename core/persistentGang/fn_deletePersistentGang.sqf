/*
	File: fn_deletePersistentGang.sqf
	Author: Mario2002
	
	Description:
	deletes the gang completly
*/
private["_dialog", "_playerList", "_selectedPlayer", "_members", "_receiver", "_playerObjectString", "_gang"];
disableSerialization;

_dialog = findDisplay 8600;
_playerList = _dialog displayCtrl 8601;
_selectedPlayer = lbCurSel 8601;
_members = _dialog displayCtrl 8601;

_gang = player getVariable ["persistent_gang", []];

for [{_i = 0},{_i < lbSize _playerList},{_i = _i + 1}] do {
    
    _playerObjectString = lbData [8601, _i];

	if (count (toArray _playerObjectString) != 17)then {
		
	    _receiver = missionNamespace getVariable [_playerObjectString, objNull];
		if(isNull _receiver) exitWith {hint "Invalid Player"};
		
		[[player, getPlayerUID _receiver], "life_fnc_removePersistentGang", _receiver, false] spawn life_fnc_MP;	
	}
	else {
	    
	    [[player, _playerObjectString, playerSide, (_gang select 0)], "GANG_fnc_removeMember", false, false] spawn life_fnc_MP;
	};
};

[[getPlayerUID player, playerSide, (_gang select 0), (_gang select 1)], "GANG_fnc_delete", false, false] spawn life_fnc_MP;

lbClear _members;
closeDialog 0;
   
//[] spawn life_fnc_persistentGangManagement;


