	private ["_unit", "_units", "_medics", "_hintMsg"];

	_units = nearestObjects [getpos player, ["Man", "Car", "Air", "Ship", "Motorcycle"], 800];
	_medics = [];
	_dist = 800;
	_hintMsg = "";

	// Find nearby friendly medics
	if (count _units > 1) then
	{
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship" || _x isKindOf "Motorcycle") then
			{
				if (alive _x && count (crew _x) > 0) then
				{
					{
						if (alive _x && isPlayer _x && _x getVariable "FAR_isUnconscious" == 0 && side _x == independent ) then
						{
							_medics = _medics + [_x];

							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			}
			else
			{
				if (alive _x && isPlayer _x && _x getVariable "FAR_isUnconscious" == 0 && side _x == independent ) then
				{
					_medics = _medics + [_x];
				};
			};

		} forEach _units;
	};

	// Sort medics by distance
	if (count _medics > 0) then
	{
		{
			if (player distance _x < _dist) then
			{
				_unit = _x;
				_dist = player distance _x;
			};

		} forEach _medics;

		if (!isNull _unit) then
		{
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);

			_hintMsg = format["Medici in prossimità\n%1 si trova a %2m di distanza.", _unitName, _distance];
		};
	}
	else
	{
		_hintMsg = "Nessun medico vicino";
	};

	_hintMsg