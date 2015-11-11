/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
_backAtt = [_this,2,true,[true]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
if (_backAtt) then
{
	player switchMove "getOutPara";
	player playMoveNow "Incapacitated";
	sleep 10;
	player playMoveNow "amovppnemstpsraswrfldnon";
}else{
	[[player,"CL3_Anim_knockout1in"],"life_fnc_animSync",nil,FALSE] spawn life_fnc_MP;
	_currWeap = currentWeapon player;
	if (_currWeap != "")then
	{
		_pri = primaryWeapon player;
		_wh = nearestObjects [player,["GroundWeaponHolder"],3];
		if (count _wh == 0) then
		{		
			_pos = getPosATL player;
			_pos set [0,(_pos select 0) + 0.5];
			_wh  =   createVehicle ["GroundWeaponHolder", _pos,[], 0, "NONE"]; 
			_wh setPosATL _pos;
		}else{
			_wh = _wh select 0;
		};
		_wh addMagazineCargoGlobal [currentMagazine player,1] ;
		if (_currWeap == _pri) then
		{
			_wh addWeaponCargoGlobal[primaryWeapon player,1];
			{
				_wh addItemCargoGlobal [_x,1];
			} forEach (primaryWeaponItems player);
			player removeWeaponGlobal primaryWeapon player;
		}else{
			_wh addWeaponCargoGlobal[handgunWeapon player,1];
			{
				_wh addItemCargoGlobal [_x,1];
			} forEach (handGunItems player);
			player removeWeaponGlobal handgunWeapon player;
		};
	};
	sleep 3;
	[[player,"KIA_gunner_standUp01"],"life_fnc_animSync",nil,FALSE] spawn life_fnc_MP;
	sleep 10;
	[[player,"CL3_Anim_knockout1end"],"life_fnc_animSync",nil,FALSE] spawn life_fnc_MP;
};
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];

