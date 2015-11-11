#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",25000],
			["C_Kart_01_Fuel_F",25000],
			["C_Kart_01_Red_F",25000],
			["C_Kart_01_Vrana_F",25000]
		];
	};
	case "bike_shop":
	{
		_return = [		
			
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",20000],
			["C_SUV_01_F",30000]
		];
	};

	case "med_air_hs": 
	{
		_return = [
			["B_Heli_Light_01_F",100000],
			["O_Heli_Light_02_unarmed_F",200000]		
		];
	};

	case "civ_car":
	{
		_return =
		[
			["C_Quadbike_01_F",10000],
			["C_Offroad_01_F",80000],
			["C_SUV_01_F",120000],
			["C_Van_01_transport_F",250000],
			["C_Van_01_box_F",400000],
			["C_Hatchback_01_sport_F",100000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["O_Truck_02_covered_F",1000000],
			["O_Truck_02_transport_F",1400000],
			["O_Truck_03_ammo_F",1600000],
			["B_Truck_01_covered_F",2400000],
			["B_Truck_01_box_F",2800000]
		];
	};

	case "mafia_air":
	{
	if(license_civ_mafia) then
		{
		_return =
		[
			["B_Heli_Light_01_F",400000],
            ["O_Heli_Light_02_unarmed_F",800000]
		];
		};
	};
	case "mafia_gar":
	{
	if(license_civ_mafia) then
		{
		_return =
		[
			["C_Offroad_01_F",80000],
			["C_SUV_01_F",120000],
			["O_MRAP_02_F",750000]
		];
	};
	};

	case "spartan_gar":
	{
	if(license_civ_spartan) then
		{
		_return =
		[
			["C_Quadbike_01_F",10000],
			["O_G_Offroad_01_F",80000],
			["C_SUV_01_F",120000],
			["O_MRAP_02_F",500000]
		];
	};
};
	case "spartan_air":
	{
	if(license_civ_spartan) then
		{
		_return =
		[
			["B_Heli_Light_01_F",400000],
			["O_Heli_Light_02_unarmed_F",800000]
		];
	};
};
	case "mec_car":
	{
		switch(true) do
			{
				case (playerSide != civilian): {_weap = "Non sei un civile!"};
				case (!license_civ_meccanico): {_weap = "Non sei un meccano"};
		default
		{
		_return =
		[
			["B_Truck_01_mover_F",50000]
		];
	};
	};
	};
	
	case "cop_car":
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack["B_Quadbike_01_F",2500];	
		};
		if(__GETC__(life_coplevel) > 1) then
		{	
			_return pushBack["C_Offroad_01_F",20000];	
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack["C_Hatchback_01_F",5000];	
		};
		if(__GETC__(life_coplevel) > 3) then
		{			
			_return pushBack["C_SUV_01_F",30000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{			
			_return pushBack["C_Hatchback_01_sport_blue_F",12500];
		};
		if(__GETC__(life_coplevel) > 5) then
		{			
			_return pushBack["B_MRAP_01_F",450000];
		};
	};


	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",400000],
			["O_Heli_Light_02_unarmed_F",800000],
			["I_Heli_Transport_02_F",2800000]
		];
	};

	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return = [["B_Heli_Light_01_F",100000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack["O_Heli_Light_02_unarmed_F",200000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack["I_Heli_light_03_unarmed_F",50000];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack["B_Heli_Transport_01_F",75000];
			_return pushBack["I_Heli_Transport_02_F",450000];
		};
	};

	case "cop_airhq":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return = [["B_Heli_Light_01_F",100000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack["O_Heli_Light_02_unarmed_F",200000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack["I_Heli_light_03_unarmed_F",50000];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack["B_Heli_Transport_01_F",75000];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",70000],
			["C_Boat_Civil_01_F",200000]
		];

	};

	case "cop_ship":
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_return = [["B_Boat_Transport_01_F",10000]];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack["C_Boat_Civil_01_police_F",20000];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack["B_SDV_01_F",30000];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack["B_Boat_Armed_01_minigun_F",150000];
		};
	};
	


};

_return;
