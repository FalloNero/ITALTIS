#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_targetType"];
if (isNull life_unit_escorted)then
{
	_curTarget = cursorTarget;
}else{
	_curTarget = life_unit_escorted ;
};
_targetType = typeOf cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	} else {
		if(((playerSide == civilian) or (playerSide == independent)) and (!life_action_gathering))then {
 			_handle = [] spawn life_fnc_gather;
 			waitUntil {scriptDone _handle};
			life_action_gathering = false;
		};
	};
};

if( (_curTarget isKindOf "House_F" OR _curTarget isKindOf "House_EP1") && {player distance _curTarget < 12}) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
/*
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [east,west,independent]}) exitWith {
	//Hotfix code by ins0
	if((((playerSide == blufor) or (playerSide == east)) && {(call life_revive_cops)}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};
*/

//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget getVariable["FAR_isUnconscious",0] == 1) && !dialog) then {
			[_curTarget] call life_fnc_medicInteractionMenu;
	}else{
		if((_curTarget getVariable["restrained",false]) and ((playerSide == west) or (playerSide == east)) && !dialog) then {
			[_curTarget] call life_fnc_copInteractionMenu;
		}else{
			if ((playerSide == civilian)&& !dialog) then
			{
				[_curTarget] call life_fnc_civInteractionMenu;
			};
		};
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money","_bankmoney","_vaultmoney"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_isFurniture = if(typeOf _curTarget in life_furniture_items) then {true} else {false};
	_objects = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F","Land_Money_F","il_money_stack_20"];
	_plants = ["FRS_cannabisPlant","FRS_cannabisPlantF"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];

	_vaultmoney = "il_money_stack_500s";
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	}else{
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			if (_isFurniture) then
			{
				[_curTarget] call life_fnc_furnInteractionMenu;
			}else{
			//OK, it wasn't a vehicle so let's see what else it could be?
				if((typeOf _curTarget) in _objects) then {
					[_curTarget] spawn life_fnc_pickupItemMenu;
				} else {
					if((typeOf _curTarget) == _vaultmoney && {!(_curTarget getVariable["inUse",false])} && !dialog && playerSide == civilian) then {
						[_curTarget] call life_fnc_civInteractionMenu;		
					}else{
						if((typeOf _curTarget) in _plants && {!(_curTarget getVariable["inUse",false])} && !dialog) then {
							[_curTarget] call life_fnc_harvestPlantMenu;		
						};
					};
				};
			};
		};
	};
};
