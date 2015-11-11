#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
saluting = "false";		//SIRENA POLIZIA STOP
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_barrierRoad = ObjNull;			//POLICE ROAD BARRIER , STILL WIP
life_has_insurance = false;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_sitting = false;				//SITTING SCRIPT
life_fatigue = 0.0; 				//FATICA MASSSIMA
life_action_gathering = false;		//GATHERING
life_unit_escorted = ObjNull ; 		//Unità scortata dal poliziotto, servirà ad evitare il problema del menu azione dentro agli edifici
life_fadeSound = false;

//ADMINISTRATION TOOLS
life_god = false;
life_burn = 0;
life_frozen = false;
life_markers = false;
life_shadow = false;
//

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for civs and cops? (Medics excluded for now)

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,3000); //Fee for players to pay when revived.
life_respawn_timer = 2; //Scaled in minutes
Life_request_timer = false;

/*
*****************************
****** Revive System *****
*****************************
*/
FAR_BleedOut = 9000;
FAR_ReviveMode = 2;
FAR_isDragging = false;
FAR_isDragging_EH = [];
FAR_deathMessage = [];
FAR_isDragging = false;
FAR_killed = false;
FAR_itemlist = [];
FAR_deadGear = [];
FAR_loot = objNull ;
LIFE_HEAD_SHOOTED = false ;

//Vehicle Limit
__CONST__(life_vehLimit,10); 	//Currently not implemented
//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,1000000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,3); //BLAH



//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_isSuicide = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
life_bank_cash = 0 ;
__CONST__(life_impound_car,100);
__CONST__(life_impound_boat,200);
__CONST__(life_impound_air,300);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_atmcash = 200000; //Starting Bank Money
		life_paycheck = 10000; //Paycheck Amount
	};
	case east: 
	{
 		life_atmcash = 200000;
 		life_paycheck = 10000;
 	};
	case civilian:
	{
		life_atmcash = 200000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};

	case independent: {
		life_atmcash = 500000;
		life_paycheck = 6000;
	};
};
//DROGHE
life_drugged_cocaine = -1;			// So level -1
life_drugged_cocaine_duration = 10; // In Minutes
life_drugged_weed = -1;
life_drugged_weed_duration = 3;		//still minutes

// Fuelstation
life_fuelstation_price = 0;
life_fuelstation_lockVeh = objNull;
life_fuelstation_fueltruck = objNull;
life_fuelstation_amount = 0;
life_fuelstation_fitamount = 0;
life_fuelstation_cfgTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F"];

//EMP ELICOTTERI
nn_last_vehicles = [];
nn_empInUse = false;

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_lsdu",
	"life_inv_lsdp",
	"life_inv_cracku",
	"life_inv_crackp",
	"life_inv_mdmau",
	"life_inv_mdmap",
	"life_inv_goldu",
	"life_inv_goldp",
	"life_inv_rubyu",
	"life_inv_rubyp",
	"life_inv_emeraldu",
	"life_inv_emeraldp",
	"life_inv_ganascia",
	"life_inv_speedtrap",
	"life_inv_speedtrapdetector",
	"life_inv_laptop",
	"life_inv_fuelManipulator",
	"life_inv_fuelPipe",
	"life_inv_tenaglie",
	"life_inv_storagesmall",
    "life_inv_storagebig",
	"life_inv_bankmoney",
	"life_inv_cannabisSeed",
	"life_inv_cocaineSeed",
	"Land_Icebox_F",
	"Land_TableDesk_F",
	"life_inv_luppolo",
    "life_inv_tartaruga",
	"life_inv_rame",
	"life_inv_canapa",
	"life_inv_alluminio",
	"life_inv_papavero",
	"life_inv_ferro",
	"life_inv_petrolio",
	"life_inv_oro",
	"life_inv_platino",
	"life_inv_cocaina",
	"life_inv_uranio",
	"life_inv_birra",
	"life_inv_ldrame",
	"life_inv_fdcanapa",
	"life_inv_marijuana",
	"life_inv_ldalluminio",
	"life_inv_morfina",
	"life_inv_eroina",
	"life_inv_ldferro",
	"life_inv_benzina",
	"life_inv_napalm",
	"life_inv_ldoro",
	"life_inv_ldplatino",
	"life_inv_cocainapura",
	"life_inv_uranioarricchito",
	"life_inv_obirra",
	"life_inv_orame",
	"life_inv_ocanapa",
	"life_inv_omarijuana",
	"life_inv_oalluminio",
	"life_inv_omorfina",
	"life_inv_oeroina",
	"life_inv_oferro",
	"life_inv_obenzina",
	"life_inv_onapalm",
	"life_inv_oplatino",
	"life_inv_ococainapura",
	"life_inv_ooro"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;

