/*
	File: fn_clothingConfig.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config for clothing shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Poloshirt_blue","Poloshirt Blue",50],
		["U_C_Poloshirt_burgundy","Poloshirt Burgundy",50],
		["U_C_Poloshirt_redwhite","Poloshirt Red/White",50],
		["U_C_Poloshirt_salmon","Poloshirt Salmon",50],
		["U_C_Poloshirt_stripped","Poloshirt stripped",50],
		["U_C_Poloshirt_tricolour","Poloshirt Tricolor",75],
		["U_C_Poor_2","Rag tagged clothes",75],
		["U_IG_Guerilla2_2","Green stripped shirt & Pants",100],
		["U_IG_Guerilla3_1","Brown Jacket & Pants",100],
		["U_IG_Guerilla2_3","The Outback Rangler",80],
		["U_C_HunterBody_grn","The Hunters Look",100],
		["U_C_WorkerCoveralls","Mechanic Coveralls",100],
		["U_OrestesBody","Surfing On Land",50]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",20],
			["H_Bandanna_surfer","Surfer Bandanna",20],
			["H_Bandanna_gry","Grey Bandanna",20],
			["H_Bandanna_khk","Khaki Bandanna",20],
			["H_Bandanna_sgg","Sage Bandanna",20],
			["H_StrawHat","Straw Fedora",20],
			["H_BandMask_blk","Hat & Bandanna",20]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		[

		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_mcamo",nil,1250],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,5000]
		];
	};
};