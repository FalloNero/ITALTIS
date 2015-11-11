/*
	File: fn_onDeath.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does whatever it needs to when a player dies.
*/
private["_unit","_killer","_weapons","_handle"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_source = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

detach player;
moveOut player ;
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?

player setVariable ["FAR_isUnconscious", 0, true]; //FAROOQ REVIVE
player setVariable ["FAR_isDragged", 0, true]; //FAROOQ REVIVE
player setVariable ["ace_sys_wounds_uncon", false];//FAROOQ REVIVE
player setVariable ["FAR_isStabilized", 0, true];//FAROOQ REVIVE

	//DROGHE
	player setVariable["drug_lsd",false,true];
	player setVariable["drug_weed",false,true];
	player setVariable["drug_cocaine",false,true];
	life_drugged_cocaine = -1;
	life_drugged_weed = -1;
	//

	RemoveAllWeapons player;
	{player removeMagazine _x;} foreach (magazines player);
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeGoggles player;
	removeHeadGear player;
	player adduniform "U_C_Commoner1_1";
	player additem "ItemMap";
	player assignitem "ItemMap";

	
	
	

cutText["Waiting to respawn....","BLACK FADED"];
0 cutFadeOut 9999999;

if(playerSide == civilian) then
{
	removeAllContainers _unit;
};
//hideBody _unit;

// Remove all Items from dead body
RemoveAllWeapons _unit;
{_unit removeMagazine _x;} foreach (magazines _unit);
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadGear _unit;
hideBody _unit;

//Make my killer wanted!
if((alive _source) and ((side _source != west) or (side _source != east))) then
{
	if(vehicle _source isKindOf "LandVehicle") then
	{
		if(alive _source) then
		{
			[[getPlayerUID _source,name _source,"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	}
		else
	{
		[[getPlayerUID _source,name _source,"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
};

if((!life_use_atm) and ((side _source == west) or (side _source == east))) then
{
	if(life_cash != 0) then
	{
		[format["$%1 from the Federal Reserve robbery was returned from the robber being killed.",[life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_cash = 0;
	};
};

//New addition for idiots.
if(side _source == civilian && _source != _unit && !local _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then {
		[[2],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	} else {
		[[3],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	};
};

if((vehicle _source == _source && playerSide == civilian) and ((side _source == west) or (side _source == east))) then
{
	[[player,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	//[[getPlayerUID player],"life_fnc_wantedPunish",false,false] spawn life_fnc_MP;
}
	else
{
	if(playerSide == civilian) then
	{
		[[getPlayerUID _unit],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
};
//{ _unit removeAction _x; } foreach life_actions;

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_carryWeight = 0;
life_thirst = 100;
life_hunger = 100;
life_use_atm = true;
life_cash = 0;

closeDialog 0;
life_respawned = true;
[] spawn life_fnc_setupActions;
//SE MUOIO CANCELLA LA MIA ULTIMA POSIZIONE SALVATA
private ["_position"];
_position = [0,0,0];
life_lsposition = [0,0,0];
[_position] call SOCK_fnc_updateRequest;