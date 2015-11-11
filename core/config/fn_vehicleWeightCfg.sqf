/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{

	case "C_Quadbike_01_F": {10};
	case "C_Offroad_01_F": {40};
	case "C_Hatchback_01_F": {10};
	case "C_SUV_01_F": {30};
	case "C_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {200};
	case "C_Hatchback_01_sport_F": {10};
	case "O_Truck_02_covered_F": {300};
	case "O_Truck_02_transport_F": {350};
	case "O_Truck_03_ammo_F": {400};
	case "O_Truck_03_device_F": {500};
	case "B_Truck_01_covered_F": {600};
	case "B_Truck_01_box_F": {700};
	case "B_Heli_Light_01_F": {40};
	case "O_Heli_Light_02_unarmed_F": {80};
	case "I_Heli_Transport_02_F": {160};
	case "B_Heli_Transport_03_unarmed_F": {320};
	case "C_Rubberboat": {40};
	case "C_Boat_Civil_01_F": {80};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	
	default {-1};
};