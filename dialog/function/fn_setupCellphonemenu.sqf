#include <macro.hpp>
/*
	File: fn_setupCellphonemenu.sqf
	Author: MarioF
	
	Description:
	Populate the various Cellphone variants
*/

private["_mode","_display","_direction","_direction","_permission","_first","_getDir"];
disableSerialization;

_mode = [_this,0,0] call BIS_fnc_param;
_first = false;

if(_mode == 25 && isNull findDisplay 3200) exitWith {};

// Dont let use the Phone while restrained
if(player getVariable["restrained",false] || player getVariable ["surrender", false]) exitWith { hint "Non è possibile utilizzare il telefono!"; };
if(isNull findDisplay 3200) then { createDialog "cellphone_menu"; _first = true; };
waitUntil {!isNull findDisplay 3200};

_display = findDisplay 3200;
_CHeaderText = _display displayCtrl 3214;
_CFooterText = _display displayCtrl 3215;
_CuserText = _display displayCtrl 3213;
_CmessageHeader = _display displayCtrl 3204;
_CmessageText = _display displayCtrl 3205;
_CplayerSearch = _display displayCtrl 3201;
_CplayerList = _display displayCtrl 3202;
_CinboxList = _display displayCtrl 3203;
_CbtnSendMessage = _display displayCtrl 3207;
_CchoosenPlayer = _display displayCtrl 3217;
_CbtnCompanys = _display displayCtrl 3208;
_CbtnEmergency = _display displayCtrl 3209;
_CbtnOutbox = _display displayCtrl 3210;
_CbtnInbox = _display displayCtrl 3216;
_CbtnPoliceUser = _display displayCtrl 3211;
_CbtnPoliceBack = _display displayCtrl 3218;
_CbtnAdminUser = _display displayCtrl 3212;
_CbtnAdminBack = _display displayCtrl 3219;
_CbtnAdminAll = _display displayCtrl 3220;
_CbtnCompanyUser = _display displayCtrl 3221;

// First setup Values
if(_first) then {
	life_cellphone_lockedDestination = objNull;
};

// Estimate direction
if((ctrlText _CuserText) == "Mittente") then {_direction = "IN"} else {_direction = "OUT"};

// Clearout the Interface
if(_mode != 25 && _mode != 20) then {
	ctrlShow[ctrlIDC _CbtnCompanys, false];
	ctrlEnable[ctrlIDC _CbtnCompanys, false];
	ctrlShow[ctrlIDC _CbtnAdminall, false];
	ctrlEnable[ctrlIDC _CbtnAdminall, false];
	ctrlShow[ctrlIDC _CbtnEmergency, false];
	ctrlEnable[ctrlIDC _CbtnEmergency, false];
	ctrlShow[ctrlIDC _CbtnInbox, false];
	ctrlEnable[ctrlIDC _CbtnInbox, false];
	ctrlShow[ctrlIDC _CbtnOutbox, false];
	ctrlEnable[ctrlIDC _CbtnOutbox, false];
	ctrlShow[ctrlIDC _CbtnPoliceUser, false];
	ctrlEnable[ctrlIDC _CbtnPoliceUser, false];
	ctrlShow[ctrlIDC _CbtnPoliceBack, false];
	ctrlEnable[ctrlIDC _CbtnPoliceBack, false];
	ctrlShow[ctrlIDC _CbtnAdminUser, false];
	ctrlEnable[ctrlIDC _CbtnAdminUser, false];
	ctrlShow[ctrlIDC _CbtnAdminBack, false];
	ctrlEnable[ctrlIDC _CbtnAdminBack, false];
	ctrlShow[ctrlIDC _CbtnCompanyUser, false];
	ctrlEnable[ctrlIDC _CbtnCompanyUser, false];
	
	// Delete Messages
	ctrlSetText[ctrlIDC _CmessageHeader, "Messaggio Mostra"];
	_CmessageText ctrlSetText format[""];
	lnbClear (ctrlIDC _CinboxList);

	if(playerSide == west) then
	{
		if(_mode == 2) then {
			ctrlShow[ctrlIDC _CbtnPoliceBack,true];
		} else {
			ctrlShow[ctrlIDC _CbtnPoliceUser,true];
		};
	};
	
	if(playerSide == east) then
	{
		if(_mode == 2) then {
			ctrlShow[ctrlIDC _CbtnPoliceBack,true];
		} else {
			ctrlShow[ctrlIDC _CbtnPoliceUser,true];
		};
	};
	
	_persGang = player getVariable["persistent_gang",[]];
	if((count _persGang) > 0) then {
		if(_mode == 4) then {
			ctrlShow[ctrlIDC _CbtnPoliceBack,true];
		} else {
			ctrlShow[ctrlIDC _CbtnCompanyUser,true];
		};
	};
	if((__GETC__(life_adminlevel) > 0)) then
	{
		if(_mode == 3) then {
			ctrlShow[ctrlIDC _CbtnAdminBack,true];
		} else {
			ctrlShow[ctrlIDC _CbtnAdminUser,true];
		};
	};
};