life_inv_items_save =[    
	["life_inv_apple", life_inv_apple],
    ["life_inv_rabbit", life_inv_rabbit],
    ["life_inv_salema", life_inv_salema],
    ["life_inv_ornate", life_inv_ornate],
    ["life_inv_mackerel", life_inv_mackerel],
    ["life_inv_tuna", life_inv_tuna],
    ["life_inv_mullet", life_inv_mullet],
    ["life_inv_catshark", life_inv_catshark],
    ["life_inv_fishingpoles", life_inv_fishingpoles],
    ["life_inv_water", life_inv_water],
    ["life_inv_donuts", life_inv_donuts],
    ["life_inv_turtlesoup", life_inv_turtlesoup],
    ["life_inv_coffee", life_inv_coffee],
    ["life_inv_fuelF", life_inv_fuelF],
    ["life_inv_fuelE", life_inv_fuelE],
    ["life_inv_pickaxe", life_inv_pickaxe],
    ["life_inv_tbacon", life_inv_tbacon],
    ["life_inv_lockpick", life_inv_lockpick],
    ["life_inv_redgull", life_inv_redgull],
    ["life_inv_peach", life_inv_peach],
    ["life_inv_spikeStrip", life_inv_spikeStrip],
	["life_inv_ganascia",life_inv_ganascia],
	["life_inv_speedtrap",life_inv_speedtrap],
	["life_inv_speedtrapdetector",life_inv_speedtrapdetector],
	["life_inv_laptop",life_inv_laptop],
	["life_inv_fuelManipulator",life_inv_fuelManipulator],
	["life_inv_fuelPipe",life_inv_fuelPipe],
	["life_inv_tenaglie",life_inv_tenaglie],
	["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
	["Land_Icebox_F",Land_Icebox_F],
	["Land_TableDesk_F",Land_TableDesk_F],
	["life_inv_luppolo",life_inv_luppolo],
	["life_inv_tartaruga",life_inv_tartaruga],
	["life_inv_rame",life_inv_rame],
	["life_inv_canapa",life_inv_canapa],
	["life_inv_alluminio",life_inv_alluminio],
	["life_inv_papavero",life_inv_papavero],
	["life_inv_ferro",life_inv_ferro],
	["life_inv_petrolio",life_inv_petrolio],
	["life_inv_oro",life_inv_oro],
	["life_inv_platino",life_inv_platino],
	["life_inv_cocaina",life_inv_cocaina],
	["life_inv_uranio",life_inv_uranio],
	["life_inv_birra",life_inv_birra],
	["life_inv_ldrame",life_inv_ldrame],
	["life_inv_fdcanapa",life_inv_fdcanapa],
	["life_inv_marijuana",life_inv_marijuana],
	["life_inv_ldalluminio",life_inv_ldalluminio],
	["life_inv_morfina",life_inv_morfina],
	["life_inv_eroina",life_inv_eroina],
	["life_inv_ldferro",life_inv_ldferro],
	["life_inv_benzina",life_inv_benzina],
	["life_inv_napalm",life_inv_napalm],
	["life_inv_ldoro",life_inv_ldoro],
	["life_inv_ldplatino",life_inv_ldplatino],
	["life_inv_cocainapura",life_inv_cocainapura],
	["life_inv_uranioarricchito",life_inv_uranioarricchito],
	["life_inv_obirra",life_inv_obirra],
	["life_inv_orame",life_inv_orame],
	["life_inv_ocanapa",life_inv_ocanapa],
	["life_inv_omarijuana",life_inv_omarijuana],
	["life_inv_oalluminio",life_inv_oalluminio],
	["life_inv_omorfina",life_inv_omorfina],
	["life_inv_oeroina",life_inv_oeroina],
	["life_inv_oferro",life_inv_oferro],
	["life_inv_obenzina",life_inv_obenzina],
	["life_inv_onapalm",life_inv_onapalm],
	["life_inv_oplatino",life_inv_oplatino],
	["life_inv_ococainapura",life_inv_ococainapura],
	["life_inv_ooro",life_inv_ooro]
];

// aggiungere un item Y: qui sopra, fn_varHandle.sqf, fn_varToStr.sqf, fn_itemWeight.sqf, fn_savegear.sqf (fn_virt_shops.sqf ed economy se serve)

//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_med_air","med"],
    ["license_civ_home", "civ"], //Housing
	["license_civ_birra", "civ"], // birra   ------------
	["license_civ_ldrame", "civ"], // birra 
	["license_civ_fdcanapa", "civ"], // birra 
	["license_civ_marijuana", "civ"], // birra 
	["license_civ_ldalluminio", "civ"], // birra 
	["license_civ_morfina", "civ"], // birra 
	["license_civ_eroina", "civ"], // birra 
	["license_civ_ldferro", "civ"], // birra 
	["license_civ_benzina", "civ"], // birra 
	["license_civ_napalm", "civ"], // birra 
	["license_civ_ldoro", "civ"], // birra 
	["license_civ_ldplatino", "civ"], // birra 
	["license_civ_cocainapura", "civ"], // birra 
	["license_civ_uranioarricchito", "civ"], // birra  ------------------
	["license_civ_meccanico", "civ"], //MECCANICO
	["license_cop_copmessico", "cop"], // MESSICANO
	["license_cop_copamericano", "cop"], //AMERICANO
	["license_civ_spartan", "civ"],
	["license_civ_mafia", "civ"],
	["license_med_morfina", "med"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["morfina",1000],["marijuana",1000],["eroina",1500],["napalm",2000],["cocainapura",4000],["uranioarricchito",5000],["cocaina",4000],["uranio",5000],["bank_money",20000],["lockpick",2000],["fuelPipe",500],["spikeStrip",2000],["ganascia",2000],["tenaglie",2000]];
//illegal weapons
life_illegal_weapons = ["SMG_02_F","arifle_SDAR_F","arifle_Mk20_F","arifle_TRG21_F","arifle_Katiba_C_F","arifle_Katiba_F"];
life_illegal_magazines = ["hlc_30Rnd_545x39_B_AK"];
//list of furniture classnames
life_furniture_items = ["Land_Icebox_F","Land_TableDesk_F"];

/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",20],
	["heroinu",15],
	["heroinp",3000],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",2000],
	["turtle",3500],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2000],
	["tbacon",25],
	["lockpick",70],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["fuelF",2000],
	["barrierRoad",300],
	["spikeStrip",200],
	["ganascia",1200],
	["speedtrap",100],
	["speedtrapdetector",100],
	["laptop",250],
	["fuelManipulator",100],
	["fuelPipe",100],
	["tenaglie",75],
	["storagesmall",100000],
    ["storagebig",250000],
	["furnMarijuana",500],
	["cannabisSeed",500],
	["furnCocaine",1500]
	
];

