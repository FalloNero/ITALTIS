//AUTHOR: CRY

    _killer = _this select 1;

    if (_killer != (_this select 0)) then {
	
		_punti=(_killer getVariable ["KillPoints", 0]);
        _killer setVariable ["KillPoints", (_punti + 1), true];
		[] call life_fnc_hudUpdate;
		
		};
