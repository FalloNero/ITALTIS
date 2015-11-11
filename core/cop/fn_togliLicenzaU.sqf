/*
	TOGLI BREVETTO DA SUB
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(_unit != player) exitWith {};

hint "Avviso: La polizia ti ha sequestrato il BREVETTO DA SUB (se ne eri in possesso).";

//license_civ_driver = false;
//license_civ_air = false;
license_civ_dive = false;
//license_civ_boat = false;
//license_civ_gun = false;
//license_civ_truck = false;
//license_civ_driver = false;
//license_civ_driver = false;

/*
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
    player unassignItem _x;
    player removeItem _x;
} foreach (assignedItems player);
*/