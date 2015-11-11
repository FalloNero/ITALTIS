/*
	File: fn_callSendMsg.sqf
	Author: MarioF
	
	Description:
	Do the CAll!
	// MODES: 0 - Normal Player Message, 1 - Police Player Message, 2 - Admin Player Message
			  3 - Police Emergency, 4 - Medic Emergency, 5 - Adminnotruf, 6 - AdminALL
*/

private["_mode","_msg"];
disableSerialization;

_mode = [_this,0,-1] call BIS_fnc_param;

if(isNull findDisplay 3700) exitWith {};
_display = findDisplay 3700;
_CmsgText = _display displayCtrl 3702;

if(player getVariable["restrained",false] || player getVariable ["surrender", false]) exitWith { hint "Du kannst dein Telefon nicht benutzen waehrend du gefesselt bist!"; };

// Check for no Message
_msg = ctrlText _CmsgText;
if(_msg == "") exitWith {hint format["Du musst einen Text eingeben!"]};

// FU escape chars
_msg = [_msg,"\0","_"] call KRON_Replace;

if(_mode == 0) then {
	if(isNull life_cellphone_lockedDestination) exitWith { hint format["Die Person scheint Offline zu sein!"]; };
	[[0,player,_msg,life_cellphone_lockedDestination],"Comm_fnc_message",false] spawn life_fnc_MP;
};

if(_mode == 1) then {
	if(isNull life_cellphone_lockedDestination) exitWith { hint format["Die Person scheint Offline zu sein!"]; };
	[[1,player,_msg,life_cellphone_lockedDestination],"Comm_fnc_message",false] spawn life_fnc_MP;
};

if(_mode == 2) then {
	if(isNull life_cellphone_lockedDestination) exitWith { hint format["Die Person scheint Offline zu sein!"]; };
	[[2,player,_msg,life_cellphone_lockedDestination],"Comm_fnc_message",false] spawn life_fnc_MP;
};

if(_mode == 3) then {
	if(({side _x == west} count playableUnits) == 0) exitWith { hint format["Es ist keine Polizei zu erreichen!"]; };
	[[3,player,_msg],"Comm_fnc_message",false] spawn life_fnc_MP;
};

if(_mode == 4) then {
	if(({(_x getVariable["fms_status",["null"]] select 0) == "Medic"} count playableUnits) == 0) exitWith { hint format["Es ist kein medizinischer Dienst zu erreichen!"]; };
	[[4,player,_msg],"Comm_fnc_message",false] spawn life_fnc_MP;
};

if(_mode == 5) then {
	[[5,player,_msg],"Comm_fnc_message",false] spawn life_fnc_MP;
};

if(_mode == 6) then {
	[[6,player,_msg],"Comm_fnc_message",false] spawn life_fnc_MP;
};

closeDialog 3700;