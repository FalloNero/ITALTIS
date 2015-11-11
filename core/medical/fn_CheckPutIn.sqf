////////////////////////////////////////////////
// Controlla veicoli vicini ed abilita l'opzione posiziona in veicolo
////////////////////////////////////////////////

	private["_unit"];
	_unit = player;
	_return = true ;
	if(isNull _unit OR !isPlayer _unit) then
	{
		_return = false;
	};

	_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],5] select 0;
	if(isNil "_nearestVehicle") then
	{
		_return = false;
	};
	_return
