#include <macro.h>
/*
	File: core\furniture\fn_placeFurniture.sqf
	Author: FRS
	
	Description:
	Place and check the position of the furniture
*/
_obj = (_this select 3) select 0;
_house = (_this select 3) select 1;
_mode = (_this select 3) select 2;			
_inside = nil;
_inside = [_obj,_house] call life_fnc_isInsideBuilding;
waitUntil {!(isNil "_inside")};
if (!(_inside)) exitWith {hint "Non puoi piazzare oggetti fuori dai confini della proprietà"};
if(!isNull life_furnObj) then {
	detach life_furnObj; 
	life_furnObj = ObjNull;
}; 
player removeAction life_action_furnDeploy; 
life_action_furnDeploy = nil;
//_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];

//SAVE FURNITURE
if (_mode == 1) then
{
	_obj setVariable ["furniture_owner",steamid,true];
	_containers = _house getVariable["containers",[]];
	_containers pushBack _obj;
	_house setVariable["containers",_containers,true];
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
}else{
//UPDATE FURNITURE


};