////////////////////////////////////////////////
// Metti nel veicolo persone ferite se il veicolo è aperto
////////////////////////////////////////////////

	private["_unit"];
	_unit = FAR_isDragging_EH;
	_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],5] select 0;
	if (locked _nearestVehicle == 2) exitwith {hint "Veicolo chiuso"};
	// Switch back to default animation
	player playMove "amovpknlmstpsraswrfldnon";
	FAR_isDragging = false;
	detach _unit;
	[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call life_fnc_MP;
	[[_unit,"KIA_driver_mid01"],"life_fnc_animSync",true,FALSE] spawn life_fnc_MP;
	_unit setVariable["Escorting",FALSE,TRUE];
	_unit setVariable["transporting",TRUE,TRUE];
	hint "Ferito posizionato nel veicolo";
