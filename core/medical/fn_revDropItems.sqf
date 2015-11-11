/*
	RIMUOVE L?OGGETTO SELEZIONATO DALL'INVENTARIO DEL PLAYER E LO PIAZZA A TERRA
*/

private["_index","_object","_type","_wh","_dropped","_finish"];
_object = _this select 0;
_type = _this select 1;

_wh = nearestObjects [player,["GroundWeaponHolder"],3];
if (count _wh == 0) then
{		
	_pos = getPosATL player;
	_pos set [0,(_pos select 0) + 0.5];
	_wh  =   createVehicle ["GroundWeaponHolder", _pos,[], 0, "NONE"]; 
	_wh setPosATL _pos;
}else{
	_wh = _wh select 0;
};

if (_type == "uitem") then
{
	if (uniform player != "")then
	{
		player removeItemFromUniform (_object);
		_wh addItemCargoGlobal [_object,1];
	};
};
if (_type == "vitem") then
{
	if (vest player != "")then
	{
		player removeitemfromvest (_object);
		_wh addItemCargoGlobal [_object,1];
	};
};
if (_type == "bitem") then
{
	if (backpack player != "")then
	{
		player removeitemfrombackpack (_object);
		_wh addItemCargoGlobal [_object,1];
	};
};
if (_type == "pweap") then
{
	_wh addWeaponCargoGlobal[primaryWeapon player,1];
	{
		_wh addItemCargoGlobal [_x,1];
	} forEach (primaryWeaponItems player);
	_wh addMagazineCargoGlobal [(primaryWeaponMagazine player) select 0,1] ;
	player removeWeapon primaryWeapon player;
	//player action ["DropWeapon", _wh, primaryWeapon player];
};
if (_type == "sweap") then
{
	_wh addWeaponCargoGlobal[secondaryWeapon player,1];
	{
		_wh addItemCargoGlobal [_x,1];
	} forEach (secondaryWeaponItems player);
	_wh addMagazineCargoGlobal [(secondaryWeaponMagazine player) select 0,1] ;
	player removeWeapon secondaryWeapon player;
	//player action ["DropWeapon", _wh, secondaryWeapon player];
};
if (_type == "hweap") then
{
	_wh addWeaponCargoGlobal[handgunWeapon player,1];
	{
		_wh addItemCargoGlobal [_x,1];
	} forEach (handGunItems player);
	_wh addMagazineCargoGlobal [(handgunMagazine player) select 0,1] ;
	player removeWeapon handgunWeapon player;
	//player action ["DropWeapon", _wh, handgunWeapon player];
};
if (_type == "uni") then
{
	if (uniform player != "")then
	{
		_wh addItemCargoGlobal [_object,1];
		_dropped = (((everyContainer _wh) select 0) select 1);
		{
			_dropped addItemCargoGlobal [_x, 1];
		}forEach (uniformItems player);
		removeUniform player;
	};
};
if (_type == "ves") then
{
	if (vest player != "")then
	{
		_wh addItemCargoGlobal [_object,1];
		_dropped = (((everyContainer _wh) select 0) select 1);
		{
			_dropped addItemCargoGlobal [_x, 1];
		}forEach (vestItems player);
		removeVest player ;
	};
};
if (_type == "bac") then
{
	if (backpack player != "")then
	{
		player action ["DropBag", _wh,typeOf unitbackpack player];
	};
};
if (_type == "head") then
{
	if (headgear player != "") then
	{
		removeHeadgear player ;
		_wh addItemCargoGlobal [_object,1];
	};
};
if (_type == "gog") then
{
	if (goggles player != "") then
	{
		removeGoggles player ;
		_wh addItemCargoGlobal [_object,1];
	};
};
if (_type == "umag") then
{	
	if (uniform player != "") then
	{
		player removeMagazine _object ;
		_wh addMagazineCargoGlobal [_object,1];
	};
};
if (_type == "vmag") then
{
	if (vest player != "") then
	{
		player removeMagazine _object ;
		_wh addMagazineCargoGlobal [_object,1];
	};
};
if (_type == "bmag") then
{
	if (backpack player != "") then
	{
		player removeMagazine _object ;
		_wh addMagazineCargoGlobal [_object,1];	
	};
};

