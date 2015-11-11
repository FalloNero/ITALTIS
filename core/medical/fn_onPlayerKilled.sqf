/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_numMed"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
life_corpse = _unit;
//_unit removeWeapon (currentWeapon _unit);
hideBody _unit;

titleText ["", "BLACK FADED"];

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {alive _killer} && (side _killer != west) && (side _killer != east)) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

		if(!local _killer) then {
			//[[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	};
};
if(!isNull _killer && {_killer != _unit}) then
{
	if ((side player != west) or (side player != east)) then
	{
		life_respawn_timer = life_respawn_timer + 1;
	};
};

//Killed by cop stuff...
if((side _killer == west && playerSide != west) or (side _killer == east && playerSide != east)) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[life_bank_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};


if (FAR_killed) then
{
	closeDialog 0;
	FAR_killed = false;
	life_respawned = true;
}else{
	FAR_killed = true;
};


_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0;
life_bank_cash = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
if (side player != west) then
{
	[3] call SOCK_fnc_updatePartial;
};