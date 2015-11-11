/*
	REMOVE WEAPON FROM TARGET
*/

_unit = player;
if((time - life_action_delay) < 1.3) exitWith {
    hint "You can't rapidly use action keys!";
    if(!isNil {(_unit) getVariable "inUse"}) then {
        _unit setVariable["inUse",false,true];
    };
};


_wh = nearestObjects [_unit,["GroundWeaponHolder"],3];
if (count _wh == 0) then
{		
	_pos = getPosATL _unit;
	_pos set [0,(_pos select 0) + 0.5];
	_wh  =  createVehicle ["GroundWeaponHolder", _pos,[], 0, "NONE"]; 
	_wh setPosATL _pos;
}else{
	_wh = _wh select 0;
};

if (primaryWeapon _unit != "") then
{
	_wh addWeaponCargoGlobal[primaryWeapon player,1];
	{
		_wh addItemCargoGlobal [_x,1];
	} forEach (primaryWeaponItems _unit);
	_wh addMagazineCargoGlobal [(primaryWeaponMagazine _unit) select 0,1] ;
	_unit removeWeaponGlobal primaryWeapon _unit;
	//player action ["DropWeapon", _wh, primaryWeapon player];
};

if (handgunWeapon _unit != "") then
{
	_wh addWeaponCargoGlobal[handgunWeapon _unit,1];
	{
		_wh addItemCargoGlobal [_x,1];
	} forEach (handGunItems _unit);
	_wh addMagazineCargoGlobal [(handgunMagazine _unit) select 0 ,1];
	_unit removeWeaponGlobal handgunWeapon _unit;
	//player action ["DropWeapon", _wh, handgunWeapon player];
};

{
	_wh addItemCargoGlobal [_x,1];
	_unit removemagazine  _x;
} forEach (magazines _unit);

life_action_delay = time;
_unit setVariable["inUse",false,true];