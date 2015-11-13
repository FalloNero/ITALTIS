#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Weapons",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["V_HarnessOGL_brn", ["life_inv_oeroina",1,"life_inv_onapalm",1,"life_inv_oplatino",1,"life_inv_ocanapa",1]],
						["arifle_Mk20_F",["life_inv_ooro",1,"life_inv_onapalm",1]],
						["30Rnd_556x45_Stanag",["life_inv_benzina",3,"life_inv_ferro",3]],
						["muzzle_snds_L", ["life_inv_obenzina",1,"life_inv_oferro",1]],
						["muzzle_snds_M", ["life_inv_obenzina",1,"life_inv_ooro",1]],
						["muzzle_snds_H", ["life_inv_oplatino",1,"life_inv_onapalm",1]],
						["U_O_OfficerUniform_ocamo", ["life_inv_ocanapa",1]],
						["U_MillerBody", ["life_inv_ocanapa",1,"life_inv_oferro",1]],
						["H_HelmetB_camo", ["life_inv_ocanapa",1,"life_inv_orame",1]],
						["V_TacVest_khk", ["life_inv_ocanapa",1,"life_inv_oferro",1]],
						["RangeFinder", ["life_inv_oferro",1,"life_inv_oalluminio",1]]
					]
				];
			};
		};
	};
};
