/*
	File: fn_clothing_terroristi.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Negozio Mafia"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_Rangemaster","Scagnozzo",10000],
		["U_I_CombatUniform","Padrino",20000]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Shemag_khk",nil,1000],
			["H_Shemag_tan",nil,1000],
			["H_Shemag_olive",nil,1000],
			["H_Shemag_olive_hs",nil,1000],
			["H_ShemagOpen_khk",nil,1000],
			["H_ShemagOpen_tan",nil,1000]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Balaclava_blk",nil,500],
			["G_Balaclava_combat",nil,500],
			["G_Balaclava_lowprofile",nil,500],
			["G_Balaclava_oli",nil,500]
		];
	};

	//Vest
	case 3:
	{
		[
			["U_Rangemaster",nil,10000],
			["U_I_CombatUniform",nil,20000],
			["V_TacVest_blk",nil,35000]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_Carryall_ocamo",nil,5000]
		];
	};
};