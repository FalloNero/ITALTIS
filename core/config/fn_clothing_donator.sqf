#include <macro.h>
/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Edited by: J. Martinez
	
	Description:
	Master configuration file for Donator Clothing Store.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Donator Clothing Store"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(__GETC__(life_donator) == 1) then
		{
			_ret pushBack["U_I_G_Story_Protagonist_F","Cargo Military",2500];
			_ret pushBack["U_C_Scientist","Scienziato",1500];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_ret pushBack["U_I_G_Story_Protagonist_F","Cargo Military",2500];
			_ret pushBack["U_C_Scientist","Scienziato",1500];
			_ret pushBack["U_C_Journalist","Giornalista",2000];
			_ret pushBack["U_I_CombatUniform","Guerrigliero",3000];
			_ret pushBack["U_IG_leader","Rivoluzionario",3500];
			
		};
		if(__GETC__(life_donator) == 3) then
		{
			_ret pushBack["U_I_G_Story_Protagonist_F","Cargo Military",2500];
			_ret pushBack["U_C_Scientist","Scienziato",1500];
			_ret pushBack["U_C_Journalist","Giornalista",2000];
			_ret pushBack["U_I_CombatUniform","Guerrigliero",3000];
			_ret pushBack["U_IG_leader","Rivoluzionario",3500];
			_ret pushBack["U_I_G_resistanceLeader_F","Tattooed",5000];	
			_ret pushBack["rds_uniform_priest","Prete Ortodosso",1500];
			_ret pushBack["U_B_PilotCoveralls","Pilota",2500];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_ret pushBack["U_I_G_Story_Protagonist_F","Cargo Military",2500];
			_ret pushBack["U_C_Scientist","Scienziato",1500];
			_ret pushBack["U_C_Journalist","Giornalista",2000];
			_ret pushBack["U_I_CombatUniform","Guerrigliero",3000];
			_ret pushBack["U_IG_leader","Rivoluzionario",3500];
			_ret pushBack["U_I_G_resistanceLeader_F","Tattooed",5000];
			_ret pushBack["rds_uniform_priest","Prete Ortodosso",1500];
			_ret pushBack["U_B_PilotCoveralls","Pilota",2500];
			_ret pushBack["U_KerryBody","Paramilitare",5000];
			_ret pushBack["vip_clothes","VIP",3500];
		};
		if(__GETC__(life_donator) == 5) then
		{
			_ret pushBack["U_I_G_Story_Protagonist_F","Cargo Military",2500];
			_ret pushBack["U_C_Scientist","Scienziato",1500];
			_ret pushBack["U_C_Journalist","Giornalista",2000];
			_ret pushBack["U_I_CombatUniform","Guerrigliero",3000];
			_ret pushBack["U_IG_leader","Rivoluzionario",3500];
			_ret pushBack["U_I_G_resistanceLeader_F","Tattooed",5000];
			_ret pushBack["rds_uniform_priest","Prete Ortodosso",1500];
			_ret pushBack["U_B_PilotCoveralls","Pilota",2500];
			_ret pushBack["U_KerryBody","Paramilitare",5000];
			_ret pushBack["vip_clothes","VIP",3500];
			_ret pushBack["A3L_SECRET","Scheletro",7500];
			_ret pushBack["A3L_SpookyMummy","Mummia",7500];
			_ret pushBack["A3L_zombie","Zombie",7500];
			_ret pushBack["A3L_bikini_girl","Bikini Girl",7500];
		};
		
	};

	//Hats
	case 1:
	{
		if(__GETC__(life_donator) == 1) then
		{
			//_ret pushBack["Max_police_hat","Cop Hat",150]];
		};
		if(__GETC__(life_donator) == 2) then
		{
			//_ret pushBack["H_Watchcap_blk",nil,500]];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_ret pushBack["H_Shemag_olive","Copricapo Verde",500];
			_ret pushBack["H_Shemag_khk","Copricapo Khaki",500];
			_ret pushBack["H_ShemagOpen_khk","Copricapo Khaki open",500];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_ret pushBack["H_Shemag_olive","Copricapo Verde",500];
			_ret pushBack["H_Shemag_khk","Copricapo Khaki",500];
			_ret pushBack["H_ShemagOpen_khk","Copricapo Khaki open",500];
			_ret pushBack["H_Booniehat_DMARPAT","Boonie Sand",500];
			_ret pushBack["H_Booniehat_GCAMO","Boonie Camo",500];
			_ret pushBack["H_CrewHelmetHeli_B","Pilot Helmet",500];	
		};
		if(__GETC__(life_donator) == 5) then
		{
			_ret pushBack["H_Shemag_olive","Copricapo Verde",500];
			_ret pushBack["H_Shemag_khk","Copricapo Khaki",500];
			_ret pushBack["H_ShemagOpen_khk","Copricapo Khaki open",500];
			_ret pushBack["H_Booniehat_DMARPAT","Boonie Sand",500];
			_ret pushBack["H_Booniehat_GCAMO","Boonie Camo",500];
			_ret pushBack["H_CrewHelmetHeli_B","Pilot Helmet",500];
			_ret pushBack["A3L_Halloween_PredatorMask","Predator Mask",1500];
			_ret pushBack["A3L_Halloween_Pumpkinhead","Pumpkin Head",1500];
			_ret pushBack["A3l_Halloween_Jigsaw","JigSaw",1500];
		};	
	};

	//Glasses
	case 2:
	{
		if(__GETC__(life_donator) > 2) then
		{
			_ret pushBack["G_Balaclava_blk",nil,1000];
			_ret pushBack["G_Balaclava_combat",nil,1000];
			_ret pushBack["G_Balaclava_lowprofile",nil,1000];
			_ret pushBack["G_Balaclava_oli",nil,1000];
		};
		if(__GETC__(life_donator) > 3) then
		{
			
			_ret pushBack["Kio_Balaclava_blk","Black Balaclava",1000];
			_ret pushBack["Kio_Balaclava_grn","Green Balaclava",1000];
			_ret pushBack["Kio_Balaclava_blkSkull","Skull Balaclava",1500];
			_ret pushBack["Kio_Balaclava_des","Desert Balaclava",1500];
			_ret pushBack["Mask_m40_OD","Antigas M40V",3000];
			
		};
	};

	//Vest
	case 3:
	{
		if(__GETC__(life_donator) == 1) then
		{
			_ret pushBack["V_BandollierB_cbr",nil,25000];
			_ret pushBack["V_BandollierB_blk",nil,25000];
			
		};
		if(__GETC__(life_donator) == 2) then
		{
			_ret pushBack["V_BandollierB_cbr",nil,25000];
			_ret pushBack["V_BandollierB_blk",nil,25000];
			_ret pushBack["V_Chestrig_khk",nil,30000];
			_ret pushBack["V_Chestrig_blk",nil,30000];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_ret pushBack["V_BandollierB_cbr",nil,25000];
			_ret pushBack["V_BandollierB_blk",nil,25000];
			_ret pushBack["V_Chestrig_khk",nil,30000];
			_ret pushBack["V_Chestrig_blk",nil,30000];
			_ret pushBack["V_HarnessO_brn",nil,35000];
			_ret pushBack["V_HarnessOGL_brn",nil,35000];
			_ret pushBack["V_Press_F","Press Vest",45000];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_ret pushBack["V_BandollierB_cbr",nil,25000];
			_ret pushBack["V_BandollierB_blk",nil,25000];
			_ret pushBack["V_Chestrig_khk",nil,30000];
			_ret pushBack["V_Chestrig_blk",nil,30000];
			_ret pushBack["V_HarnessO_brn",nil,35000];
			_ret pushBack["V_HarnessOGL_brn",nil,35000];
			_ret pushBack["V_Press_F","Press Vest",45000];
			_ret pushBack["V_TacVest_brn",nil,50000];
		};
		if(__GETC__(life_donator) == 5) then
		{
			_ret pushBack["V_BandollierB_cbr",nil,25000];
			_ret pushBack["V_BandollierB_blk",nil,25000];
			_ret pushBack["V_Chestrig_khk",nil,30000];
			_ret pushBack["V_Chestrig_blk",nil,30000];
			_ret pushBack["V_HarnessO_brn",nil,35000];
			_ret pushBack["V_HarnessOGL_brn",nil,35000];
			_ret pushBack["V_Press_F","Press Vest",45000];
			_ret pushBack["V_TacVest_brn",nil,50000];
			_ret pushBack["a3l_spookyvest",nil,5000];
			_ret pushBack["a3l_spidervest",nil,5000];
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			
		];
	};
};

_ret;