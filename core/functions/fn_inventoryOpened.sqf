/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
[] call life_fnc_updateTexture;

_unit = _this select 0;
_container = _this select 1;
_target = cursorTarget ;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && side _unit != west && (group _unit) != (group _target) ) then {
	if (animationstate _target != "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") then
	{
		if (animationstate _target != "Incapacitated") then
		{
			hint localize "STR_MISC_Backpack";
			[] spawn {
				waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
			};
		}else{
			[] spawn {
				waitUntil {animationstate _target != "Incapacitated"};
				closeDialog 0;
			};
		};
	}else{
		[] spawn {
			waitUntil {animationstate _target != "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"};
			closeDialog 0;
		};
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};