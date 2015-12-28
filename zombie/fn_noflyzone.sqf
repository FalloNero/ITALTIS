//AUTHOR: CRY

while {true} do {
	
	_airaround = getmarkerpos "noflyzone" nearEntities ["Air", 6000];

	{

	if (player in _x) then {hint "STAI ENTRANDO IN UNA NO FLY ZONE, HAI 30 SECONDI PER TORNARE INDIETRO!";};
	sleep 10;
	if (player in _x) then {hint "STAI ENTRANDO IN UNA NO FLY ZONE, HAI 20 SECONDI PER TORNARE INDIETRO!";};
	sleep 10;
	if (player in _x) then {hint "STAI ENTRANDO IN UNA NO FLY ZONE, HAI 10 SECONDI PER TORNARE INDIETRO!";};
	sleep 10;
	if (player in _x) then {hint "VERRAI ABBATTUTO!";};
	_x setfuel 0;
	sleep 10;
	}foreach _airaround;


sleep 1;
};