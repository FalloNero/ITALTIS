#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through life_fnc_MP
*/
private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case east: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

switch(_mode) do {
	case 0: {
		_packet set[2,life_cash];
	};
	
	case 1: {
		_packet set[2,life_atmcash];
	};
	
	case 2: {
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach life_licenses;
		
		_packet set[2,_array];
	};
	
	case 3: {
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
	};
	
	case 4: {
		//Not yet implemented
	};
	
	case 5: {
		_packet set[2,life_is_arrested];
	};
	
	case 6: {
		_packet set[2,life_cash];
		_packet set[4,life_atmcash];
	};
	case 7: {
			//UPDATE KEY MANAGER
	};
	case 8: {
		//UPDATE POSITION
		_position = [_this,1,[1,1,1],[[1,1,1]]]  call BIS_fnc_param;
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
				_position = getPosATL player ;
				if !((player distance [8254,6461.4531,0]) > 20)then
				{
					_position = [8276,6491,0];
				};
			};
		};
		life_lsposition = _position ;
		_packet set [2,_position];	
	};
	case 9: {
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
		_packet set[4,life_cash];
	};
};

[_packet,"DB_fnc_updatePartial",false,false] call life_fnc_MP;