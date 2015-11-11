/*
	File: fn_createPersistentGang.sqf
	Author: Mario2002
	
	Description:
	creates a persistent gang
*/
private["_name","_tag","_group", "_uid", "_nameLength", "_tagLength"];
_name = ctrlText 8611;
_tag = ctrlText 8612;
_uid = getPlayerUID player;
_nameLength = [_name] call KRON_StrLen;
_tagLength = [_tag] call KRON_StrLen;

diag_log format ["name : %1 (2%)", _name, _nameLength];
diag_log format ["tag : %1 (2%)", _tag, _tagLength];

if(_nameLength > 25) exitWith {hint "The maximum character limit for a gang name is 25."};
if(_tagLength > 10) exitWith {hint "The maximum character limit for a gang tag is 10."};
if(life_bucks < 1000000) exitWith {hint "You don't have $1,000,000 to create a persistent gang!"};
if(([_name,life_gang_list] call fnc_index) != -1) exitWith {hint "That gang name is already taken!"};
if(([_name,life_persistent_gang_list] call fnc_index) != -1) exitWith {hint "That gang name is already taken!"};
if(([_tag,life_persistent_gang_list] call fnc_index) != -1) exitWith {hint "That gang tag is already taken!"};

_group = createGroup civilian;

[player] joinSilent _group;
player setRank "COLONEL";
_group setGroupid [_tag];
life_my_gang = objNull;
life_persistent_gang = _group;
life_bucks = life_bucks - 1000000;

[[player, _name, _tag],"GANG_fnc_create",false,false] spawn life_fnc_MP;
[] call life_fnc_sessionUpdate;

sleep 1;

closeDialog 0;
createDialog "Life_Persistent_Gang_Menu";

