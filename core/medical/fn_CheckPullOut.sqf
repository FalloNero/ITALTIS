	
////////////////////////////////////////////////
// Controlla veicoli e abilita l'opzione di menu preleva feriti se vi sono feriti nell'auto
////////////////////////////////////////////////

	private["_unit","_crew","_feriti","_rev","_type"];
	_unit = _this select 0;
	_return = true ;
	if(isNull _unit)  then
	{
		_return = false;
	}else{
		if (locked _unit == 2) then
		{
			_return = false;
		}else{
			if !(_unit isKindOf "Car") then
			{
				if !(_unit isKindOf "Air") then
				{
					if !(_unit isKindOf "Ship") then
					{
						_return = false;
					}else{
						_return = true;
					};
				}else{
					_return = true;
				};
			}else{
				_return = true;
			};
		};
	};

	if (_return) then
	{
		_crew = crew _unit;
		_feriti = 0;
		{
		_rev = (_x getVariable "FAR_isUnconscious");
			if (_rev == 1) then{
				_feriti = _feriti + 1;
			};
		}foreach _crew;
		if (_feriti == 0) then
		{
			_return = false ;
		};
	};
	_return