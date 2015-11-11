/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;
switch (_shop) do
{
	case "market": {["Mercato",["water","rabbit","apple","redgull","tbacon","tavolo","semierba","peach"]]};
    //case "rebel": {["Mercato Ribelli",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Mercato Gang", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","laptop","speedtrapdetector","fuelPipe","tenaglie","storagesmall","storagebig"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Spacciatore",["cocainep","heroinp","marijuana","mdmap","crackp","lsdp"]]};
	case "oil": {["Commerciante Petrolio",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Mercato del Pesce",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Vetraio",["glass"]]};
	case "iron": {["Commerciante Metalli",["iron_r","copper_r"]]};
	case "diamond": {["Mercante Gioielli",["diamond","diamondc","emeraldu","emeraldp","rubyu","rubyp","goldu","goldp"]]};
	case "salt": {["Mercante Sale",["salt_r"]]};
	case "cop": {["Dotazione Agenti",["donuts","coffee","spikeStrip","water","redgull","fuelF","ganascia","speedtrap","laptop"]]};
	case "cement": {["Rivenditore Cemento",["cement"]]};
	case "tool": {["Tools Market",["lockpick","pickaxe","storagesmall","storagebig","laptop","speedtrapdetector","tenaglie"]]};
	case "gas": {["Gas Station",["fuelPipe","fuelF"]]};
	case "birra": {["Birra",[""]]};
	case "fdcanapa": {["Vendita Fibra di Canapa",[""]]};
	case "morfina": {["Vendita Morfina",[""]]};
	case "ldalluminio": {["Vendita Alluminio",[""]]};
	case "napalm": {["Vendita Napalm",[""]]};
	case "ferro": {["Vendtia Ferro",[""]]};
	case "oro": {["Vendita Oro",[""]]};
	case "benzina": {["Vendita Benza",[""]]};
	case "tartaruga": {["Bracconiere",[""]]};
	case "rame": {["Vendita Rame",[""]]};
	case "platino": {["Vendita Platino",[""]]};
	case "spacciatore": {["Spacciatore",[""]]};
	case "mecstore": {["Lego Store",[""]]};
	};