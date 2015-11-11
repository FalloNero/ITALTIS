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
	_dialog = createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
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
life_vInact_curTarget = _curTarget;

/////////////////////////////////////////////////////////////////////////NUOVA GESTIONE WIP//////////////////////
_actions = [];
_enabled = true;

if((playerSide == west) or (playerSide == east)) then {
	_ctrltext = localize "STR_vInAct_Registration";
	_action = "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];

	_ctrltext = localize "STR_vInAct_SearchVehicle";
	_action  = "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];

	if(count crew _curTarget > 0) then {
		_ctrltext = localize "STR_vInAct_PullOut";
		_action  = "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		_enabled = true;
		_actions pushBack [_ctrltext,_action,_enabled];
	};

	_ctrltext = localize "STR_vInAct_Impound";
	_action  = "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];

	if ((life_vInact_curTarget getVariable ["ganascia",0]) == 1) then
	{
		_ctrltext = "RIMUOVI GANASCE";
		_action  = "[life_vInact_curTarget] spawn life_fnc_removeGanascia;";
		_enabled = true;
		_actions pushBack [_ctrltext,_action,_enabled];
	};
} else {

	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_ctrltext = localize "STR_vInAct_DeviceMine";
		_action =  "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_enabled = false;
		} else {
			_enabled =  true;
		};
		_actions pushBack [_ctrltext,_action,_enabled];
	};
};

if(_curTarget isKindOf "Ship") then {
	_ctrltext = localize "STR_vInAct_PushBoat";
	_action = "[] spawn life_fnc_pushObject; closeDialog 0;";
	if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _enabled = true;} else {_enabled = false};
	_actions pushBack [_ctrltext,_action,_enabled];
} else {
	if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
		_ctrltext = localize "STR_vInAct_GetInKart";
		_action = "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_enabled = true;} else {_enabled = false};
		_actions pushBack [_ctrltext,_action,_enabled];
	} else {
		_ctrltext = localize "STR_vInAct_Unflip";
		_action = "[life_vInact_curTarget] spawn life_fnc_FlipV; closeDialog 0;";
		if(count crew _curTarget == 0 ) then { _enabled = true;} else {_enabled = false;};
		_actions pushBack [_ctrltext,_action,_enabled];
	};
};
//DEAD PPL IN VEHICLE
if ([life_vInact_curTarget] call life_fnc_CheckPullOut)then
{
	_ctrltext = "PRELEVA FERITI";
	_action = "[life_vInact_curTarget] spawn life_fnc_revPullOut; closeDialog 0;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];
};
if("ToolKit" in (items player)) then {
	_ctrltext = localize "STR_vInAct_Repair";
	_action = "[life_vInact_curTarget] spawn life_fnc_repairTruck;";
	_enabled = true;
	_actions pushBack [_ctrltext,_action,_enabled];
};
if((life_vInact_curTarget isKindOf "Car" OR life_vInact_curTarget isKindOf "Air" OR life_vInact_curTarget isKindOf "Ship" OR life_vInact_curTarget isKindOf "Motorcycle") && player distance life_vInact_curTarget < 7 && vehicle player == player && alive life_vInact_curTarget) then
{
	if(life_vInact_curTarget in life_vehicles OR {!(life_vInact_curTarget getVariable ["locked",true])}) then
	{
		if(!(life_vInact_curTarget getVariable ["trunk_in_use",false])) then
		{
			_ctrltext = "APRI INVENTARIO";
			_action = "[life_vInact_curTarget] call life_fnc_openInventory;";
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