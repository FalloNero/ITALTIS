/*
	File:
*/
private["_packet","_array","_flag"];
private["_position","_alt1","_alt2"];				//PLAYER POSITION

_position = [_this,0,[1,1,1],[[1,1,1]]]  call BIS_fnc_param;

//VICINO ALLA BANCA NON FUNZIA

if ((vehicle Player) isKindOf "Air") then
{
	_position = getPos Player ;
	if (_position select 2 > 1) then
	{
		_alt1 = _position select 2;
		_alt2 = (getPosATL Player) select 2 ;
		_alt2 = _alt2 - _alt1 ;
		_alt2 = _alt2 + 0.2 ;
		_position set [2,_alt2];
	};
}else{
	if ((_position select 0) == 1)then
	{
		_position = getPosATL Player ;
		if !((player distance [8254,6461.4531,0]) > 20)then
		{
			_position = [8276,6491,0];
		};
	};
};


_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case east: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;

_packet pushBack _array;
[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};
_packet pushBack _position;
_packet pushBack life_hunger;
_packet pushBack life_thirst;
if (damage player < 1)then
{
	_packet pushBack (damage player);
}else{
	_packet pushBack 0.9;
};
[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;