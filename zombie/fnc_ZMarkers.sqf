/*
	file: fn_zombieinit.sqg
	author: corvobrok
	
	descripttion: create random zombies near the player (more zombies if you are in a city)
*/
_units =  ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Driver_1_F"];
_suoni =  ["zomb1","zomb2","zomb3"];

_marker = zombiemkr select 0;

	while {true} do {
		{
			_marker = _x;
		
		if (player distance getmarkerpos _marker < markerdist) then
		{
			if (count zarray < zombielimit) then {
				_pos = [(position player select 0) + floor (random 400)-200, (position player select 1) +floor (random 400)-200, 0];
				_type = _units call BIS_fnc_selectRandom;
				_type createUnit [_pos, groupZMB,"[this]spawn fncZcontact;"];
				sleep 0.2;
			};
		} else {sleep 3;};
		}foreach zombiemkr;
		
		
		sleep 1;
		_rand = floor (random 2);
		if (count zarray >2 && _rand > 0) then
		{
			_one = zarray call BIS_fnc_selectRandom;
			_two = _suoni call BIS_fnc_selectRandom;
			_one say3d _two;
		};
		
		if (zdebugging > 0) then
		{
			if (!isdedicated) then 
			{
				hintsilent format ["DEBUGGING MENU\n>single player<\n\n>Spawned zombies: %1\n>Nearest Marker: %2m",(count zarray),floor (player distance getmarkerpos _marker)];
			}else
			{
				hintsilent format ["DEBUGGING MENU\n>dedicated server<\n\n>Spawned zombies: %1\n>Nearest Marker: %2m",(count zarray),floor (player distance getmarkerpos _marker)];
			};
		};
	};
