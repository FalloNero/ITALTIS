//AUTHOR: CRY

_punti=(player getVariable ["KillPoints", 0]);
_monei=(10000 * _punti);
life_cash = life_cash + _monei;

hint format ["Eccoti la ricompensa di: %1",_monei];

player setVariable ["KillPoints",0, true];
[] call life_fnc_hudUpdate;
		
