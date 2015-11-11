/*
	File: fn_gangTransfer.sqf
	Author: Mario2002
	
	Description:
	transfers money from one gang to another
*/
private["_dialog","_gangList","_textCash", "_edit", "_selectedGang", "_currentGangCash", "_cashToTransfer", "_gang"];
disableSerialization;

_dialog = findDisplay 8650;
_gangList = _dialog displayCtrl 8653;
_textCash = _dialog displayCtrl 8651;
_edit = _dialog displayCtrl 8652;
_currentGangCash = parseNumber (ctrlText _textCash);
_cashToTransfer = ctrlText 8652;
_selectedGang = lbCurSel 8653;
_gang = player getVariable ["persistent_gang", []];

if(_selectedGang == -1) exitWith {hint "No gang selected!"};
if(_cashToTransfer == "") exitWith {hint "No data!"};
_cashToTransfer = parseNumber _cashToTransfer;

if(_cashToTransfer > _currentGangCash) exitWith {hint "You don't have that much money!"};
if(_cashToTransfer <= 0) exitWith {hint "Invalid data"};

_currentGangCash = _currentGangCash - _cashToTransfer;
_textCash ctrlSetText format ["%1", _currentGangCash];

[[(_cashToTransfer * -1), playerSide, (_gang select 0), _gangList lbValue _selectedGang, getPlayerUID player], "GANG_fnc_updateBankAccount", false, false] spawn life_fnc_MP;
[[_cashToTransfer, playerSide, _gangList lbValue _selectedGang, (_gang select 0), getPlayerUID player], "GANG_fnc_updateBankAccount", false, false] spawn life_fnc_MP;

[] call life_fnc_sessionUpdate;




