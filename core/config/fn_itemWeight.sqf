/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {5};
	case "oilp": {4};
	case "tavolo": {5};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {6};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {2};
	case "tuna": {4};
	case "mullet": {2};
	case "catshark": {3};
	case "turtle": {4};
	case "fishing": {1};
	case "turtlesoup": {1};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {6};
	case "ironore": {6};
	case "copper_r": {4};
	case "iron_r": {4};
	case "sand": {6};
	case "salt": {6};
	case "salt_r": {4};
	case "glass": {4};
	case "diamond": {6};
	case "diamondc": {4};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {1};
	case "rock": {6};
	case "cement": {4};
	case "goldbar": {6};
	case "mdmau": {6};
	case "mdmap": {4};
	case "lsdu": {6};
	case "lsdp": {4};
	case "cracku": {6};
	case "crackp": {4};
	case "goldu": {6};
	case "goldp": {4};
	case "rubyu": {6};
	case "rubyp": {4};
	case "emeraldu": {6};
	case "emeraldp": {4};
	case "ganascia": {10};
	case "speedtrap": {1};
	case "laptop": {4};
	case "fuelPipe": {4};
	case "tenaglie": {2};
	case "speedtrapdetector": {4};
	case "storagesmall": {5};
    case "storagebig": {10};
	case "cannabisSeed": {2};
	case "cocaineSeed": {2};
	case "luppolo": {2};
	case "tartaruga": {2};
	case "rame": {2};
	case "canapa": {2};
	case "alluminio": {2};
	case "papavero": {2};
	case "ferro": {2};
	case "petrolio": {2};
	case "oro": {2};
	case "platino": {2};
	case "cocaina": {2};
	case "uranio": {2};
	case "birra": {2};
	case "ldrame": {1};
	case "fdcanapa": {1};
	case "marijuana": {1};
	case "ldalluminio": {1};
	case "morfina": {1};
	case "eroina": {1};
	case "ldferro": {1};
	case "benzina": {1};
	case "napalm": {1};
	case "ldoro": {1};
	case "ldplatino": {1};
	case "cocainapura": {1};
	case "uranioarricchito": {1};
	case "obirra": {1};
	case "orame": {1};
	case "ocanapa": {1};
	case "omarijuana": {1};
	case "oalluminio": {1};
	case "omorfina": {1};
	case "oeroina": {1};
	case "oferro": {1};
	case "obenzina": {1};
	case "onapalm": {1};
	case "oplatino": {1};
	case "ococainapura": {1};
	case "ooro": {1};
	default {1};
};
//aa