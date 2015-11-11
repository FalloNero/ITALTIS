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
ctrlSetText[3103,"Negozio Terroristi"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_BG_Guerilla1_1","Uniforme da Jihadista",500],
		["U_BG_leader","Uniforme dello Sceicco",1000]
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
			["V_BandollierB_blk",nil,10000],
			["V_Chestrig_blk",nil,15000],
			["V_HarnessO_brn",nil,20000],
			["V_TacVestIR_blk",nil,30000],
			["V_HarnessOGL_brn","giubotto esplosivo",100000]
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