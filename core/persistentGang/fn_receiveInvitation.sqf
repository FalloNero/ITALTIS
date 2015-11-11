/*
	File: fn_receiveInvitation.sqf
	Author: Mario2002
	
	Description:
	sends a gang invitation to a specific player
*/
private["_sender", "_receiver", "_accepted", "_message"];
disableSerialization;

_sender = [_this, 0, objNull] call BIS_fnc_param;
_gang = [_this, 1, [], [[]]] call BIS_fnc_param;

hint format ["Ganginvitation received from %1", name _sender];

createDialog "life_gang_invitation_prompt";
_dialog = findDisplay 8630;
_text = _dialog displayCtrl 8631;
_text ctrlSetText format ["%1 has invited you to join the [%3] %2 gang. If you accept 100k$ will be taken from your bankaccount.", name _sender, (_gang select 1), (_gang select 2)];

waitUntil {!isNil "life_gang_invitation_accepted"};

if(life_gang_invitation_accepted) then {
    
    life_gang_invitation_accepted = nil;
    
    if(life_atmbucks < 100000) exitWith {
        
        hint "You do not have that much money in your bankaccount.";
        _message = format ["%1 could not afford your Invitation.", name player];
    	[[_message], "life_fnc_receiveMessage", _sender, false] spawn life_fnc_MP;
    };
    
    _newGangVar = _gang;
    _newGangVar set [3, 0];
    player setVariable ["persistent_gang", _newGangVar, true];
    [player] joinSilent (group _sender);
    [[_sender, player, side player, (_gang select 0)], "GANG_fnc_addMember", false, false] spawn life_fnc_MP; 
    life_my_gang = objNull;
    life_persistent_gang = (group _sender); 
    
    ["atm", "take", 100000] call life_fnc_updateCash;  
    [] call life_fnc_sessionUpdate; 
} 
else {
        
    life_gang_invitation_accepted = nil;
    _message = format ["%1 denied your Invitation", name player];
    [[_message], "life_fnc_receiveMessage", _sender, false] spawn life_fnc_MP;
};
