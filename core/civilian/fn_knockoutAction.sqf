/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target","_backAtt"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_backAtt = true ;
//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 2) exitWith {};
life_knockout = true;

//player say3d "knockout";
_dirTar = getDir _target ; 
_dirP = getDir Player ;  
_frontDir = 0;
if (_dirTar < 180) then
{
	_frontDir = _dirTar + 180;  
}else{
	_frontDir = _dirTar - 180;  
};

_frontDirMin = _frontDir  - 80;  
_frontDirMax = _frontDir  + 80;  


_frontDirMin =  ( _frontDirMin / 360) ;
_frontDirMax =  ( _frontDirMax / 360) ;
_dirP = (_dirP/ 360) ;

if ((_dirP > (_frontDirMin))&&(_dirP < (_frontDirMax)))then  { 
	_backAtt = false;   
}else{  
	_backAtt  = true ;  
};

[[_target, "knockout"],"life_fnc_playSound",nil,false] spawn life_fnc_MP;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] call life_fnc_MP;
/*
if ((currentWeapon player != "") && (currentWeapon player == primaryWeapon player))then
{
	[[player,"CL3_Anim_WeaponHit"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
}else{
	[[player,"CL3_Anim_Punch4"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
};
*/

sleep 0.8;
//[[_target,player getVariable["realname",name player]],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;
[[_target,profileName,_backAtt],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;


sleep 3;
life_knockout = false;