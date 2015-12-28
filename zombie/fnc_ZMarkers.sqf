/*
	file: fn_zombieinit.sqg
	author: corvobrok
	
	descripttion: create random zombies near the player (more zombies if you are in a city)
*/
_units =  ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Driver_1_F"];
_suoni =  ["zomb1","zomb2","zomb3"];


	while {true} do {
	{

			_marker = _x;
			_unitsaround = getmarkerpos _marker nearEntities ["Man", markerdist];
			_targets = [];

		{
		if (isPlayer _x) then
			{
				_targets = _targets +[_x];
			};
		
				sleep 0.01;
				}foreach _unitsaround;
		
	
			_stocazzo = count _targets;
		
				if (_stocazzo >= 1) then {
				{
				//hint "spawning...";
					if (count zarray < (zombielimit*_stocazzo)) then {
						_pos = [(position _x select 0) + floor (random 400)-200, (position _x select 1) +floor (random 400)-200, 0];
						_type = _units call BIS_fnc_selectRandom;
						_type createUnit [_pos, groupZMB,"[this]spawn fncZcontact;"];
					};
		
				sleep 0.5;
				}foreach _targets;
				};
			
	}foreach zombiemkr;

			
		
		sleep 0.5;
		_rand = floor (random 2);
		if (count zarray >2 && _rand > 0) then
		{
			_one = zarray call BIS_fnc_selectRandom;
			_two = _suoni call BIS_fnc_selectRandom;
			_one say3d _two;
		};
		
		
	};
