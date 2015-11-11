/*
	File: fn_updateLoad.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	A simple handler for updating the gear load displays.
*/

_display = findDisplay 8700;

_uniformContainer = _display displayCtrl 8701;
_vestContainer = _display displayCtrl 8702;
_backpackContainer = _display displayCtrl 8703;
_uniformPicSlot = _display displayCtrl 8704;
_vestPicSlot = _display displayCtrl 8705;
_backpackPicSlot = _display displayCtrl 8706;
_uniformLoadBar = _display displayCtrl 8707;
_vestLoadBar = _display displayCtrl 8708;
_backpackLoadBar = _display displayCtrl 8709;

private["_cfgInfo"];
{
	_container = _x select 0;
	if(_container != "") then
	{
		_load = _x select 1;
		_cfgInfo = [_container] call life_fnc_fetchCfgDetails;
		if(count _cfgInfo > 0) then
		{
			if(_container == backpack player) then 
			{
				_maxLoad = getNumber(configFile >> "CfgVehicles" >> _container >> "maximumload");
				if(_maxLoad == 0) then {_load = 1;};
			};
			
			(_x select 2) ctrlShow true;
			(_x select 3) ctrlShow true;
			(_x select 4) ctrlShow true;
			(_x select 3) ctrlSetText (_cfgInfo select 2);
			(_x select 3) ctrlSetToolTip format["%1 | %2%3 Full",_cfgInfo select 1,round(_load * 100),"%"];
			(_x select 4) progressSetPosition _load;
		}
			else
		{
			(_x select 2) ctrlShow false;
			(_x select 3) ctrlShow false;
			(_x select 4) ctrlShow false;
		};
	}
		else
	{
		(_x select 2) ctrlShow false;
		(_x select 3) ctrlShow false;
		(_x select 4) ctrlShow false;
	};
} foreach [
	[uniform player, loadUniform player, _uniformContainer, _uniformPicSlot, _uniformLoadBar],
    [vest player, loadVest player, _vestContainer, _vestPicSlot, _vestLoadBar],
    [backPack player, loadBackpack player, _backpackContainer, _backpackPicSlot, _backpackLoadBar]
];
