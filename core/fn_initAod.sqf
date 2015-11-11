
/*
	File: fn_initMerc.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	INIZIALIZZA AOD
*/


if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;

if ((uniform Player) == "U_B_CombatUniform_mcam") then
{
	player setObjectTextureGlobal [0,"aoduniform1.jpg"];
};

[] call life_fnc_initHouses;
[] call life_fnc_updateTexture;

/*
//SKINS START
[] spawn
{
while {true} do
   {
     waitUntil {uniform player == "U_B_CombatUniform_mcam"};
     player setObjectTextureGlobal [0,"aod_uni.jpg"];
     waitUntil {uniform player != "U_B_CombatUniform_mcam"};
   };
 };
 */