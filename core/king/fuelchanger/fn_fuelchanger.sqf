/*
	File: fn_fuelchanger.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	monitors the fuel of the vehicle 
*/

private["_veh","_veh_type","_factor","_factor_calculated","_manipulation","_fuel","_fuel_old","_fuel_new","_fuel_diff"];
while {true} do
{
	waitUntil {sleep 0.1; (vehicle player != player && (driver (vehicle player)) == player)};
	//hint "enter";
	_veh = vehicle player;
	_veh_type = typeof _veh;
	_fuel_old = fuel _veh;
	
	//Add new cars here
	switch(true) do
	{
		case (_veh_type == "O_Heli_Light_02_unarmed_F"): {_factor = 5;};
		case (_veh_type == "I_Heli_Transport_02_F"): {_factor = 5;};
		case (_veh_type == "I_Heli_light_03_unarmed_F"): {_factor = 5;};
		case (_veh_type == "B_Heli_Light_01_F"): {_factor = 1;}; //Hummingbird
		case (_veh_type == "A3L_PuntoWhite"): {_factor = 1;}; 
		case (_veh_type == "A3L_PuntoGrey"): {_factor = 1;}; 
		case (_veh_type == "A3L_PuntoBlack"): {_factor = 1;}; 
		case (_veh_type == "A3L_PuntoRed"): {_factor = 1;}; 
		case (_veh_type == "A3L_PuntoBlue"): {_factor = 1;}; 	
		case (_veh_type == "A3L_AmberLamps"): {_factor = 1;}; 
		case (_veh_type == "A3L_VolksWagenGTired"): {_factor = 1;}; 
		case (_veh_type == "A3L_VolksWagenGTiwhite"): {_factor = 1;}; 
		case (_veh_type == "A3L_VolksWagenGTiblue"): {_factor = 1;}; 
		case (_veh_type == "A3L_VolksWagenGTiblack"): {_factor = 1;}; 
		case (_veh_type == "A3L_FordKaRed"): {_factor = 1;}; 
		case (_veh_type == "A3L_FordKaBlack"): {_factor = 1;}; 
		case (_veh_type == "A3L_FordKaBlue"): {_factor = 1;}; 
		case (_veh_type == "A3L_FordKaWhite"): {_factor = 1;}; 
		case (_veh_type == "A3L_Cooper_concept_black"): {_factor = 1;}; 
		case (_veh_type == "A3L_Cooper_concept_white"): {_factor = 1;}; 
		case (_veh_type == "A3L_Cooper_concept_blue"): {_factor = 1;}; 
		case (_veh_type == "A3L_Cooper_concept_red"): {_factor = 1;}; 
		case (_veh_type == "A3L_RX7_Black"): {_factor = 1;}; 
		case (_veh_type == "A3L_RX7_Blue"): {_factor = 1;}; 
		case (_veh_type == "A3L_RX7_White"): {_factor = 1;}; 
		case (_veh_type == "A3L_RX7_Red"): {_factor = 1;}; 
		case (_veh_type == "Camaro_base"): {_factor = 1;}; 
		case (_veh_type == "A3L_Camaro"): {_factor = 1;}; 
		case (_veh_type == "C_Kart_01_Blu_F"): {_factor = 3;}; 
		case (_veh_type == "C_Kart_01_Fuel_F"): {_factor = 3;}; 
		case (_veh_type == "C_Kart_01_Red_F"): {_factor = 3;}; 
		case (_veh_type == "C_Kart_01_Vrana_F"): {_factor = 3;}; 
		case (_veh_type == "jetski_epoch_blu"): {_factor = 1;}; 
		case (_veh_type == "jetski_epoch"): {_factor = 1;}; 
		case (_veh_type == "ebike_epoch"): {_factor = 1;}; 
		case (_veh_type == "A3L_SuburbanWhite"): {_factor = 1;}; 
		case (_veh_type == "A3L_SuburbanBlue"): {_factor = 1;};
		case (_veh_type == "A3L_SuburbanRed"): {_factor = 1;}; 
		case (_veh_type == "A3L_SuburbanBlack"): {_factor = 1;};
		case (_veh_type == "A3L_SuburbanGrey"): {_factor = 1;}; 
		case (_veh_type == "A3L_SuburbanOrange"): {_factor = 1;};
				
		
		default {_factor = 5;};
	};
	
	while {true} do
	{
		if(vehicle player == player) exitWith {};
		if((driver (vehicle player)) != player) exitWith {};
		if(!(alive (vehicle player))) exitWith {};

		_manipulation = _veh getVariable["king_fuel_manipulation_factor",0];
		
		_fuel = fuel _veh;
		_fuel_diff = _fuel_old - _fuel;
		_factor_calculated = _factor + _manipulation;
		if(_fuel_diff > 0) then
		{
			_fuel_new = _fuel - ((_factor_calculated * _fuel_diff) - _fuel_diff);
			if(_fuel_new < 0) then
			{
				_fuel_new = 0;
			};
			if(_factor_calculated != 1) then
			{
				_veh setFuel _fuel_new;
			};
		};
		_fuel_old = fuel _veh;
		
		sleep 0.5;
	};

};