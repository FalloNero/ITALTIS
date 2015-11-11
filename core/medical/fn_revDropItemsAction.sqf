/*
	RIMUOVE L?OGGETTO SELEZIONATO DALL'INVENTARIO DEL PLAYER E LO PIAZZA A TERRA
*/

private["_index","_object","_type","_dropped","_wh","_itemList","_unit","_handle"];
_unit = FAR_loot ;
disableSerialization;
if(!isNull (findDisplay 9822)) then {
    _itemList = (findDisplay 9822) displayCtrl 2902;
	_index = lbCurSel _itemList ;
	_object = FAR_itemlist select _index;
	_type = _object select 1;
	((findDisplay 9822) displayCtrl 2070)ctrlEnable false;
	_handle = [[_object select 0,_type],"life_fnc_revDropItems",_unit,FALSE] spawn life_fnc_MP;
	waitUntil {scriptDone _handle};
    if(_index == -1) exitWith {closeDialog 0;};
    FAR_itemlist set[_index,-1];
    FAR_itemlist = FAR_itemlist - [-1];
	_itemList lbDelete _index;
	lbSetCurSel [_itemList,0];
	if (lbsize _itemList > 0) then
	{
		((findDisplay 9822) displayCtrl 2070)ctrlEnable true;
	}else{
		closeDialog 0;
	};
};