__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",65],
	["rabbit",75],
	["tavolo",1500],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",2500],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",200],
	["peach",70],
	["barrierRoad",500],
	["spikeStrip",2500],
	["ganascia",1200],
	["speedtrap",5000],
	["speedtrapdetector",5000],
	["laptop",2500],
	["fuelManipulator",5000],
	["fuelPipe",500],
	["tenaglie",1300],
	["storagesmall",100000],
    ["storagebig",250000],
	["luppolo",1000]
];
__CONST__(buy_array,buy_array);
/*
life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",6000],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",1100],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Offroad_01_F", 0],
	["B_G_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Van_01_fuel_F",0],
	["I_Heli_Transport_02_F",0],
	["C_Van_01_box_F",0],
	["I_Truck_02_transport_F",0],
	["I_Truck_02_covered_F",0],
	["B_Truck_01_transport_F",0],
	["B_Truck_01_box_F", 0],
	["O_MRAP_02_F",0],
	["B_Heli_Light_01_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["C_Rubberboat",0],
	["C_Boat_Civil_01_F",0],
	["B_Boat_Transport_01_F",0],
	["C_Boat_Civil_01_police_F",0],
	["B_Boat_Armed_01_minigun_F",0],
	["B_SDV_01_F",0],
	["B_MRAP_01_F",0],
	["I_Heli_light_03_unarmed_F",0],
	["I_Heli_Transport_02_F",0]
];
__CONST__(life_garage_prices,life_garage_prices);
*/
life_garage_sell =
[	
	
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",25000],
	["C_Offroad_01_F", 40000],
	["B_G_Offroad_01_F",40000],
	["C_SUV_01_F",60000],
	["C_Van_01_transport_F",125000],
	["C_Hatchback_01_sport_F",50000],
	["C_Van_01_fuel_F",33850],
	["I_Heli_Transport_02_F",800000],
	["C_Van_01_box_F",20000],
	["I_Truck_02_transport_F",649800],
	["I_Truck_02_covered_F",762000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 915000],
	["B_Truck_01_covered_F", 915000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",157000],
	["O_Heli_Light_02_unarmed_F",772500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",250000],
	["B_MRAP_01_F",200000],
	["I_Heli_light_03_unarmed_F",940000],
	["I_Heli_Transport_02_F",600000]
];
__CONST__(life_garage_sell,life_garage_sell);