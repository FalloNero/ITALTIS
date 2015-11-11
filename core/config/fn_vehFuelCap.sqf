/*
	File: fn_vehFuelCap.sqf
	Author: MarioF
	
	Description:
	Holds the Fuel Capacity of all vehicle 
*/

private["_veh"];

_veh = [_this,0,""] call BIS_fnc_param;

switch(_veh) do
{
	case "C_Offroad_01_F": 				{50};
	case "B_G_Offroad_01_F": 			{70};
	case "B_Quadbike_01_F": 			{15};
	case "I_Truck_02_covered_F": 		{800};
	case "I_Truck_02_transport_F": 		{800};
	case "C_Hatchback_01_F": 			{45};
	case "C_Hatchback_01_sport_F": 		{45};
	case "C_SUV_01_F": 					{80};
	case "C_Van_01_transport_F": 		{80};
	case "I_G_Van_01_transport_F": 		{80};
	case "C_Van_01_box_F": 				{80};
	case "B_Truck_01_box_F": 			{1600};
	case "B_Truck_01_transport_F": 		{1400};
	case "I_Heli_light_03_unarmed_F":	{1600};
	case "B_MRAP_01_F": 				{600};
	case "O_MRAP_02_F": 				{600};
	case "B_Heli_Light_01_F": 			{1000};
	case "O_Heli_Light_02_unarmed_F": 	{1600};
	case "I_Heli_Transport_02_F": 		{3600};
	case "C_Van_01_fuel_F":				{120};
	case "C_Van_01_fuel_F_TRAILER":		{6000};
	default {100};
};