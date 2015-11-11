/*
	BRUCIAMOLI TUTTI
*/


private ["_fire","_target","_admin","_name"];
_fire = _this select 0;
_target = _this select 1;
_admin = _this select 2;
_name = _target getVariable ["realname",name _target];
hint "Un admin ti ha dato fuoco";
life_burn = _fire;

[{hint format ["Hai bruciato vivo %1",name player];},"BIS_fnc_Spawn",_admin,false] call BIS_fnc_MP;
_target setdamage 1;
waitUntil {!(alive _target)};
//deletevehicle _fire;


/* 
while {alive _target} do
{
	_fire setPosATL (getPosATL _target);
};
deletevehicle _fire;
*/

//[{hint format ["Hai bruciato vivo %1",name player];},"BIS_fnc_Spawn",_admin,false] call BIS_fnc_MP;