/*
	File: fn_gangDeposite.sqf
	Author: Mario2002
	
	Description:
	deposites money in the gangs bank account
*/
private["_dialog","_gangList","_textCash", "_edit", "_selectedGang", "_currentGangCash", "_cashToDeposite", "_gang"];
disableSerialization;

_dialog = findDisplay 8650;
_gangList = _dialog displayCtrl 8653;
_textCash = _dialog displayCtrl 8651;
_edit = _dialog displayCtrl 8652;
_currentGangCash = parseNumber (ctrlText _textCash);
_cashToDeposite = ctrlText 8652;
_selectedGang = lbCurSel 8653;
_gang = player getVariable ["persistent_gang", []];

if(_cashToDeposite == "") exitWith {hint "No data!"};
_cashToDeposite = parseNumber _cashToDeposite;

if(_cashToDeposite > life_bucks) exitWith {hint "You do not have that much money!"};
if(_cashToDeposite <= 0) exitWith {hint "Invalid data"};

life_bucks = life_bucks - _cashToDeposite;
_currentGangCash = _currentGangCash + _cashToDeposite;
_textCash ctrlSetText format ["%1", _currentGangCash];

[[_cashToDeposite, playerSide, (_gang select 0), (_gang select 0), getPlayerUID player], "GANG_fnc_updateBankAccount", false, false] spawn life_fnc_MP;
[] call life_fnc_sessionUpdate;




