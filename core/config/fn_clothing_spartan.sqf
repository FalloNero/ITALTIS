/*
	File: fn_clothing_spartan.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Spartan Corp."];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_O_Wetsuit",nil,500],
		["U_B_survival_uniform",nil,500],
		["U_I_CombatUniform","Uniforme Spartan",500]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Booniehat_dgtl",nil,100],
			["H_HelmetIA",nil,1000],
			["H_HelmetIA_net",nil,1000],
			["H_HelmetIA_camo",nil,1000],
			["H_HelmetLeaderO_ocamo",nil,1000],
			["H_MilCap_mcamo",nil,1000],
			["H_Shemag_khk",nil,1000],
			["H_Shemag_tan",nil,1000],
			["H_Shemag_olive_hs",nil,1000],
			["H_ShemagOpen_khk",nil,1000],
			["H_Watchcap_sgg",nil,1000],
			["H_Hat_camo",nil,1000]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Aviator","Rayban",100],
			["G_Goggles_VR",nil,100],
			["G_Combat",nil,100],
			["G_Tactical_Clear",nil,100],
			["G_Tactical_Black",nil,100],
			["G_O_Diving",nil,100],
			["G_Bandanna_beast",nil,100],
			["G_Bandanna_aviator",nil,100],
			["G_Bandanna_blk",nil,100],
			["G_Bandanna_khk",nil,100],
			["G_Bandanna_oli",nil,100],
			["G_Bandanna_shades",nil,100],
			["G_Bandanna_sport",nil,100],
			["G_Bandanna_tan",nil,100]
		];
	};

	//Vest
	case 3:
	{
		[
		
			["V_TacVest_camo",nil,30000],
			["V_RebreatherIA",nil,5000],
			["U_BG_leader",nil,5000],
			["U_OG_Guerilla1_1",nil,5000],
			["U_B_CTRG_2",nil,5000],
			["U_B_CTRG_3",nil,5000],
			["U_I_G_resistanceLeader_F",nil,5000]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_Carryall_oli",nil,5000],
			["B_Carryall_mcamo",nil,5000],
			["B_Carryall_oucamo",nil,5000]
		];
	};
};