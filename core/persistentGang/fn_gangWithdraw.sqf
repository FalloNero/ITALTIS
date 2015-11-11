/*
	File: fn_gangWithdraw.sqf
	Author: Mario2002
	
	Description:
	withdraws money from the gangs bank account
*/
private["_dialog","_gangList","_textCash", "_edit", "_selectedGang", "_currentGangCash", "_cashToWithdraw", "_gang"];
disableSerialization;

_dialog = findDisplay 8650;
_gangList = _dialog displayCtrl 8653;
_textCash = _dialog displayCtrl 8651;
_edit = _dialog displayCtrl 8652;
_currentGangCash = parseNumber (ctrlText _textCash);
_cashToWithdraw = ctrlText 8652;
_selectedGang = lbCurSel 8653;
_gang = player getVariable ["persistent_gang", []];

if(_cashToWithdraw == "") exitWith {hint "No data!"};
_cashToWithdraw = parseNumber _cashToWithdraw;

if(_cashToWithdraw > _currentGangCash) exitWith {hint "Not enough money in the gang's bank account!"};
if(_cashToWithdraw <= 0) exitWith {hint "Invalid data"};

life_bucks = life_bucks + _cashToWithdraw;
_currentGangCash = _currentGangCash - _cashToWithdraw;
_textCash ctrlSetText format ["%1", _currentGangCash];

[[(_cashToWithdraw * -1), playerSide, (_gang select 0), (_gang select 0),getPlayerUID player], "GANG_fnc_updateBankAccount", false, false] spawn life_fnc_MP;
[] call life_fnc_sessionUpdate;




