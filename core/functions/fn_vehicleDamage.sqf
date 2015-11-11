private["_unit","_damage"];

_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;

_vehDamage1 = damage (vehicle _unit) ;
if (_part == "") then{
	_vehDamage1 = damage (vehicle _unit) + _damage;
}else{
	if (_part == "palivo") then{
		_vehDamage1 = damage (vehicle _unit) + _damage;
	}else{
		if (_part == "?") then{
		_vehDamage1 = damage (vehicle _unit) + _damage;
		};
	};
};

if (_vehDamage1 >= 1)then
{
	{
		detach _x;deletevehicle _x;
	} forEach attachedObjects _unit;

	_damage = 0;
	(vehicle _unit) setDamage 0.8;
	(vehicle _unit) setVariable ["vehicle_disabled",true,true];
	(vehicle _unit) setFuel 0;
	(vehicle _unit) allowDamage false;
	_crew = crew (vehicle _unit);
	{
		moveOut _x;
	}foreach _crew;
	[(vehicle _unit)] spawn TON_fnc_vehicleDead;
};
hint format ["%1 \n\n %2 \n\n %3 \n\n %4",vehicle _unit,_part,_damage,_palDamage];
_damage