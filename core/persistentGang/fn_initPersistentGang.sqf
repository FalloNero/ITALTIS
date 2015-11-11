/*
	File: fn_initPersistentGang.sqf
	Author: Mario2002
	
	Description:
	initalizes the gang stuff...
*/

private ["_group", "_gang"];

life_gang_invitation_accepted = nil;

_gang = player getVariable ["persistent_gang", []];
_isOwner = false;

if(count _gang == 0) exitWith {
   	life_my_gang = objNull;
    life_persistent_gang = objNull;
};

_group = (_gang select 5);

if(!isNull _group) then {
    
    [player] joinSilent _group;   
} else {
    
    _group = createGroup civilian;
    [player] joinSilent _group;
    _isOwner = true;    
    
    _handle = [[_group, (_gang select 2)],"life_fnc_setGroupId",true,true] spawn life_fnc_MP;
    waitUntil {scriptDone _handle};
    [[(_gang select 2), _group],"GANG_fnc_addGroup",false,false] spawn life_fnc_MP;
};

switch (_gang select 3) do {
    
    case 1 : {
        player setRank "PRIVATE";
    };
    case 2 : {
        player setRank "SERGEANT";
    };
    case 3 : {
        player setRank "CAPTAIN";
    };
    case 4 : {
        player setRank "COLONEL";
    };
};

_gang pushBack _group;
_gang pushBack _isOwner;

player setVariable ["persistent_gang", _gang, true];

life_persistent_gang = _group;
life_my_gang = objNull;
