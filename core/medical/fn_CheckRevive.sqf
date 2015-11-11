
////////////////////////////////////////////////
// Revive Action Check
////////////////////////////////////////////////

	private ["_target", "_isTargetUnconscious", "_isDragged","_onlineMed"];

	_return = false;
	_target = _this select 0;
	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf player >> "attendant");
	_onlineMed = independent countSide playableUnits;


	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable "FAR_isDragged";

	// Make sure target is unconscious and player is a medic
	if (playerSide == independent) then   //SE SONO INDIPENDENTE ALLORA SONO MEDICO
	{
		if (_isTargetUnconscious == 1 && _isDragged == 0 && (_isMedic == 1 || FAR_ReviveMode > 0) ) then
		{
			_return = true;

			// [ReviveMode] Check if player has a Medikit
			if ( FAR_ReviveMode == 2 && !("Medikit" in (items player)) ) then
			{
				_return = false;
			};
		};
	}else{
		//if (_onlineMed == 0) then
		//{
			if (isPlayer _target) then
			{
				if (_target getVariable "FAR_isUnconscious" == 1) then
				{
					private ["_hs"];
					_hs = objNull;
					//_hs = nearestObjects[getPosATL _target,["Land_Hospital_side2_F"],20];
					_apos = getMarkerPos "hospital1";
					_bpos = getMarkerPos "hospital2";
					_cpos = getMarkerPos "hospital3";
					
					_pos2=getPosATL _target;
					
					_ahs=_apos vectorDistance _pos2;
					_bhs=_bpos vectorDistance _pos2;
					_chs=_cpos vectorDistance _pos2;
					
					if ((_ahs < 20)or(_bhs < 20)or(_chs < 20)) then
					{
						if (!FAR_isDragging) then
						{
							_return = true ;
						};
					};
				};
			};
		//}else{
		//	_return = false ;
		//};
	};
	_return









