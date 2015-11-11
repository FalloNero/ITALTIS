/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/
private["_barriers"];
_barriers = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_barriers") exitWith {};

if(([true,"barrier",1] call life_fnc_handleInv)) then
{
	titleText["Hai rimosso la barriera","PLAIN"];
	player removeAction life_action_barrierPickup;
	life_action_barrierPickup = nil;
	deleteVehicle _barriers;
};