// Normal
if(_mode == 0) then {
	// Show wanted Buttons
	ctrlShow[ctrlIDC _CbtnCompanys, true];
	ctrlShow[ctrlIDC _CbtnEmergency, true];
	_CHeaderText ctrlSetBackgroundColor [0.77,0.51,0.08,0.8];
	_CFooterText ctrlSetBackgroundColor [0.77,0.51,0.08,0.8];
};

// Police
if(_mode == 2) then { 
	// Show wanted Buttons
	_CHeaderText ctrlSetBackgroundColor [0.0,0.6,0.9,0.8];
	_CFooterText ctrlSetBackgroundColor [0.0,0.6,0.9,0.8];
};

// Admin
if(_mode == 3) then {
	// Show wanted Buttons
	ctrlShow[ctrlIDC _CbtnAdminall, true];
	_CHeaderText ctrlSetBackgroundColor [1.0,0.0,0.0,0.8];
	_CFooterText ctrlSetBackgroundColor [1.0,0.0,0.0,0.8];
};

// Company
if(_mode == 4) then {
	// Show wanted Buttons
	
};

if(isNull life_cellphone_lockedDestination) then { 
	ctrlEnable[ctrlIDC _CbtnSendMessage, false]; 
	ctrlSetText[ctrlIDC _CchoosenPlayer, "Nessun giocatore scelto"];
} else {
	ctrlEnable[ctrlIDC _CbtnSendMessage, true];
	ctrlSetText[ctrlIDC _CchoosenPlayer, format ["%1", name life_cellphone_lockedDestination]];
};

// Got we a Direction switch ?
if(_mode == 20) then {
	if(_direction == "IN") then { _direction = "OUT"; } else { _direction = "IN"; };
};

// Setup direction
if(_direction == "IN") then {
	_getDir = 0;
	ctrlShow[ctrlIDC _CbtnOutbox, true];
	ctrlShow[ctrlIDC _CbtnInbox, false];
	ctrlSetText[ctrlIDC _CuserText,"Mittente"];
	ctrlSetText[ctrlIDC _CHeaderText,"Cellulare \ SMS System (Posta in entrata)"];
};
if(_direction == "OUT") then {
	_getDir = 1;
	ctrlShow[ctrlIDC _CbtnInbox, true];
	ctrlShow[ctrlIDC _CbtnOutbox, false];
	ctrlSetText[ctrlIDC _CuserText,"Destinatario"];
	ctrlSetText[ctrlIDC _CHeaderText,"Cellulare \ SMS System (Posta in uscita)"];
};

// Get da Messages
_mode = 0;
if(ctrlShown _CbtnPoliceBack && playerSide == west) then { _mode = 2; };
if(ctrlShown _CbtnAdminBack && (__GETC__(life_adminlevel) > 0)) then { _mode = 3; };
[[_mode,_getDir,player],"Comm_fnc_messageRequest",false] spawn life_fnc_MP;

[1] spawn life_fnc_cellphonePlayer;