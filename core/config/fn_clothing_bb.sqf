/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_BG_Guerilla2_2","Abiti da contadino",100],
		["U_BG_Guerilla3_2","Vestiti da pezzente",100],
		["U_C_Poor_1","T-Shirt Blu e Jeans",100],
		["U_C_Poloshirt_blue","Polo Blu",200],
		["U_C_Poloshirt_burgundy","Polo Porpora",200],
		["U_C_Poloshirt_stripped","Polo Azzurra a strisce",200],
		["U_C_Poloshirt_tricolour","Polo Blu con Tricolore",200],
		["U_C_Poloshirt_salmon","Polo Rosa",200],
		["U_C_Poloshirt_redwhite","Polo Bianca e Rossa",200],
		["U_C_Journalist","Polo Nera e Jeans",350],
		["U_Rangemaster","Polo Blu e Jeans",350],
		["U_BG_Guerilla2_1","Camicia Nera e Jeans",400],
		["U_BG_Guerilla2_3","Camicia Blu e Jeans",400],
		["U_Competitor","Vestiti da bravo ragazzo",500],
		["U_NikosBody","Vestiti da cattivo ragazzo",500],
		["U_OrestesBody","Abiti da Surfer",1000],
		["U_NikosAgedBody","Abito Elegante",1000],
		["U_C_Scientist","Tuta Anti-Radiazioni",10000]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_Cap_red",nil,100],
			["H_Cap_blu",nil,100],
			["H_Cap_oli",nil,100],
			["H_Cap_tan",nil,100],
			["H_Cap_blk",nil,100],
			["H_Cap_grn",nil,100],
			["H_Bandanna_khk",nil,250],
			["H_Bandanna_cbr",nil,250],
			["H_Bandanna_surfer",nil,500],
			["H_Bandanna_surfer_blk",nil,500],
			["H_Bandanna_surfer_grn",nil,500],
			["H_StrawHat",nil,750],
			["H_StrawHat_dark",nil,750],
			["H_Hat_blue",nil,750],
			["H_Hat_grey",nil,750],
			["H_Cap_blk_CMMG","Cappello da Esaltato",1000],
			["H_Hat_camo","Cappello Elegante Mimetico",1250]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Aviator","Rayban",500],
			["G_Spectacles",nil,100],
			["G_Spectacles_Tinted",nil,100],
			["G_Squares",nil,100],
			["G_Squares_Tinted",nil,100],
			["G_Shades_Black",nil,100],
			["G_Shades_Blue",nil,100],
			["G_Shades_Green",nil,100],
			["G_Shades_Red",nil,100],
			["G_Sport_Blackred",nil,100],
			["G_Sport_BlackWhite",nil,100],
			["G_Sport_Blackyellow",nil,100],
			["G_Sport_Checkered",nil,100],
			["G_Sport_Greenblack",nil,100],
			["G_Sport_Red",nil,100],
			["G_Lady_Blue",nil,100],
			["G_Lady_Dark",nil,100],
			["G_Lady_Mirror",nil,100],
			["G_Lady_Red",nil,100]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_Rangemaster_belt","Cintura porta-oggetti",10000]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_OutdoorPack_tan",nil,1000],
			["B_HuntingBackpack",nil,1500],
			["B_AssaultPack_cbr",nil,2000],
			["B_Kitbag_cbr",nil,2500],
			["B_FieldPack_cbr",nil,3000],
			["B_Bergen_rgr",nil,3500],
			["B_Carryall_cbr",nil,5000]
		];
	};
};