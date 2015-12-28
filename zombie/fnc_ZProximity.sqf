/*
	file: fn_proximity.sqf
	author: corvobrok
	EDITED: CRY
	descripttion: create random zombies near the player (more zombies if you are in a city)
*/
_maxnum = zombielimit;
_units =  ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Nikos2","C_Driver_1_F"];
_suoni =  ["zomb1","zomb2","zomb3"];
_zombienum=0;

	while {true} do {

		_house= getPos player nearObjects ["House",120];
		_nhouse =count _house;
		if (zombielimit > 50) then {_zombienum = _nhouse;};
		if (zombielimit > 20 && zombielimit < 51)then {_zombienum =floor (_nhouse/2);};
		if (zombielimit < 21) then {_zombienum =floor (_nhouse/3);};
		if (_zombienum > _maxnum) then {_zombienum = _maxnum;};
		if (count zarray < _zombienum) then {
			_pos = [(position player select 0) + floor (random 400)-200, (position player select 1) +floor (random 400)-200, 0];
			_type = _units call BIS_fnc_selectRandom;
			_zombie = groupZMB createUnit [_type, _pos, [], 0, "NONE"];
			[_zombie]spawn fncZcontact;
			sleep 0.2;
		};
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
				hintsilent format ["DEBUGGING MENU\n>single player<\n\n>Spawned zombies: %1\n>House near player: %2\nMax Zombies: %3",(count zarray),count _house,_zombienum];
			}else
			{
				hintsilent format ["DEBUGGING MENU\n>dedicated server<\n\n>Spawned zombies: %1\n>House near player: %2\nMax Zombies: %3",(count zarray),count _house,_zombienum];
			};
		};
	};
