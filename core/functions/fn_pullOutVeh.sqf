/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(playerSide == west OR (vehicle player == player)) exitWith {};
if((player getVariable "restrained")||((animationState player) == "Incapacitated")) then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};
player action ["Eject", vehicle player];
moveOut Player ;

disableUserInput false;
player setVariable ["lockedinveh",false,true];
titleText["Sei stato rimosso dal veicolo","PLAIN"];
titleFadeOut 4;
