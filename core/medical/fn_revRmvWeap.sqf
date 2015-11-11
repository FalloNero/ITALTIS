
	private["_unit","_attach","_hmag","_pmag"];
	_attach = nil;
	_hmag = nil ;
	_pmag = nil ;
	_unit = _this select 0 ;
	_wh  = createVehicle ["GroundWeaponHolder", getPosATL _unit, [], 0, "NONE"] ;
	_hmag = handgunMagazine _unit;
	if !(isNil "_hmag") then
	{
		_wh addMagazineCargoGlobal [_hmag select 0,1];
	};
	_pmag = primaryWeaponMagazine _unit;
	if !(isNil "_pmag") then
	{
		_wh addMagazineCargoGlobal [_pmag select 0,1];
	};
	if (primaryWeapon _unit != "") then 
	{
		_wh addWeaponCargoGlobal [(primaryWeapon _unit),1];
		_attach = (primaryWeaponItems _unit);
		if !(isNil "_attach" ) then
		{
			{
				_wh addItemCargoGlobal [_x,1];
			}foreach _attach;
		};
		_unit removeWeaponGlobal ( primaryWeapon _unit);

	};
	_attach = nil;
	if (handgunWeapon _unit != "") then 
	{
		_wh addWeaponCargoGlobal [(handgunWeapon _unit),1];
		_attach = (secondaryWeaponItems _unit);
		if !(isNil "_attach" ) then
		{
			{
				_wh addItemCargoGlobal [_x,1];
			}foreach _attach;
		};
		_unit removeWeaponGlobal ( handgunWeapon _unit);

	};
	_pos = getPosATL _unit;
	_pos set [0,(_pos select 0) + 0.5];
	_wh setPosATL (_pos);
	{
		_wh addMagazineCargoGlobal [_x,1];
		_unit removeMagazineGlobal _x;
	} foreach (magazines _unit);
