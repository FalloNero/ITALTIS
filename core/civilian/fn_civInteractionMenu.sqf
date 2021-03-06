/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_actions","_action","_enabled","_ctrltext"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_vInact_curTarget = _curTarget;

_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;


/////////////////////////////////////////////////////////////////////////NUOVA GESTIONE WIP//////////////////////
_actions = [];
_enabled = true;
if (player distance life_vInact_curTarget < 3.5) then
{
	if (isPlayer life_vInact_curTarget) then
	{
		_ctrltext = "SALUTA";
		_action = "call life_fnc_sayhi;";
		_enabled = true;
		_actions pushBack [_ctrltext,_action,_enabled];
	
		if ( animationState life_vInact_curTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") then
		{
			_ctrltext = "RUBA DENARO";
			_action = "[life_vInact_curTarget] spawn life_fnc_robAction;";
			if(!(life_vInact_curTarget getVariable["robbed",FALSE])) then {_enabled = true;} else {_enabled = false;};
			_actions pushBack [_ctrltext,_action,_enabled];
		};
		if ( animationState life_vInact_curTarget == "Incapacitated") then
		{
			_ctrltext = "RUBA DENARO";
			_action = "[life_vInact_curTarget] spawn life_fnc_robAction;";
			if(!(life_vInact_curTarget getVariable["robbed",FALSE])) then {_enabled = true;} else {_enabled = false;};
			_actions pushBack [_ctrltext,_action,_enabled];
		};
		if ( animationState life_vInact_curTarget == "KIA_gunner_standUp01") then
		{
			_ctrltext = "RUBA DENARO";
			_action = "[life_vInact_curTarget] spawn life_fnc_robAction;";
			if(!(life_vInact_curTarget getVariable["robbed",FALSE])) then {_enabled = true;} else {_enabled = false;};
			_actions pushBack [_ctrltext,_action,_enabled];
		};
		if ( animationState life_vInact_curTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") then
		{
			_ctrltext = "DISARMA";
			_action = "[[],""life_fnc_disarm"",life_vInact_curTarget,false] spawn life_fnc_MP";
			_enabled = true;
			_actions pushBack [_ctrltext,_action,_enabled];
		};
		if ( animationState life_vInact_curTarget == "Incapacitated") then
		{
			_ctrltext = "DISARMA";
			_action = "[[],""life_fnc_disarm"",life_vInact_curTarget,false] spawn life_fnc_MP";
			_enabled = true;
			_actions pushBack [_ctrltext,_action,_enabled];
		};
		if ( animationState life_vInact_curTarget == "KIA_gunner_standUp01") then
		{
			_ctrltext = "DISARMA";
			_action = "[[],""life_fnc_disarm"",life_vInact_curTarget,false] spawn life_fnc_MP";
			_enabled = true;
			_actions pushBack [_ctrltext,_action,_enabled];
		};
	}else{
		if ((typeOf life_vInact_curTarget) == "il_money_stack_500s" && {!(life_vInact_curTarget getVariable["inUse",false])}) then
		{
			_ctrltext = "RUBA DENARO";
			_action = "life_vInact_curTarget setVariable[""inUse"",TRUE,TRUE];_handle = [life_vInact_curTarget] spawn life_fnc_pickupVaultMoney;";
			_enabled = true;
			_actions pushBack [_ctrltext,_action,_enabled];
		};
	};
};

private ["_index"];
_index = 1;
{
	call compile format ["_Btn%1 ctrlSetText (_x select 0)",_index] ;
	call compile format ["_Btn%1 buttonSetAction (_x select 1)",_index] ;
	call compile format ["_Btn%1 ctrlEnable (_x select 2)",_index] ;
	call compile format ["_Btn%1  ctrlShow true",_index];
	_index = _index + 1;
}foreach (_actions);
