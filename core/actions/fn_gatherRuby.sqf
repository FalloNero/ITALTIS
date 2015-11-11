/*
File: fn_gatherRuby.sqf

Description:
Gather Rubini
*/
private["_sum"];
_sum = ["rubyu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_in_use = true;
titleText["Cercando rubini..","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"rubyu",1] call life_fnc_handleInv)) then
{
playSound "bag"; // this only if you want the sound for the bag when you gather it 
titleText["Rubini trovati!","PLAIN"];
};
};

life_action_in_use = false;