/*
File: fn_gatherEmerald.sqf

Description:
Gather Smeraldi
*/
private["_sum"];
_sum = ["emeraldu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_in_use = true;
titleText["Cercando smeraldi..","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"emeraldu",1] call life_fnc_handleInv)) then
{
playSound "bag"; // this only if you want the sound for the bag when you gather it 
titleText["Smeraldi trovati!","PLAIN"];
};
};

life_action_in_use = false;