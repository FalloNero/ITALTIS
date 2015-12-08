#include <macro.h>
/*
	Aggiorna la skin in base a tutta na serie de cose
	playerside e livello
	viene richiamato dal changecloth - buycloth - onplayerrespawn - auto ogni 2 minuti 


if (getPlayerUID player in["76561198142886037"]) then {
player setObjectTextureglobal [0, "#(rgb,8,8,3)color(1,0.2,1,1)"];

};


if (getPlayerUID player in["76561198033275427"]) then {
 player adduniform "U_C_Soldier_VR";
//player setObjectTextureglobal [0, "#(rgb,8,8,3)color(0.1,0,1,0.5)"];
};
*/
switch (playerSide) do {
case civilian:
{

if (license_civ_mafia) then {
	if ((uniform Player) == "U_Rangemaster") then
{
	player setObjectTextureGlobal [0,"texture\U_Rangemaster_mafia.jpg"];
};
	if ((uniform Player) == "U_I_CombatUniform") then
	{
	player setObjectTextureGlobal [0,"texture\U_I_CombatUniform_mafia.jpg"];
	};
};

if (license_civ_meccanico) then {
 if ((uniform Player) == "U_I_HeliPilotCoveralls") then
{
	//player setObjectTextureGlobal [0,"texture\ems_uniform.jpg"];
}else{
		player forceAddUniform "U_I_HeliPilotCoveralls";
		//player setObjectTextureGlobal [0,"texture\ems_uniform.jpg"];
	};

};
};

case west:
{
	if ((uniform Player) == "U_Rangemaster") then
{
	player setObjectTextureGlobal [0,"texture\police_uniform2.jpg"];
};
	if ((uniform Player) == "U_B_CombatUniform_mcam_vest") then
	{
	player setObjectTextureGlobal [0,"texture\police_uniform.jpg"];
	};
};

case independent:
{
   		if ((uniform Player) == "U_I_HeliPilotCoveralls") then
{
	player setObjectTextureGlobal [0,"texture\ems_uniform.jpg"];
}else{
		player forceAddUniform "U_I_HeliPilotCoveralls";
		player setObjectTextureGlobal [0,"texture\ems_uniform.jpg"];
	};
};

};
