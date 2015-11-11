/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Picks up money
*/
if((time - life_action_delay) < 1.3) exitWith {
    hint "You can't rapidly use action keys!";
    if(!isNil {(_this select 0) getVariable "inUse"}) then {
        _this select 0 setVariable["inUse",false,true];
    };
};
life_action_delay = time;
private["_obj","_val"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_stack = _obj getVariable "qta_money";

if (bank_vault getVariable "vault_hacked") then
{
	if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj setVariable["inUse",false,true];};};
	if(_stack <= 0)exitWith {deletevehicle _obj}; 

	_stack = _stack - 40000;
	life_cash = life_cash + 40000;
	life_bank_cash = life_bank_cash + 40000;
	if (currentWeapon player == primaryWeapon player)then
	{
		player playmove	"AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";	
	}else{
		if (currentWeapon player == primaryWeapon player)then
		{
			player playmove "AinvPercMstpSrasWpstDnon_Putdown_AmovPercMstpSrasWpstDnon";			
		}else{
			player playmove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"
		};
	};



	if (_stack == 0) then {
		deleteVehicle _obj;
	}else{
		_obj setVariable ["qta_money",_stack,true];
	};
	[] call life_fnc_atmDisableTimer;
	titleText[format[localize "STR_NOTF_PickedMoneyBank",[40000] call life_fnc_numberText],"PLAIN"];
};
_this select 0 setVariable["inUse",false,true];