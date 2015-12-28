/*
	file: fn_zcontact.sqf
	author: corvobrok
	EDITED: CRY

	description:
	IA zombie
*/


_suoni =  ["zomb1","zomb2","zomb3"];
_zombie = _this select 0;
	
		_zombie disableAI "FSM";
		_zombie disableAI "AUTOTARGET";
		_zombie disableAI "TARGET";
		_zombie setBehaviour "CARELESS";
		_zombie disableConversation true;
		_zombie addRating -10000;
		_zombie addEventHandler ["killed", {_this call life_fnc_loot;}];
		zarray=zarray+[_zombie];
		//if (zombierun < 1) then {_zombie setdamage 0.5;};

while {alive _zombie} do {
	_unitsaround = _zombie nearEntities ["CAManBase", 300];
	_targets = [];

	
	{
	if (isPlayer _x) then {
	if (group _x != groupZMB) then
		{
			_targets = _targets +[_x];
			
		};
		};
		sleep 0.01;
	}foreach _unitsaround;
	
_ntargets = count _targets;
	
	if (_ntargets >=1) then 
	{
		
		//hint "zombie!";
		{
		_target = _x;		
				if (_zombie distance getposATL _target < 150) then {_zombie doMove getposATL _target;};
				if (_zombie distance getposATL _target < 3 && alive _target  && _target != _zombie) then 
					{
						_zombie switchMove "AwopPercMstpSgthWnonDnon_end";
						_target setDamage (damage _target + (zombiedamage/100));
						_zombie say3d "zomb2";
						sleep 1;
					};						
		sleep 1;
		}foreach _targets;
	}
	else
	{
			zarray = zarray - [_zombie];
			deletevehicle _zombie;
	};

	sleep 1;
};




[] call life_fnc_hudUpdate;

player addRating 2000;
_zombie setdamage 1;
sleep respawntime;
zarray = zarray - [_zombie];
deletevehicle _zombie;