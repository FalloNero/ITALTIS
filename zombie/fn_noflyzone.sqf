//AUTHOR: CRY

while {true} do {
	_marker = noflyzone;

	_airaround = getmarkerpos _marker nearEntities ["Air", 6000];

	{

	hint "STAI ENTRANDO IN UNA NO FLY ZONE, HAI 30 SECONDI PER TORNARE INDIETRO!";
	sleep 10;
	hint "STAI ENTRANDO IN UNA NO FLY ZONE, HAI 20 SECONDI PER TORNARE INDIETRO!";
	sleep 10;
	hint "STAI ENTRANDO IN UNA NO FLY ZONE, HAI 10 SECONDI PER TORNARE INDIETRO!";
	sleep 10;
	hint "VERRAI ABBATTUTO!";
	_x setfuel 0;
	
	}foreach _airaround;


sleep 1;
};