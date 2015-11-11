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
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_actions","_action","_enabled","_ctrltext","_nearObj"];
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

_objects = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F","Land_Money_F","il_money_stack_20"];
/////////////////////////////////////////////////////////////////////////NUOVA GESTIONE WIP//////////////////////
private ["_index"];
_index = 0;
_indexB = 1;
if (player distance life_vInact_curTarget < 3.5) then
{
	life_dropped_items = nearestObjects [life_vInact_curTarget,_objects,2];
	{
		if (!(_x getVariable["inUse",false])) then {		
			if (typeOf _x == "Land_Money_F")then
			{
				_ctrltext = "RACCOGLI DENARO";
				_action = format ["(life_dropped_items select %1) setVariable['inUse',TRUE,TRUE];[(life_dropped_items select %1)] spawn life_fnc_pickupMoney;closedialog 0;[life_vInact_curTarget] spawn life_fnc_pickupItemMenu",_index];		
			}else{
				if (typeOf _x == "il_money_stack_20")then
				{
					_ctrltext = "RACCOGLI BANCONOTE SEGNATE";
					_action = format ["(life_dropped_items select %1) setVariable['inUse',TRUE,TRUE];[(life_dropped_items select %1)] spawn life_fnc_pickupMoneyBank;closedialog 0;[life_vInact_curTarget] spawn life_fnc_pickupItemMenu",_index];		
				}else{
					_itemInfo = _x getVariable "item";
					_itemName = [([_itemInfo select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr;
					_ctrltext = format ["RACCOGLI %1",_itemName];
					_action = format ["[(life_dropped_items select %1)] spawn life_fnc_pickupItem;closedialog 0;[life_vInact_curTarget] spawn life_fnc_pickupItemMenu",_index];
				};
			};
			call compile format ["_Btn%1 ctrlSetText ""%2""",_indexB,_ctrltext] ;
			call compile format ["_Btn%1 buttonSetAction ""%2""",_indexB,_action] ;
			call compile format ["_Btn%1 ctrlEnable true",_indexB] ;
			call compile format ["_Btn%1 ctrlShow true",_indexB];
			_index = _index + 1;
			_indexB = _indexB + 1;
		};
	}foreach life_dropped_items;
};