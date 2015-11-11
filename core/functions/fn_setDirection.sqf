/*
	SETTA LA DIREZIONE DIO BONO
*/
private["_unit","_anim"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_ang = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_unit setDir 180;