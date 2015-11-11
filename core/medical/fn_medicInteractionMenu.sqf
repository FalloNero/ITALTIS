/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	_dialog = createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
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
life_pInact_curTarget = _curTarget;

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

_actions = [];
_enabled = true;

//Revive Button
if ([life_pInact_curTarget] call life_fnc_CheckRevive)then
{
	_ctrltext = "RIANIMA";
	_action = "[life_pInact_curTarget] spawn life_fnc_revivePlayer; closeDialog 0;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];
};
//DRAG BUTTOn
if ([life_pInact_curTarget] call life_fnc_CheckDragging)then
{
	_ctrltext = "TRASCINA";
	_action = "[life_pInact_curTarget] spawn life_fnc_revDrag;closeDialog 0;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];
};
//CHECK BODY
if ([life_pInact_curTarget] call life_fnc_CheckRmvWeap)then
{
	_ctrltext = "CONTROLLA CORPO";
	_action = "closeDialog 0;[life_pInact_curTarget] spawn life_fnc_revRmvItems;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];
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