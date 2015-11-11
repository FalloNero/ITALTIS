/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death 
	case 0:
	{
	//license_civ_driver = false;
	//license_civ_air = false;
	//license_civ_heroin = false;
	//license_civ_marijuana = false;
	//license_civ_gang = false;
	//license_civ_boat = false;
	//license_civ_oil = false;
	//license_civ_dive = false;
	//license_civ_truck = false;
	//license_civ_gun = false;
	//license_civ_rebel = false;
	//license_civ_coke = false;
	//license_civ_diamond = false;
	//license_civ_copper = false;
	//license_civ_iron = false;
	//license_civ_sand = false;
	//license_civ_salt = false;
	//license_civ_cement = false;
    //license_civ_merc = false;
	//license_civ_home = false;
	//license_civ_lsd = false;
	//license_civ_mdma = false;
	//license_civ_crack = false;
	//license_civ_gold = false;
	//license_civ_ruby = false;
	//license_civ_emerald = false;
	//license_civ_mafia = false;
	//license_civ_soa = false;
	//license_civ_aod = false;
	//license_civ_atc = false;
	//license_civ_pass = false;
	//license_civ_contrabbando = false;
	//license_civ_birra = false;
	//license_civ_gomma = false;
	//license_civ_fdcanapa = false;
	//license_civ_semtex = false;
	//license_civ_fdcotone = false;
	//license_civ_sigarette = false;
	//license_civ_sigari = false;
	//license_civ_tequila = false;
	//license_civ_whisky = false;
	//license_civ_benzina = false;
	//license_civ_napalm = false;
	//license_civ_morfina = false;
	//license_civ_oppio = false;
	//license_civ_Volframio = false;
	//license_civ_proiettili = false;
	};

	//Jail licenses
	case 1:
	{
//	license_civ_driver = false;
//	license_civ_air = false;
	license_civ_eroina = false;
	license_civ_marijuana = false;
//	license_civ_gang = false;
//	license_civ_boat = false;
	license_civ_oil = false;
//	license_civ_dive = false;
//	license_civ_truck = false;
	license_civ_gun = false;
//	license_civ_rebel = false;
	license_civ_coke = false;
	license_civ_diamond = false;
	license_civ_copper = false;
	license_civ_iron = false;
	license_civ_sand = false;
	license_civ_salt = false;
	license_civ_cement = false;
//	license_civ_merc = false;
//	license_civ_home = false;
	license_civ_lsd = false;
	license_civ_mdma = false;
	license_civ_crack = false;
	license_civ_gold = false;
	license_civ_ruby = false;
	license_civ_emerald = false;
	//license_civ_mafia = false;
	//license_civ_soa = false;
	//license_civ_aod = false;
	//license_civ_atc = false;
//	license_civ_pass = false;
//	license_civ_contrabbando = false;
//	license_civ_birra = false;
//	license_civ_gomma = false;
//	license_civ_fdcanapa = false;
	license_civ_semtex = false;
//	license_civ_fdcotone = false;
//	license_civ_sigarette = false;
	license_civ_sigari = false;
//	license_civ_tequila = false;
//	license_civ_whisky = false;
//	license_civ_benzina = false;
	license_civ_napalm = false;
//	license_civ_morfina = false;
	license_civ_oppio = false;
//	license_civ_Volframio = false;
	license_civ_proiettili = false;
	};

	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
		//	license_civ_driver = false;
		//	license_civ_air = false;
		//	license_civ_truck = false;
		//	license_civ_boat = false;
		//	hint "Ti è stata revocata la patente di guida per omicidio.";
		};
	};

	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			//license_civ_gun = false;
			//hint "Ti è stato revocato il porto d'armi per omicidio.";
		};
	};
	case 4:
	{
		//license_civ_driver = false;
		//license_civ_air = false;
		//license_civ_dive = false;
		//license_civ_boat = false;
		//license_civ_gun = false;
		//license_civ_truck = false;
		//license_civ_driver = false;
		//license_civ_driver = false;
		
		//license_civ_heroin = false;
		//license_civ_marijuana = false;
		//license_civ_coke = false;
	};
};
