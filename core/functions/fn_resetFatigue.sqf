/*
	RESETTA FATICA
*/

[] spawn {
    while {true} do {
        if (life_fatigue < getFatigue player) then {
            player setFatigue life_fatigue;
        };
        sleep 10;
    }
};