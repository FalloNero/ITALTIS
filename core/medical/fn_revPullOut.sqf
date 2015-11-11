////////////////////////////////////////////////
// Estrae feriti dal veicolo se presenti e se il veicolo è aperto
////////////////////////////////////////////////

	private["_unit","_crew","_rev"];
	_unit = _this select 0 ;
	_crew = crew _unit;
	{
		_rev = (_x getVariable "FAR_isUnconscious");
		if (_rev == 1)then
		{
			_x setVariable["Escorting",FALSE,TRUE];
			_x setVariable["transporting",FALSE,TRUE];
			moveOut _x;
			sleep 1;
			[[_x,""],"life_fnc_animSync",_x,FALSE] spawn life_fnc_MP;
			[[_x,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",_x,FALSE] spawn life_fnc_MP;
			_unit switchMove "AinjPpneMstpSnonWrflDnon";
			//[[_x,"AinjPpneMstpSnonWrflDnon_rolltoback"],"life_fnc_animSync",_x,FALSE] spawn life_fnc_MP;
			//_x switchMove "";
			//_x playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
		};
	}foreach _crew;


