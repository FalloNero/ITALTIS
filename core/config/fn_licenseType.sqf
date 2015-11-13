/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver"}; //Drivers License cost
			case "boat": {_var = "license_civ_boat"}; //Boating license cost
			case "pilot": {_var = "license_civ_air"}; //Pilot/air license cost
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "swat": {_var = "license_cop_swat"}; //Swat License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "license_civ_gang"}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "cement": {_var = "license_civ_cement"};
			case "mair": {_var = "license_med_air"};
			case "merc": {_var = "license_civ_merc"}; //Mercenari
			case "home": {_var = "license_civ_home"}; //Housing
			case "lsd": {_var = "license_civ_lsd"}; //lsd
			case "crack": {_var = "license_civ_crack"}; //Crack
			case "mdma": {_var = "license_civ_mdma"}; //MDMA
			case "gold": {_var = "license_civ_gold"}; //Oro
			case "ruby": {_var = "license_civ_ruby"}; //Rubini
			case "emerald": {_var = "license_civ_emerald"}; //Smeraldi
			case "soa": {_var = "license_civ_soa"}; //SOA
			case "mafia": {_var = "license_civ_mafia"}; //MAFIA
            case "aod": {_var = "license_civ_aod"}; //AOD	
			case "atc": {_var = "license_civ_atc"}; //ATC			
			case "pass": {_var = "license_civ_pass"}; // Passaporto
			case "contrabbando": {_var = "license_civ_contrabbando"}; // contrabbando gang
			case "copmessico": {_var = "license_cop_copmessico"}; // pula messico gang
			case "copamericano": {_var = "license_cop_copamericano"}; // pula messico gang
			case "meccanico": {_var = "license_civ_meccanico"}; // MECCANICO
			case "birra": {_var = "license_civ_birra"}; // birra 
			case "ldrame": {_var = "license_civ_ldrame"}; // birra 
			case "fdcanapa": {_var = "license_civ_fdcanapa"}; // birra 
			case "marijuana": {_var = "license_civ_marijuana"}; // birra 
			case "ldalluminio": {_var = "license_civ_ldalluminio"}; // birra 
			case "morfina": {_var = "license_civ_morfina"}; // birra 
			case "eroina": {_var = "license_civ_eroina"}; // birra 
			case "ldferro": {_var = "license_civ_ldferro"}; // birra 
			case "benzina": {_var = "license_civ_benzina"}; // birra 
			case "napalm": {_var = "license_civ_napalm"}; // birra 
			case "ldoro": {_var = "license_civ_ldoro"}; // birra 
			case "ldplatino": {_var = "license_civ_ldplatino"}; // birra 
			case "cocainapura": {_var = "license_civ_cocainapura"}; // birra 
			case "uranioarricchito": {_var = "license_civ_uranioarricchito"}; // birra 
			case "terrorista": {_var = "license_civ_terrorista"}; // birra 
			case "spartan": {_var = "license_civ_spartan"}; // birra 
			case "morfina2": {_var = "license_med_morfina"}; // birra 
			case "bb": {_var = "license_civ_bb"}; // bb
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver"}; //Drivers License cost
			case "license_civ_boat": {_var = "boat"}; //Boating license cost
			case "license_civ_air": {_var = "pilot"}; //Pilot/air license cost
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_swat": {_var = "swat"}; //Swat License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_cement": {_var = "cement"};
			case "license_med_air": {_var = "mair"};
			case "license_civ_merc": {_var = "merc"}; //Merc
			case "license_civ_home": {_var = "home"}; //Housing
			case "license_civ_lsd": {_var = "lsd"}; //lsd
			case "license_civ_crack": {_var = "crack"}; //Crack
			case "license_civ_mdma": {_var = "mdma"}; //MDMA
			case "license_civ_gold": {_var = "gold"}; //Oro
			case "license_civ_ruby": {_var = "ruby"}; //Rubini
			case "license_civ_emerald": {_var = "emerald"}; //Smeraldi
			case "license_civ_mafia": {_var = "mafia"}; //Mafia
			case "license_civ_soa": {_var = "soa"}; //Soa
			case "license_civ_aod": {_var = "aod"}; //Aod
			case "license_civ_atc": {_var = "atc"}; //Atc	
			case "license_civ_pass": {_var = "pass"}; // Passaporto
			case "license_civ_contrabbando": {_var = "contrabbando"}; // contrabbando gang
			case "license_cop_copmessico": {_var = "copmessico"}; // pula messico gang
			case "license_cop_copamericano": {_var = "copamericano"}; // pula messico gang
			case "license_civ_meccanico": {_var = "meccanico"}; // meccanico
			case "license_civ_birra": {_var = "birra"}; // birra 
			case "license_civ_ldrame": {_var = "ldrame"}; // birra 
			case "license_civ_fdcanapa": {_var = "fdcanapa"}; // birra 
			case "license_civ_marijuana": {_var = "marijuana"}; // birra 
			case "license_civ_ldalluminio": {_var = "ldalluminio"}; // birra 
			case "license_civ_morfina": {_var = "morfina"}; // birra 
			case "license_civ_eroina": {_var = "eroina"}; // birra 
			case "license_civ_ldferro": {_var = "ldferro"}; // birra 
			case "license_civ_benzina": {_var = "benzina"}; // birra 
			case "license_civ_napalm": {_var = "napalm"}; // birra 
			case "license_civ_ldoro": {_var = "ldoro"}; // birra 
			case "license_civ_ldplatino": {_var = "ldplatino"}; // birra 
			case "license_civ_cocainapura": {_var = "cocainapura"}; // birra 
			case "license_civ_uranioarricchito": {_var = "uranioarricchito"}; // birra 
			case "license_med_morfina": {_var = "morfina medica"}; // birra 
			case "license_civ_bb": {_var = "Banda Bassotti"}; // bb
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;