/*
	CARICA OGGETTI FERITI NELLA LISTA
*/
private["_display","_list","_objects"];
disableSerialization;
_unit = _this select 0;
FAR_loot = _unit; 
if(isNull _unit) exitWith {closeDialog 0;};
if(!isNull (findDisplay 9822)) then {
    _display = findDisplay 9822;
    _itemList = _display displayCtrl 2902;
    lbClear _itemList;
	//_itemList = _list;
    FAR_itemlist = [];

	
private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles","_itemInfo","_itemList"];
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon _unit;
if (_primary != "") then
{
	_itemInfo = [_primary] call life_fnc_fetchCfgDetails;
	_itemList lbAdd format["%1",_itemInfo select 1];
	_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
	_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
	//_list lbAdd format ["%1",_primary];
	FAR_itemlist pushBack [_primary,"pweap"];
};


_launcher = secondaryWeapon _unit;
if (_launcher != "") then
{
			_itemInfo = [_launcher] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
//_list lbAdd format ["%1",_launcher];
FAR_itemlist pushBack [_launcher,"sweap"];
};


_handgun = handGunWeapon _unit;
if (_handgun != "") then
{
			_itemInfo = [_handgun] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
//_list lbAdd format ["%1",_handgun];
FAR_itemlist pushBack [_handgun,"hweap"];
};


_magazines = [];
_uniform = uniform _unit;
if (_uniform != "") then
{
			_itemInfo = [_uniform] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
//_list lbAdd format ["%1",_uniform];
FAR_itemlist pushBack [_uniform,"uni"];
};


_vest = vest _unit;
if (_vest != "") then
{
			_itemInfo = [_vest] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
//_list lbAdd format ["%1",_vest];
FAR_itemlist pushBack [_vest,"ves"];
};


_backpack = backpack _unit;
if (_backpack != "") then
{
			_itemInfo = [_backpack] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];

			FAR_itemlist pushBack [_backpack,"bac"];
};


_headgear = headgear _unit;
if (_headgear != "") then
{
			_itemInfo = [_headgear] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
//_list lbAdd format ["%1",_headgear];
FAR_itemlist pushBack [_headgear,"head"];
};


_goggles = goggles _unit;
if (_goggles != "") then
{
			_itemInfo = [_goggles] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
//_list lbAdd format ["%1",_goggles];
FAR_itemlist pushBack [_goggles,"gog"];
};
/*
_items = assignedItems _unit;
{
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
	//_list lbAdd format ["%1",_x];
	FAR_itemlist set [count FAR_itemlist,[_x,"aitem"]];
} foreach assignedItems _unit;

if(primaryWeapon _unit != "") then {
	_primitems = primaryWeaponItems _unit;
	{
		if (_x != "") then {
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			FAR_itemlist set [count FAR_itemlist,[_x,"pitem"]];
		};	
	} foreach primaryWeaponItems _unit;
};

if(handgunWeapon _unit != "") then {
	_handgunItems = handgunItems _unit;
	{
		if (_x != "") then {
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			FAR_itemlist set [count FAR_itemlist,[_x,"hitem"]];
		};
	} foreach handgunItems _unit;
};
*/
if(_uniform != "") then 
{
	{
		if (_x != "") then {
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			//_list lbAdd format ["%1",_x];
			if (isClass (configFile >> "CfgMagazines" >> _x)) then
			{
				FAR_itemlist pushBack [_x,"umag"];
			}else{
				FAR_itemlist pushBack [_x,"uitem"];
			};
		};
	} foreach (uniformItems _unit);
};
if(_vest != "") then 
{
	{
		if (_x != "") then {
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			//_list lbAdd format ["%1",_x];
			if (isClass (configFile >> "CfgMagazines" >> _x)) then
			{
				FAR_itemlist pushBack [_x,"vmag"];
			}else{
				FAR_itemlist pushBack [_x,"vitem"];
			};
		};
	} foreach (vestItems _unit);
};
if(_backpack != "") then 
{
	{
		if (_x != "") then {
			_itemInfo = [_x] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
	
			if (isClass (configFile >> "CfgMagazines" >> _x)) then
			{
				FAR_itemlist pushBack [_x,"bmag"];
			}else{
				FAR_itemlist pushBack [_x,"bitem"];
			};
		};
	} foreach (backPackItems _unit);
};
/*	
if(primaryWeapon _unit != "") then
{
	_unit selectWeapon (primaryWeapon _unit);
	if(currentMagazine _unit != "") then
	{
			_itemInfo = [currentMagazine _unit] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
		//_list lbAdd format ["%1",currentMagazine _unit];
		FAR_itemlist set [count FAR_itemlist,[currentMagazine _unit,"pmag"]];
	};
};
		
if(secondaryWeapon _unit != "") then
{
	_unit selectWeapon (secondaryWeapon _unit);
	if(currentMagazine _unit != "") then
	{
			_itemInfo = [currentMagazine _unit] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
		//_list lbAdd format ["%1",currentMagazine _unit];
		FAR_itemlist set [count FAR_itemlist,[currentMagazine _unit,"smag"]];
	};
};
		
if(handgunWeapon _unit != "") then
{
	_unit selectWeapon (handgunWeapon _unit);
	if(currentMagazine _unit != "") then
	{
			_itemInfo = [currentMagazine _unit] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",_itemInfo select 1];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
		//_list lbAdd format ["%1",currentMagazine _unit];
		FAR_itemlist set [count FAR_itemlist,[currentMagazine _unit,"hmag"]];
	};
};
*/

lbSetCurSel [_itemList,0];

};
