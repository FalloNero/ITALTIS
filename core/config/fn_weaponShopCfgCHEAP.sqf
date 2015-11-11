#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop","_weap","_app"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {_weap = "Non sei un poliziotto!"};
			case (__GETC__(life_coplevel)  > 0):
			{
			_weap = ["Negozio Poliziotti",
					[
						["NVGoggles_OPFOR","Visore Notturno",1000],
						["FirstAidKit","Kit Pronto Soccorso",250],
						["ToolKit","Kit di Riparazione",250],
						["Binocular","Binocolo",200],
						["ItemGPS","GPS",100],
						["ItemRadio","Radio",100],
						["ItemMap","Mappa",100],
						["ItemWatch","Orologio",100],
						["ItemCompass","Bussola",100],
						["acc_flashlight","Torcia per fucili",500],
						["acc_pointer_IR","Puntatore Infrarosso per fucili",500],
						["hgun_P07_snds_F","Tazer",1000],
						["16Rnd_9x21_Mag","Caricatore 16Rnd Tazer",100],
						["SMG_01_F","Vermin 45 acp",40000],
						["30Rnd_45ACP_Mag_SMG_01","Caricatore Vermin",150]
					]
				];
				if (__GETC__(life_coplevel)  > 1) then //COP LEV. 2
				{
					_app = _weap select 1;			
					_app pushBack ["hgun_Pistol_heavy_01_MRD_F","4-Five .45ACP",5000];
					_app pushBack ["11Rnd_45ACP_Mag","Caricatore 11Rnd 4-Five",200];
					_app pushBack ["SMG_01_Holo_pointer_snds_F","Vermin Silenziato .45ACP",50000];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 2) then //COP LEV. 3
				{
					_app = _weap select 1;
					_app pushBack ["arifle_MXC_Black_F","MXC nero",60000];
					_app pushBack ["30Rnd_65x39_caseless_mag","Caricatore MXC",200];
					_app pushBack ["optic_Holosight","Ottica Holo 1x",1000];
					_app pushBack ["optic_Hamr","Ottica RCO 2x",2000];
					_app pushBack["muzzle_snds_H","Silenziatore 6.5mm",20000];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 3) then //COP LEV 4
				{
					_app = _weap select 1;
					_app pushBack["arifle_MX_F","Assult Rifle MX 6.5mm",80000];
					_app pushBack["bipod_02_F_blk",nil,500];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 4) then //COP LEV 5
				{
					_app = _weap select 1;
					_app pushBack ["arifle_MX_Black_F","Assult Rifle MX 6.5mm",80000];
					_app pushBack ["100Rnd_65x39_caseless_mag","Caricatore 100Rnd MX SW",500];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 5) then //COP LEV 6 
				{
					_app = _weap select 1;
					_app pushBack["arifle_MXM_Black_F","MXM Nero",160000];
					_app pushBack["Rangefinder","Telemetro",5000];
					_weap set [1,_app];
				};
			};
		};
	};

	case "cop_mexico":
	{
		switch(true) do
		{
			case (playerSide != east): {_weap = "Non sei un poliziotto messicano!"};
			case (__GETC__(life_coplevel)  > 0):
			{
			_weap = ["Negozio Poliziotti",
					[
						["ToolKit",nil,200],
						["FirstAidKit",nil,200],
						["Medikit",nil,1000],
						["pmc_earpiece","Visore Notturno",500],
						["Binocular",nil,100],
						["itemmap",nil,150],
						["itemcompass",nil,150],
						["ItemGPS",nil,300],
						["itemradio",nil,150],
						["itemwatch",nil,150],
						["acc_flashlight","Torcia per Fucili",500],
						["MineDetector",nil,200],
						["Chemlight_red",nil,50],
						["Chemlight_yellow",nil,50],
						["Chemlight_green",nil,50],
						["Chemlight_blue",nil,50],
						["RH_g17","Glock G17C",2000],
						["RH_17Rnd_9x19_g17","G17 17Rnd 9x19",100],
						["Taser_26","Tazer",2000],
						["26_cartridge","Caricatore Tazer",100]

					]
				];
				if (__GETC__(life_coplevel)  > 1) then //COP LEV. 2
				{
					_app = _weap select 1;
					_app pushBack ["RH_m9","M9 Beretta",2000];
					_app pushBack ["RH_15Rnd_9x19_M9","M9 15Rnd 9x19",100];
					_app pushBack ["R3F_MP5SD","H&K MP5",6000];
					_app pushBack ["R3F_30rnd_9x19_MP5","MP5 30Rnd 9x19",300];
					_app pushBack ["optic_Holosight","Ottica Holo 1-2x",1000];
					_app pushBack ["rh_eotech553","Ottica Holo Nera 1-2x",1000];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 2) then //COP LEV. 3
				{
					_app = _weap select 1;
					_app pushBack ["gign_shield","Scudo Antisommossa",1000];
					_app pushBack ["SmokeShellBlue","Lacrimogeno",100];
					_app pushBack ["RH_uspm","H&K USP Match",4000];
					_app pushBack ["RH_16Rnd_40cal_usp","USP 16Rnd .40SW",200];
					_app pushBack ["M4_Benelli","Benelli M4",4000];
					_app pushBack ["8Rnd_B_Beneli_74Slug","Benelli 8Rnd Cal.12",200];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 3) then //COP LEV 4
				{
					_app = _weap select 1;
					_app pushBack ["Rangefinder","Telemetro",1000];
					_app pushBack ["HandGrenade_Stone","Flashbang",100];
					_app pushBack ["rh_m4sbr_b","Vltor SBR",8000];
					_app pushBack ["RH_30Rnd_556x45_Mk262","SBR 30Rnd 5,56x45 FMJ",300];
					_app pushBack ["rh_ta31rco","Ottica TA31 RCO 1-6x",1500];
					_app pushBack ["muzzle_snds_M","Silenziatore Vltor SBR",1000];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 4) then //COP LEV 5
				{
					_app = _weap select 1;
					_app pushBack ["RH_kimber_nw","M1911 Kimber",6000];
					_app pushBack ["RH_7Rnd_45cal_m1911","M1911 Rounds",200];
					_app pushBack ["RH_m16a3","Colt M16A3",10000];
					_app pushBack ["RH_30Rnd_556x45_Mk262","M16A3 30Rnd 5,56x45 FMJ",300];
					_app pushBack ["RH_qdss_nt4","Silenziatore M16",1000];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 5) then //COP LEV 6 
				{
					_app = _weap select 1;
					_app pushBack ["RH_python","Colt Python",600];
					_app pushBack ["RH_6Rnd_357_Mag","Python 6Rnd .357 Magnum",200];
					_app pushBack ["R3F_HK417L","H&K HK417",12250];
					_app pushBack ["R3F_20Rnd_762x51_HK417","HK417 20Rnd 7,62x51",500];
					_app pushBack ["R3F_SILENCIEUX_HK417","Silenziatore HK417",1000];
					_app pushBack ["R3F_NF42","Night Force 42x",3000];
					_app pushBack ["Trixie_CZ550","CZ 550",15000];
					_app pushBack ["Trixie_CZ550_Mag","CZ 5Rnd 9.3x62",500];
					_weap set [1,_app];
				};
				if (__GETC__(life_coplevel)  > 6) then //COP LEV 7 
				{
					_app = _weap select 1;
					_app pushBack ["Laserdesignator","Laser Designator",5000];
					_app pushBack ["rh_deaglem","MRI Desert Eagle",10000];
					_app pushBack ["RH_7Rnd_50_AE","Deagle 7Rnd .50AE",500];
					_app pushBack ["optic_Yorris","Ottica FastFire II 1x",1000];
					_app pushBack ["RH_x300","Torcia da Pistola",500];
					_app pushBack ["r3f_pamas","PA PAMAS G1",8000];
					_app pushBack ["R3F_15Rnd_9x19_PAMAS","Pamas 15Rnd 9x19",400];
					_app pushBack ["r3f_frf2","GIAT FRF2",20000];
					_app pushBack ["R3F_10Rnd_762x51_FRF2","FrF2 10Rnd 7,62x51",1000];
					_weap set [1,_app];
				};
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {_weap = "Non sei un operatore di Soccorso"};
			default {
			_weap = ["Negozio Rescue Team",
					[
						["hgun_Pistol_Signal_F","Pistola di Segnalazione",1000],
						["6Rnd_GreenSignal_F","Razzi Verdi",100],
						["6Rnd_RedSignal_F","Razzi Rossi",100],
						["ItemGPS",nil,100],
						["itemmap",nil,100],
						["itemcompass",nil,100],
						["itemradio",nil,100],
						["itemwatch",nil,100],
						["Binocular",nil,100],
						["ToolKit",nil,50],
						["FirstAidKit",nil,50],
						["Medikit",nil,100],
						["NVGoggles",nil,1000],
						["B_Kitbag_cbr",nil,5000]
					]
				];
			};
		};
	};
	case "mafia":
	{
		switch(true) do
		{
			case (playerSide != civilian): {_weap = "Non sei un civile!"};
			case (!license_civ_mafia): {_weap = "Non sei un mafioso!"};
			default
			{
			_weap = ["Negozio mafia",
					[
						["NVGoggles_OPFOR","Visore Notturno",5000],
						["FirstAidKit","Kit Pronto Soccorso",500],
						["ToolKit","Kit di Riparazione",500],
						["ItemGPS","GPS",1000],
						["ItemRadio","Radio",200],
						["ItemMap","Mappa",200],
						["ItemWatch","Orologio",200],
						["ItemCompass","Bussola",200],
						["acc_flashlight","Torcia per fucili",500],
						["acc_pointer_IR","Puntatore Infrarosso per fucili",500],
						["SMG_02_F","STING 9mm",60000],
						["30Rnd_9x21_Mag","STING Munizioni", 400],
						["arifle_TRG21_F","AssaultRifle TRG 21 5.56mm",80000],
						["30Rnd_556x45_Stanag","Caricatore 30Rnd TRG20/21",1000],
						["arifle_Katiba_F","AssaultRifle Katiba 6.5mm",100000],
						["30Rnd_65x39_caseless_green","Caricatore 30Rnd Katiba",2000],
						["Rangefinder","Telemetro",10000],
						["optic_Holosight","Ottica Holo 1x",5000],
						["optic_Hamr","Ottica RCO 2x",7500]						
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {_weap = "Non sei un civile!"};
			case (!license_civ_gun): {_weap = "Non hai il porto d'armi!"};
			default
			{
			_weap = ["Negozio Armi",
					[
						["hgun_Rook40_F","Rook40 9mm",40000],
						["16Rnd_9x21_Mag","Caricatore 16Rnd Rook40",150],
						["hgun_Pistol_heavy_02_F","Revolver Zubr .45ACP",50000],
						["6Rnd_45ACP_Cylinder","Caricatore 6Rnd Zubr",200],
						["hgun_ACPC2_F","ACP C2 .45ACP",50000],
						["9Rnd_45ACP_Mag","Caricatore 9Rnd ACP C2",250],
						["hgun_PDW2000_F","Mitra PDW 9mm",120000],
						["30Rnd_9x21_Mag","Caricatore 30Rnd PDW",300],
						["optic_Holosight","Ottica Holo 1-2x",1000]
					]
				];
			};
		};
	};

	case "donator":
	{
		switch(true) do
		{
			//case (playerSide != civilian): {_weap = "Non sei un civile!"};
			case (!license_civ_gun): {_weap = "Non hai il porto d'armi!"};
			case (__GETC__(life_donator) > 0):
			{
			_weap = ["Armeria Donatore",
					[
					
						["Binocular",nil,250],
						["Rangefinder",nil,1000],
						["ItemGPS",nil,200],
						["ToolKit",nil,500],
						["FirstAidKit",nil,50],
						["NVGoggles",nil,1000],
						["RH_kimber","Gold 1911",15000],
						["RH_7Rnd_45cal_m1911","1911 Mag",50],
						["RH_g19","Glock 19",22500],
						["RH_17Rnd_9x19_g17","G19 Mag",75],
						["muzzle_snds_L",nil,1650]
					]
				];
				if (__GETC__(life_donator) > 1) then //DON LEV 2
				{
					_app = _weap select 1;
					_app pushBack ["RH_deagleg","Gold Desert Eagle",65000];
					_app pushBack ["RH_7Rnd_50_AE","Deagle Mag",50];
					_app pushBack ["RH_x300","x300",50];
					_app pushBack ["RH_m6x","m6x",50];
					_app pushBack ["RH_x2","x2",50];
					_weap set [1,_app];
				};
				if (__GETC__(life_donator) > 2) then //DON LEV 3
				{
					_app = _weap select 1;
					_app pushBack ["RH_vz61","Skorpion",75000];
					_app pushBack ["RH_20Rnd_32cal_vz61","Skorpion Mag",150];
					_app pushBack ["hlc_rifle_aks74u","AKS74U",275000];
					_app pushBack ["hlc_30Rnd_545x39_B_AK",nil,300];
					_app pushBack ["optic_ACO_grn",nil,5000];
					_app pushBack ["optic_Holosight",nil,5000];
					_weap set [1,_app];
				};
				if (__GETC__(life_donator) > 3) then //DON LEV 4
				{
					_app = _weap select 1;
					_app pushBack ["hlc_rifle_ak47","AK47",300000];
					_app pushBack ["hlc_30Rnd_762x39_b_ak",nil,500];
					_app pushBack ["optic_hamr",nil,7000];
					_app pushBack ["hlc_muzzle_762SUP_AK",nil,80000];
					_app pushBack ["hlc_muzzle_545SUP_AK",nil,60000];
					_weap set [1,_app];
				};
				if (__GETC__(life_donator) > 4) then //DON LEV 5
				{
					//_app = _weap select 1;		
					//_weap set [1,_app];
				};
			};
		};
	};

	case "genstore":
	{
	_weap = ["General Store",
			[
				["NVGoggles","Visore Notturno",5000],
				["Binocular","Binocolo",500],
				["FirstAidKit","Kit Pronto Soccorso",500],
				["ToolKit","Kit di Riparazione",500],
				["ItemGPS","GPS",1000],
				["ItemRadio","Radio",200],
				["ItemMap","Mappa",200],
				["ItemWatch","Orologio",200],
				["ItemCompass","Bussola",200],
				["Chemlight_red",nil,1],
				["Chemlight_yellow",nil,1],
				["Chemlight_green",nil,1],
				["Chemlight_blue",nil,1]
			]
		];
	};

		case "meccanici":
	{
		switch(true) do
		{
			case (playerSide != civilian): {_weap = "Non sei un civile!"};
			case (!license_civ_meccanico): {_weap = "Non sei un meccano"};
			default
			{
		_weap = ["Meccanici",
			[
				
				["ToolKit",nil,5],
				["FirstAidKit",nil,500],
				["itemmap",nil,5],
				["itemcompass",nil,5],
				["itemradio",nil,10],
				["itemwatch",nil,5],
				["ItemGPS",nil,200],
				["Chemlight_red",nil,1],
				["Chemlight_yellow",nil,1],
				["Chemlight_green",nil,1],
				["Chemlight_blue",nil,1]
			]
		];
		};
	};
	};
	
	case "gang":
    {
        switch(true) do
        {
            case (playerSide != civilian): {_weap = "Non sei un civile!"};
            default
            {
                _weap =["Armamento Covo",
                    [
						["hgun_PDW2000_F","Mitraglietta PDW",100000],
						["30Rnd_9x21_Mag","PDW Munizioni",500],
						["hgun_Pistol_heavy_02_F","Pistola ZUBR",40000],
						["6Rnd_45ACP_Cylinder","ZUBR Munizioni",500],
						["arifle_SDAR_F","SDAR Rifle",200000],
						["30Rnd_556x45_Stanag","SDAR Mag",3000],
						["SMG_02_F","STING 9mm",80000],
						["30Rnd_9x21_Mag","STING Munizioni", 4000],
						["optic_Holosight","Ottica Holo 1x",1000],
						["optic_Hamr","Ottica RCO 2x",2500]						
                    ]
                ];
            };
        };
    };
	
	case "spartan":
	{
		switch(true) do
		{
			case (playerSide != civilian): {_weap = "Non sei un civile!"};
			case (!license_civ_spartan): {_weap = "Non sei uno Spartan"};
			default
			{
			_weap = ["Negozio Spartan",
					[
						["NVGoggles_OPFOR","Visore Notturno Nero",5000],
						["NVGoggles_INDEP","Visore Notturno Verde",5000],
						["FirstAidKit","Kit Pronto Soccorso",250],
						["ToolKit","Kit di Riparazione",250],
						["Rangefinder","Telemetro",10000],
						["ItemGPS","GPS",500],
						["ItemRadio","Radio",50],
						["ItemMap","Mappa",50],
						["ItemWatch","Orologio",50],
						["ItemCompass","Bussola",50],
						["acc_flashlight","Torcia per fucili",500],
						["acc_pointer_IR","Puntatore Infrarosso per fucili",500],
						["hgun_Pistol_heavy_01_snds_F","4-Five .45 ACP",15000],
						["11Rnd_45ACP_Mag","Caricatore 11Rnd 4-Five",100],
						["arifle_SDAR_F","SDAR Rifle",80000],
						["30Rnd_556x45_Stanag","SDAR Mag",300],
						["SMG_02_F","STING 9mm",60000],
						["30Rnd_9x21_Mag","STING Munizioni", 400],
						["arifle_Mk20_F","MK20 5.56mm",80000],
						["30Rnd_556x45_Stanag","MK20 Munizioni", 400],
						["arifle_TRG21_F","TRG21 5.56mm",80000],
						["30Rnd_556x45_Stanag","TRG21 Munizioni", 400],
						["arifle_Katiba_F","Katiba 6.5mm",100000],
						["30Rnd_65x39_caseless_green","Katiba Munizioni", 400],
						["optic_Holosight","Ottica Holo 1x",1000],
						["optic_Hamr","Ottica RCO 2x",2500]
					]
				];
			};
		};
	};
	    
    case "aod":
    {
        switch(true) do
        {
            case (playerSide != civilian): {_weap = "Non sei un civile!"};
            case (!license_civ_aod): {_weap = "Non sei un Uomo D'onore!"};
            default
            {
            _weap = ["Armeria Uomini D'onore",
                    [    
                        ["R3F_Famas_F1","Famas F1",80000],
						["hlc_rifle_aks74","AKS47",110000],
						["hlc_rifle_ak47","AK47",110000],
						["arifle_SDAR_F","SDAR Rifle",30000],
						["RH_vz61","Skorpion",40000],
						["arifle_MX_F","MX Assault Rifle",50000],
						["RH_deagleg","Gold Desert Eagle",50000],
						["RH_muzi","UZI",70000],
						["RH_kimber_nw",nil,30000],
						["RH_7Rnd_45cal_m1911","Kimber Mag",300],
						["hlc_30Rnd_545x39_B_AK","AKS47 Mag",500],
						["hlc_30Rnd_762x39_b_ak","AK47 Mag",500],
						["RH_7Rnd_50_AE","Deagle Mag",300],
						["RH_20Rnd_32cal_vz61","Skorpion Mag",150],
						["30Rnd_65x39_caseless_mag","MX Mag",500],
						["RH_30Rnd_9x19_UZI","UZI Mag",300],
						["R3F_25Rnd_556x45_FAMAS","Famas Mag",500],
						["30Rnd_556x45_Stanag","SDAR Mag",300],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3500],
						["acc_flashlight",nil,1000],
						["optic_hamr",nil,7000],
						["optic_Arco",nil,7000],
						["optic_Mrco",nil,7000],
						["hlc_optic_kobra",nil,3500],
						["HLC_Optic_PSO1",nil,7000],
						["HLC_Optic_1p29",nil,7000],
						["hlc_optic_pso1",nil,7000],
						["hlc_optic_kobra",nil,7000],
						["Trixie_CZ550","CZ 550 Sniper Rifle",150000],
						["Trixie_CZ550_Mag","CZ 550 Mag",1000]
                    ]
                ];
            };
        };
    };

	
	    case "crips":
    {
        switch(true) do
        {
            case (playerSide != civilian): {_weap = "Non sei un civile!"};
            case (!license_civ_crips): {_weap = "Non sei un Crips!"};
            default
            {
            _weap = ["Armeria Crispy Mac Bacon",
                    [    
						["RH_p226","Sig Sauer P226",1000],
						["RH_15Rnd_9x19_SIG","p226 15Rnd 9x19",50],
						["RH_m1911","Colt M1911",1500],
						["RH_7Rnd_45cal_m1911","M1911 7Rnd .45ACP",50],
						["RH_mp412","MP412 REX Revolver",1800],
						["RH_6Rnd_357_Mag","MP412 6Rnd .357 Magnum",50],
						["RH_muzi","Uzi",8000],
						["RH_30Rnd_9x19_UZI","Uzi 30Rnd 9x19",50],
						["arifle_SDAR_F","Fucile Subacqueo SDAR",15000],
						["30Rnd_556x45_Stanag","Munizioni Subacquee 30Rnd 5,56x45",150],
						["arifle_Mk20_plain_F","Fucile d'Assalto MK20",20000],
						["30Rnd_556x45_Stanag","30Rnd 5,56x45 STANAG",150],
						["R3F_Famas_surb","Fucile d'Assalto Famas C",30000],
						["R3F_30Rnd_556x45_FAMAS","Famas 30Rnd 5,56x45",150],
						["optic_Holosight","Ottica Holo 1-2x",300],
						["R3F_J4","Ottica Famas Scrome J4 4x",600],
						["optic_hamr","Ottica RCO 1-4x",400],
						["optic_arco","Ottica ARCO 1-4x",500],
						["optic_mrco","Ottica MRCO 1-4x",300],
						["rh_ta31rco","Ottica TA31 RCO 1-6x",500],
						["acc_flashlight","Torcia per Fucili",50],
						["Binocular",nil,50],
						["ToolKit",nil,500],
						["FirstAidKit",nil,500],
						["NVGoggles",nil,1000],
						["itemmap",nil,5],
						["itemcompass",nil,5],
						["itemradio",nil,10],
						["itemwatch",nil,5],
						["ItemGPS",nil,300],
						["Chemlight_red",nil,1],
						["Chemlight_yellow",nil,1],
						["Chemlight_green",nil,1],
						["Chemlight_blue",nil,1]
                    ]
                ];
            };
        };
    };

		
	    case "narcos":
    {
        switch(true) do
        {
            case (playerSide != civilian): {_weap = "Non sei un civile!"};
            case (!license_civ_narcos): {_weap = "Non sei un Narcos!"};
            default
            {
            _weap = ["Armeria Fattonih",
                    [    
						["RH_kimber","Kimber M1911",1500],
						["RH_7Rnd_45cal_m1911","M1911 7Rnd .45ACP",50],
						["RH_tec9","TEC-9",8000],
						["RH_32Rnd_9x19_tec","TEC-9 32Rnd 9x19",50],
						["SMG_02_F","SMG Scorpion Evo",13000],
						["30Rnd_9x21_Mag","Scorpion 30Rnd 9x21",50],
						["optic_Holosight","Ottica Holo 1-2x",300],
						["hlc_rifle_aks74","AKS74",30000],
						["hlc_30Rnd_545x39_B_AK","AKS74 30Rnd 5,45x39",150],
						["hlc_optic_pso1","PSO1",600],
						["hlc_optic_kobra","KOBRA",300],
						["acc_flashlight","Torcia per Fucili",50],
						["Binocular",nil,50],
						["ToolKit",nil,500],
						["FirstAidKit",nil,500],
						["NVGoggles",nil,1000],
						["itemmap",nil,5],
						["itemcompass",nil,5],
						["itemradio",nil,10],
						["itemwatch",nil,5],
						["ItemGPS",nil,300],
						["Chemlight_red",nil,1],
						["Chemlight_yellow",nil,1],
						["Chemlight_green",nil,1],
						["Chemlight_blue",nil,1]
                    ]
                ];
            };
        };
    };

	    case "KGB":
    {
        switch(true) do
        {
            case (playerSide != civilian): {_weap = "Non sei un civile!"};
            case (!license_civ_KGB): {_weap = "Non sei un KGB!"};
            default
            {
            _weap = ["Armeria KGB",
                    [    
						["RH_vp70","VP70",1500],
						["RH_18Rnd_9x19_VP","VP70 18Rnd 9x19",50],
						["RH_gsh18","Gsh18",1800],
						["RH_18Rnd_9x19_gsh","Gsh18 18Rnd 9x19",50],
						["SMG_02_F","SMG Scorpion Evo",13000],
						["30Rnd_9x21_Mag","Scorpion 30Rnd 9x21",50],
						["optic_Holosight","Ottica Holo 1-2x",300],
						["hlc_rifle_aek971","AEK971",30000],
						["hlc_30Rnd_545x39_B_AK","AEK971 30Rnd 5,45x39",150],
						["hlc_optic_pso1","PSO1",600],
						["hlc_optic_kobra","KOBRA",300],
						["acc_flashlight","Torcia per Fucili",50],
						["Binocular",nil,50],
						["ToolKit",nil,500],
						["FirstAidKit",nil,500],
						["NVGoggles",nil,1000],
						["itemmap",nil,5],
						["itemcompass",nil,5],
						["itemradio",nil,10],
						["itemwatch",nil,5],
						["ItemGPS",nil,300],
						["Chemlight_red",nil,1],
						["Chemlight_yellow",nil,1],
						["Chemlight_green",nil,1],
						["Chemlight_blue",nil,1]
                    ]
                ];
            };
        };
    };

};
_weap