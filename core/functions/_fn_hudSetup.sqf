/*
	File: fn_hudSetup.sqf
	Author: Caiden
	
	Description:
	Setups the A3L HUD
*/

//[] execVM "\hud\inithud.sqf";
_handle = execVM "hud\inithud.sqf";

("A3LHUD" call BIS_fnc_rscLayer) cutRsc ["a3lhud","PLAIN"]; //show

[] spawn
{
	while {true} do
	{
		sleep 120;
		("A3LHUD" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
		("A3LHUD" call BIS_fnc_rscLayer) cutRsc ["a3lhud","PLAIN"]; //show
	};
};