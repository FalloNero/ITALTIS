/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
if(playerSide == west || playerSide == civilian && {(call life_save_civ)}) then {
    _return pushBack primaryWeapon player;
    _return pushBack handgunWeapon player;
} else {
    _return pushBack [];
    _return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
    ["life_inv_apple", life_inv_apple],
    ["life_inv_rabbit", life_inv_rabbit],
    ["life_inv_salema", life_inv_salema],
    ["life_inv_ornate", life_inv_ornate],
    ["life_inv_mackerel", life_inv_mackerel],
    ["life_inv_tuna", life_inv_tuna],
    ["life_inv_mullet", life_inv_mullet],
    ["life_inv_catshark", life_inv_catshark],
    ["life_inv_fishingpoles", life_inv_fishingpoles],
    ["life_inv_water", life_inv_water],
    ["life_inv_donuts", life_inv_donuts],
    ["life_inv_turtlesoup", life_inv_turtlesoup],
    ["life_inv_coffee", life_inv_coffee],
    ["life_inv_fuelF", life_inv_fuelF],
    ["life_inv_fuelE", life_inv_fuelE],
    ["life_inv_pickaxe", life_inv_pickaxe],
    ["life_inv_tbacon", life_inv_tbacon],
    ["life_inv_lockpick", life_inv_lockpick],
    ["life_inv_redgull", life_inv_redgull],
    ["life_inv_peach", life_inv_peach],
    ["life_inv_spikeStrip", life_inv_spikeStrip],
	["life_inv_ganascia",life_inv_ganascia],
	["life_inv_speedtrap",life_inv_speedtrap],
	["life_inv_speedtrapdetector",life_inv_speedtrapdetector],
	["life_inv_laptop",life_inv_laptop],
	["life_inv_fuelManipulator",life_inv_fuelManipulator],
	["life_inv_fuelPipe",life_inv_fuelPipe],
	["life_inv_tenaglie",life_inv_tenaglie],
	["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
	["life_inv_luppolo",life_inv_luppolo],
	["life_inv_tartaruga",life_inv_tartaruga],
	["life_inv_rame",life_inv_rame],
	["life_inv_canapa",life_inv_canapa],
	["life_inv_alluminio",life_inv_alluminio],
	["life_inv_papavero",life_inv_papavero],
	["life_inv_ferro",life_inv_ferro],
	["life_inv_petrolio",life_inv_petrolio],
	["life_inv_oro",life_inv_oro],
	["life_inv_platino",life_inv_platino],
	["life_inv_cocaina",life_inv_cocaina],
	["life_inv_uranio",life_inv_uranio],
	["life_inv_birra",life_inv_birra],
	["life_inv_ldrame",life_inv_ldrame],
	["life_inv_fdcanapa",life_inv_fdcanapa],
	["life_inv_marijuana",life_inv_marijuana],
	["life_inv_ldalluminio",life_inv_ldalluminio],
	["life_inv_morfina",life_inv_morfina],
	["life_inv_eroina",life_inv_eroina],
	["life_inv_ldferro",life_inv_ldferro],
	["life_inv_benzina",life_inv_benzina],
	["life_inv_napalm",life_inv_napalm],
	["life_inv_ldoro",life_inv_ldoro],
	["life_inv_ldplatino",life_inv_ldplatino],
	["life_inv_cocainapura",life_inv_cocainapura],
	["life_inv_uranioarricchito",life_inv_uranioarricchito],
	["life_inv_obirra",life_inv_obirra],
	["life_inv_orame",life_inv_orame],
	["life_inv_ocanapa",life_inv_ocanapa],
	["life_inv_omarijuana",life_inv_omarijuana],
	["life_inv_oalluminio",life_inv_oalluminio],
	["life_inv_omorfina",life_inv_omorfina],
	["life_inv_oeroina",life_inv_oeroina],
	["life_inv_oferro",life_inv_oferro],
	["life_inv_obenzina",life_inv_obenzina],
	["life_inv_onapalm",life_inv_onapalm],
	["life_inv_oplatino",life_inv_oplatino],
	["life_inv_ococainapura",life_inv_ococainapura],
	["life_inv_ooro",life_inv_ooro]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
if(call life_save_yinv) then {
    _return pushBack _yItems;
} else {
    _return pushBack [];
};

life_gear = _return;