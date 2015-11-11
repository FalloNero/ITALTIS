/*
	File: fn_trapped.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/



private["_trapped_infos","_trap_object","_speed","_limit","_diff"];

_trapped_infos = [_this,0,[],[[]]] call BIS_fnc_param;
_trap_object   = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _trap_object) exitwith {};

_speed = _trapped_infos select 2;
_limit = _trapped_infos select 3;
_diff = round (_speed - _limit);

titleText[format["Limite velocità superato %1km/h",_diff],"PLAIN"];

_trap_object say3D "Speedtrap";

//send little flash to everyone
[[_trap_object],"king_fnc_trappedFlash",true,false] spawn life_fnc_MP;

"dynamicBlur" ppEffectEnable true;  
"dynamicBlur" ppEffectAdjust [20];  
"dynamicBlur" ppEffectCommit 0.05;
sleep 0.01;
"dynamicBlur" ppEffectAdjust [0];  
"dynamicBlur" ppEffectCommit 0.05;


