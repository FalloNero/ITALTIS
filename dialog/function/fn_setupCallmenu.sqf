#include <macro.hpp>
/*
	File: fn_setupCallmenu.sqf
	Author: MarioF
	
	Description:
	Sets up the Call menu
	MODES: 0 - Normal Message, 1 - Polizeinachrich, 2 - Emergency, 3 - Admin
*/

private["_mode","_permission","_display"];
disableSerialization;

_mode = [_this,0,-1] call BIS_fnc_param;

if(isNull findDisplay 3200 || _mode == -1) exitWith {};

_display = findDisplay 3200;
_CbtnPoliceBack = _display displayCtrl 3218;
_CbtnAdminBack = _display displayCtrl 3219;

// Find requestet permission level
if(ctrlShown _CbtnPoliceBack && ((playerSide == west) or (playerSide == east))) then { _mode = 1; };
if(ctrlShown _CbtnAdminBack && (__GETC__(life_adminlevel) > 0)) then { _mode = 3; };

//closeDialog 3200;
createDialog "call_menu";
waitUntil {!isNull findDisplay 3700};

_display = findDisplay 3700;
_CHeaderText = _display displayCtrl 3701;
_CmsgText = _display displayCtrl 3702;
_CbtnPlayerMSG = _display displayCtrl 3703;
_CbtnPlayerCall = _display displayCtrl 3704;
_CbtnEmgPoliceMSG = _display displayCtrl 3707;
_CbtnEmgPoliceCall = _display displayCtrl 3708;
_CbtnMedicMSG = _display displayCtrl 3705;
_CbtnMedicCall = _display displayCtrl 3706;
_CbtnAdminALL = _display displayCtrl 3709;
_CbtnAdminMSG = _display displayCtrl 3715;


// Alle Buttons ausblenden
ctrlShow[ctrlIDC _CbtnPlayerMSG, false];
ctrlEnable[ctrlIDC _CbtnPlayerMSG, false];
ctrlShow[ctrlIDC _CbtnPlayerCall, false];
ctrlEnable[ctrlIDC _CbtnPlayerCall, false];
ctrlShow[ctrlIDC _CbtnEmgPoliceMSG, false];
ctrlEnable[ctrlIDC _CbtnEmgPoliceMSG, false];
ctrlShow[ctrlIDC _CbtnEmgPoliceCall, false];
ctrlEnable[ctrlIDC _CbtnEmgPoliceCall, false];
ctrlShow[ctrlIDC _CbtnMedicMSG, false];
ctrlEnable[ctrlIDC _CbtnMedicMSG, false];
ctrlShow[ctrlIDC _CbtnMedicCall, false];
ctrlEnable[ctrlIDC _CbtnMedicCall, false];
ctrlShow[ctrlIDC _CbtnAdminALL, false];
ctrlEnable[ctrlIDC _CbtnAdminALL, false];
ctrlShow[ctrlIDC _CbtnAdminMSG, false];
ctrlEnable[ctrlIDC _CbtnAdminMSG, false];

// Normale Nachricht
if(_mode == 0) then {
	if(isNull life_cellphone_lockedDestination) then {
		closeDialog 3700;
		hint format["Die Person scheint Offline zu sein!"];
	} else {
		ctrlSetText[ctrlIDC _CHeaderText, format["Kontakt mit %1 herstellen", name life_cellphone_lockedDestination]];
		ctrlShow[ctrlIDC _CbtnPlayerMSG, true];
		ctrlEnable[ctrlIDC _CbtnPlayerMSG, true];
		ctrlShow[ctrlIDC _CbtnPlayerCall, true];
		ctrlEnable[ctrlIDC _CbtnPlayerCall, false];
	};
};

if(_mode == 1) then {
	if(isNull life_cellphone_lockedDestination) then {
		closeDialog 3700;
		hint format["Die Person scheint Offline zu sein!"];
	} else {
		_CHeaderText ctrlSetBackgroundColor [0.0,0.6,0.9,0.8];
		ctrlSetText[ctrlIDC _CHeaderText, format["%1 im Namen der Polizei kontaktieren", name life_cellphone_lockedDestination]];
		ctrlShow[ctrlIDC _CbtnPlayerMSG, true];
		ctrlEnable[ctrlIDC _CbtnPlayerMSG, true];
		ctrlShow[ctrlIDC _CbtnPlayerCall, true];
		ctrlEnable[ctrlIDC _CbtnPlayerCall, false];
		_CbtnPlayerMSG ctrlSetEventHandler ["ButtonClick", "[1] spawn life_fnc_callSendMsg;"];
	};
};

if(_mode == 2) then {
	ctrlSetText[ctrlIDC _CHeaderText,"Noturfnummern Altis"];
	ctrlShow[ctrlIDC _CbtnEmgPoliceMSG, true];
	ctrlEnable[ctrlIDC _CbtnEmgPoliceMSG, true];
	ctrlShow[ctrlIDC _CbtnEmgPoliceCall, true];
	ctrlEnable[ctrlIDC _CbtnEmgPoliceCall, false];
	ctrlShow[ctrlIDC _CbtnMedicMSG, true];
	ctrlEnable[ctrlIDC _CbtnMedicMSG, true];
	ctrlShow[ctrlIDC _CbtnMedicCall, true];
	ctrlEnable[ctrlIDC _CbtnMedicCall, false];
	ctrlShow[ctrlIDC _CbtnAdminMSG, true];
	ctrlEnable[ctrlIDC _CbtnAdminMSG, true];
};

if(_mode == 3) then {
	_CHeaderText ctrlSetBackgroundColor [1.0,0.0,0.0,0.8];
	ctrlShow[ctrlIDC _CbtnAdminALL, true];
	ctrlEnable[ctrlIDC _CbtnAdminALL, true];
	ctrlShow[ctrlIDC _CbtnPlayerMSG, true];
	if(isNull life_cellphone_lockedDestination) then {
		ctrlSetText[ctrlIDC _CHeaderText,"Adminnachricht an alle senden"];
	} else {
		ctrlSetText[ctrlIDC _CHeaderText, format["Eine Adminnachricht an %1 oder alle versenden!", name life_cellphone_lockedDestination]];
		ctrlEnable[ctrlIDC _CbtnPlayerMSG, true];
		_CbtnPlayerMSG ctrlSetEventHandler ["ButtonClick", "[2] spawn life_fnc_callSendMsg;"];
	};
};