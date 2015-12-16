/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rosso";};
			case 1: {_color = "Giallo";};
			case 2: {_color = "Bianco";};
			case 3: {_color = "Blu";};
			case 4: {_color = "Rosso scuro";};
			case 5: {_color = "Blu/Bianco"};
			case 6: {_color = "Polizia Normale"};
			case 7: {_color = "Polizia Nero"};
			case 8: {_color = "Taxi"};
			case 9: {_color = "Medico"};
			case 10: {_color = "Mafia"};
			case 11: {_color = "Monster"};
			case 12: {_color = "Ferrari"};
			case 13: {_color = "Universo"};
			case 14: {_color = "Arcobaleno"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Verde";};
			case 2: {_color = "Blu";};
			case 3: {_color = "Blu Scuro";};
			case 4: {_color = "Giallo";};
			case 5: {_color = "Bianco"};
			case 6: {_color = "Grigio"};
			case 7: {_color = "Polizia Nero"};
			case 8: {_color = "Arcobaleno"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rosso"};
			case 1: {_color = "Blu scuro"};
			case 2: {_color = "Arancione"};
			case 3: {_color = "Nero / Bianco"};
			case 4: {_color = "Marrone"};
			case 5: {_color = "Verde"};
			case 6: {_color = "Polizia"};
			case 7: {_color = "Arcobaleno"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rosso Scuro";};
			case 1: {_color = "Polizia Normale";};
			case 2: {_color = "Grigio";};
			case 3: {_color = "Arancione";};
			case 4: {_color = "Polizia Nero";};
			case 5: {_color = "Medico"};
			case 6: {_color = "Mafia"};
			case 7: {_color = "Fiamme"};
			case 8: {_color = "Strisce"};
			case 9: {_color = "Jaguar"};
			case 10: {_color = "Universo"};
			case 11: {_color = "Arcobaleno"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Bianco"};
			case 1: {_color = "Rosso"};
			case 2: {_color = "Arcobaleno"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Bianco"};
			case 1: {_color = "Rosso"};
			case 2: {_color = "Arcobaleno"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Bianco"};
			case 1: {_color = "Rosso"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Polizia"};
			case 1: {_color = "Deserto digitale"};
			case 2: {_color = "Nero"};
			case 3: {_color = "Blu"};
			case 4: {_color = "Rosso"};
			case 5: {_color = "Bianco"};
			case 6: {_color = "Verde digitale"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
			case 9: {_color = "Marrone"};
			case 10: {_color = "Arcobaleno"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizia"};
			case 1: {_color = "Nero"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Medico"};
			case 15: {_color = "Spartan"};
			case 16: {_color = "Arcobaleno"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Spartan"};
			case 5: {_color = "Medico"};
			case 6: {_color = "Arcobaleno"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizia Normale"};
			case 1: {_color = "Polizia Nero"};
			case 2: {_color = "Polizia Penitenziaria"};
			case 3: {_color = "Arcobaleno"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
			case 2: {_color = "Arcobaleno"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
			case 2: {_color = "Arcobaleno"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizia Penitenziaria"};
			case 1: {_color = "Ion"};
			case 2: {_color = "Dahoman"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
};

_color;