/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {10000}; //Drivers License cost
	case "boat": {20000}; //Boating license cost
	case "pilot": {50000}; //Pilot/air license cost
	case "gun": {50000}; //Firearm/gun license cost
	case "dive": {50000}; //Diving license cost
	case "oil": {100000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {200000}; //Heroin processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {1000000}; //Gang license cost
	case "rebel": {75000}; //Rebel license cost
	case "truck": {50000}; //Truck license cost
	case "diamond": {150000};
	case "salt": {30000};
	case "cocaine": {300000};
	case "sand": {60000};
	case "iron": {75000};
	case "copper": {60000};
	case "cement": {30000};
	case "mair": {15000};
	case "merc": {75000}; //Costo Licenza Mercenari
	case "mafia": {75000}; //Costo Licenza Mercenari
	case "soa": {75000}; //Costo Licenza Mercenari
	case "aod": {50000}; //Costo Licenza aod
	case "atc": {75000}; //Costo Licenza ATC
	case "home": {500000}; //Housing
	case "mdma": {330000}; //Costo Licenze MDMA
	case "lsd": {18000}; //Costo Licenza lsd
	case "crack": {230000}; //Costo Licenza Crack
	case "gold": {110000}; //Costo Licenza Oro
	case "ruby": {170000}; //Costo Licenza Rubino
	case "emerald": {140000}; //Costo Licenza Smeraldo
	case "birra": {50000}; // birra   ------------
	case "ldrame": {30000};
	case "fdcanapa": {70000};
	case "marijuana": {170000};
	case "ldalluminio": {90000};
	case "morfina": {200000};
	case "eroina": {190000};
	case "ldferro": {110000};
	case "benzina": {130000};
	case "napalm": {210000};
	case "ldoro": {150000};
	case "ldplatino": {170000};
	case "cocainapura": {230000};
	case "uranioarricchito": {250000};
	case "copmessico": {0}; // copmessico
    case "copamericano": {0}; // copmessico
	case "meccanico": {0}; //meccanico
	case "terrorista": {0}; //meccanico
	case "spartan": {0}; //meccanico
	case "bb": {0}; //meccanico

};