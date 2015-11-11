/*
	blocca l'uso del bancomat per 5 minuti
*/
if (life_use_atm) then
{
	hint "Non potrai prelevare o depositare denaro per 5 minuti";
	life_use_atm = false;
	sleep ( 5 * 60);		//atm disabilitato per 8 minuti
	life_use_atm = true;
};

