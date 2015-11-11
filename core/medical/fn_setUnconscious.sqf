////////////////////////////////////////////////
// Make Player Unconscious
////////////////////////////////////////////////

	private["_unit", "_killer"];
	_unit = player;

	if (isPlayer _unit) then
	{

		_unit setVariable ["FAR_isUnconscious", 1, true];
		_unit setVariable ["revive",false, true];
		_unit setVariable ["looted",0,true];
		_unit setDamage 0.10;
		_unit setVelocity [0,0,0];
		_unit allowDamage false;
		_unit setCaptive true;
	};
	//[[_unit,""],"life_fnc_animSync",_unit,FALSE] spawn life_fnc_MP;
	//[[_unit,"AinjPpneMstpSnonWrflDnon_rolltoback"],"life_fnc_animSync",_unit,FALSE] spawn life_fnc_MP;
	_unit switchMove "";
	//_unit switchMove "AinjPpneMstpSnonWrflDnon_rolltoback";
	
	//while {animationstate player != "AinjPpneMstpSnonWrflDnon_rolltoback"} do
	//{
	//	_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
	//};
	//WaitUntil {animationstate player == "AinjPpneMstpSnonWrflDnon_rolltoback"};
	//sleep 2;

	
	sleep 2;
	if (isPlayer _unit) then
	{
		//titleText ["", "BLACK IN", 1];
		disableUserInput false;

		// Mute ACRE
		_unit setVariable ["ace_sys_wounds_uncon", true];
	};

	//[[_unit,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",nil,FALSE] spawn life_fnc_MP;
	//_unit switchMove "AinjPpneMstpSnonWrflDnon";
	_unit playMoveNow "AinjPpneMstpSnonWrflDnon";
	//_unit enableSimulation false;
	//_unit setVariable ["FAR_isUnconscious", 1, true];
	// Call this code only on players
	if (isPlayer _unit) then
	{
		_bleedOut = time + FAR_BleedOut;
		//[_unit] spawn life_fnc_injuredEffects;
		while { !isNull _unit && alive _unit && _unit getVariable "FAR_isUnconscious" == 1 && _unit getVariable "FAR_isStabilized" == 0 && (FAR_BleedOut <= 0 || time < _bleedOut) } do
		{
			//hintSilent format["Dissanguamento in %1 secondi\n\n%2\n\n%3", round (_bleedOut - time), call life_fnc_CheckFriendlies,"Inserito per future implementazioni"];
			if (vehicle _unit != _unit) then
			{
				if (damage (vehicle _unit) >= 1 ) then
				{	
					moveOut _unit;
					_unit setVariable["Escorting",FALSE,TRUE];
					_unit setVariable["transporting",FALSE,TRUE];
					_unit switchMove "";
					//[[_unit,""],"life_fnc_animSync",_unit,FALSE] spawn life_fnc_MP;
					//[[_unit,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",nil,FALSE] spawn life_fnc_MP;
					_unit playMoveNow "AinjPpneMstpSnonWrflDnon";
					//_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
					//_unit switchMove "AinjPpneMstpSnonWrflDnon";
				};	
			};
			sleep 0.5;
		};
	};