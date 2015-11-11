_vehicle = _this select 0;
_fuel = _this select 1;

_vehicle setFuel (_fuel min 1);