/* mah questo script ti dovrebbe dare il loot se uccidi uno zombie */

_unit addEventHandler ["Killed", {_this call f_assignKillPoint}];



f_assignKillPoint = {

    _killer = _this select 1;

    if (_killer != (_this select 0)) then {

        _killer setVariable ["KillPoints", ((_killer getVariable ["KillPoints", 0]) + 1), true];
		hint format["TOTALE PUNTI: %1",(_killer getVariable ["KillPoints", 0])];

    };

};
