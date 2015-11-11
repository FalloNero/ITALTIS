/*
File: fn_gatherGold.sqf

Description:
Gather Oro
*/
private["_sum"];
_sum = ["goldu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_in_use = true;
titleText["Cercando oro..","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"goldu",1] call life_fnc_handleInv)) then
{
playSound "bag"; // this only if you want the sound for the bag when you gather it 
titleText["Oro trovato!","PLAIN"];
};
};

life_action_in_use = false;