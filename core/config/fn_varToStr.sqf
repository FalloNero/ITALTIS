/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Petrolio Grezzo"};
	case "life_inv_tavolo": {"Tavolo da Lavoro"};
	case "life_inv_oilp": {"Petrolio"};
	case "life_inv_heroinu": {"Sostanze Meth"};
	case "life_inv_heroinp": {"Metanfetamina"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Mela"};
	case "life_inv_rabbit": {"Kebab"};
	case "life_inv_salema": {"Salmone"};
	case "life_inv_ornate": {"Orata"};
	case "life_inv_mackerel": {"Merluzzo"};
	case "life_inv_tuna": {"Tonno"};
	case "life_inv_mullet": {"Branzino"};
	case "life_inv_catshark": {"Carne di Squalo"};
	case "life_inv_turtle": {"Guscio di Tartaruga"};
	case "life_inv_fishingpoles": {"Canna da Pesca"};
	case "life_inv_water": {"Acqua"};
	case "life_inv_coffee": {"Caffe"};
	case "life_inv_turtlesoup": {"Zuppa di Tartaruga"};
	case "life_inv_donuts": {"Ciambella"};
	case "life_inv_fuelE": {"Tanica vuota"};
	case "life_inv_fuelF": {"Tanica di Benzina"};
	case "life_inv_pickaxe": {"Piccone"};
	case "life_inv_copperore": {"Minerale di rame"};
	case "life_inv_ironore": {"Minerale di ferro"};
	case "life_inv_ironr": {"Lingotto de fero"};
	case "life_inv_copperr": {"Lingotto de rame"};
	case "life_inv_sand": {"Sabbia"};
	case "life_inv_salt": {"Sale de Merda"};
	case "life_inv_saltr": {"Sale"};
	case "life_inv_glass": {"Vetro"};
	case "life_inv_diamond": {"Diamante Grezzo"};
	case "life_inv_diamondr": {"Diamante Tagliato"};
	case "life_inv_tbacon": {"Pizza"};
	case "life_inv_redgull": {"RedBull"};
	case "life_inv_lockpick": {"Supercazzola/Grimaldello"};
	case "life_inv_peach": {"Pesche"};
	case "life_inv_coke": {"Foglie di Coca"};
	case "life_inv_cokep": {"Cocaina"};
	case "life_inv_spikeStrip": {"Strisce Chiodate"};
	case "life_inv_rock": {"Pietra"};
	case "life_inv_cement": {"Sacco di Cemento"};
	case "life_inv_goldbar": {"Gold Bar"};
    case "life_inv_lsdu": {"Acido Lisergico"};
    case "life_inv_lsdp": {"lsd"};
    case "life_inv_mdmau": {"Feniletilamina"};
	case "life_inv_mdmap": {"Ecstasy"};
	case "life_inv_cracku": {"Cocaina di scarto"};
	case "life_inv_crackp": {"Crack"};
	case "life_inv_goldu": {"Pepita Oro"};
	case "life_inv_goldp": {"Lingotto Oro"};
	case "life_inv_rubyu": {"Rubino Grezzo"};
	case "life_inv_rubyp": {"Rubino Tagliato"};
	case "life_inv_emeraldu": {"Smeraldo Grezzo"};
	case "life_inv_emeraldp": {"Smeraldo Tagliato"};
	case "life_inv_ganascia": {"Ganascia"};
	case "life_inv_speedtrap": {"Autovelox"};    
	case "life_inv_speedtrapdetector": {"Autovelox Detector"};
	case "life_inv_laptop": {"Laptop"};
	case "life_inv_fuelManipulator": {"Manipolatore serbatoio"};
	case "life_inv_fuelPipe": {"Tubo carburante"};
	case "life_inv_tenaglie": {"Tenaglie"};
	case "life_inv_bankmoney": {"Denaro Segnato"};
	case "life_inv_storagesmall": {"Cassa piccola"};
    case "life_inv_storagebig": {"Cassa grande"};
	case "life_inv_cannabisSeed": {"Seme Cannabis"};
    case "life_inv_cocaineSeed": {"Seme Cocaina"};
	case "Land_Icebox_F": {"Congelatore"};
	case "Land_TableDesk_F": {"Scrivania"};
	//SHISH
	case "life_inv_luppolo": {"luppolo"};
	case "life_inv_tartaruga": {"tartaruga"};
	case "life_inv_rame": {"rame"};
	case "life_inv_canapa": {"canapa"};
	case "life_inv_alluminio": {"alluminio"};
	case "life_inv_papavero": {"papavero"};
	case "life_inv_ferro": {"ferro"};
	case "life_inv_petrolio": {"petrolio"};
	case "life_inv_oro": {"oro"};
	case "life_inv_platino": {"platino"};
	case "life_inv_cocaina": {"cocaina"};
	case "life_inv_uranio": {"uranio"};
	case "life_inv_birra": {"birra"};
	case "life_inv_ldrame": {"lingotto di rame"};
	case "life_inv_fdcanapa": {"fibra di fabri-canapa"};
	case "life_inv_marijuana": {"marijuana"};
	case "life_inv_ldalluminio": {"lingotto di alluminio"};
	case "life_inv_morfina": {"morfina"};
	case "life_inv_eroina": {"eroina"};
	case "life_inv_ldferro": {"lingotto di ferro"};
	case "life_inv_benzina": {"benzina"};
	case "life_inv_napalm": {"napalm"};
	case "life_inv_ldoro": {"lingotto di oro"};
	case "life_inv_ldplatino": {"lingotto di platino"};
	case "life_inv_cocainapura": {"cocaina pura"};
	case "life_inv_uranioarricchito": {"uranio arricchito"};
//super
	case "life_inv_obirra": {"Vetro di Pyrgos"};
	case "life_inv_orame": {"Lastra di Rame"};
	case "life_inv_ocanapa": {"Telo di Canapa"};
	case "life_inv_omarijuana": {"Cuscino di Maria"};
	case "life_inv_oalluminio": {"Lastra di Alluminio"};
	case "life_inv_omorfina": {"Olio dell’Oppio"};
	case "life_inv_oeroina": {"Rocce di Eroina Pura"};
	case "life_inv_oferro": {"Lastra di Ferro"};
	case "life_inv_obenzina": {"Naftalina"};
	case "life_inv_onapalm": {"Combustibile Pericoloso"};
	case "life_inv_oplatino": {"Sfera di Platino"};
	case "life_inv_ococainapura": {"Bustina Bianca"};
	case "life_inv_ooro": {"Anello d’oro"};

	//License Block
	case "license_civ_driver": {"Patente B"};
	case "license_civ_air": {"Brevetto di Volo"};
	case "license_civ_heroin": {"Formazione Metanfetamina"};
	case "license_civ_gang": {"Licenza Gang"};
	case "license_civ_oil": {"Processo Petrolio"};
	case "license_civ_dive": {"Licenza de Tuffasse"};
	case "license_civ_boat": {"Patente Nautica"};
	case "license_civ_gun": {"Porto d'Armi"};
	case "license_cop_air": {"Pilota Polizia"};
	case "license_cop_swat": {"Swag"};
	case "license_cop_cg": {"Guardia Costiera"};
	case "license_civ_rebel": {"Uomo d'onore"};
	case "license_civ_truck": {"Patente C"};
	case "license_civ_diamond": {"Processo Diamanti"};
	case "license_civ_copper": {"Processo Rame"};
	case "license_civ_iron": {"Processo Ferro"};
	case "license_civ_sand": {"Processo Sabbia"};
	case "license_civ_salt": {"Processo Sale"};
	case "license_civ_coke": {"Formazione Cocaina"};
	case "license_civ_cement": {"Processo Cemento"};
	case "license_med_air": {"Pilota Medico"};
	case "license_civ_merc": {"Mercenario"};
	case "license_civ_lsd": {"Processo LSD"};
	case "license_civ_crack": {"Formazione Crack"};
	case "license_civ_mdma": {"Formazione MDMA"};
	case "license_civ_gold": {"Lavorazione Oro"};
	case "license_civ_ruby": {"Lavorazione Rubini"};
	case "license_civ_emerald": {"Lavorazione Smeraldi"};
	case "license_civ_home": {"Licenza Casa"};
	case "license_civ_birra": {"Processo Birra"}; // birra   ------------
	case "license_civ_ldrame": {"Processo Lingotto di Rame"};
	case "license_civ_fdcanapa": {"Processo Fibra di canapa"};
	case "license_civ_marijuana": {"Processo Marijuana"};
	case "license_civ_ldalluminio": {"Processo lingotto di Alluminio"};
	case "license_civ_morfina": {"Processo Morfina"};
	case "license_civ_eroina": {"Processo Eroina"};
	case "license_civ_ldferro": {"Processo Lingotto di Ferro"};
	case "license_civ_benzina": {"Processo Benzina"};
	case "license_civ_napalm": {"Processo Napalm"};
	case "license_civ_ldoro": {"Processo Lingotto di Oro"};
	case "license_civ_ldplatino": {"Processo Lingotto di Platino"};
	case "license_civ_cocainapura": {"Processo Cocaina Pura"};
	case "license_civ_uranioarricchito": {"Processo Uranio Arricchito"};
	case "license_cop_copmessico": {"Pulotto Messicano"}; // pula messico gang
	case "license_cop_copamericano": {"Pulotto Americano"}; // pula messico gang
	case "license_civ_meccanico": {"Meccanico"}; // meccanico
	case "license_civ_spartan": {"Spartan"}; // spartan
	case "license_civ_mafia": {"Mafia"}; // mafia
	case "license_med_morfina": {"Morfina"}; // mafia
	case "license_civ_bb": {"Banda Bassotti"}; // mafia
};
