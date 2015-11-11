#include <macro.h>
/*
	APRE FINESTRA PER IL LOOT DEL FERITO
*/
if (!alive player )exitWith {};
if (dialog) then {closedialog 0;};
_unit = _this select 0;
FAR_itemList = [];
_unit setVariable ["looted",steamid,true];
createDialog "injLoot";
disableSerialization;
waitUntil {!isNull (findDisplay 9822)};
[_unit] spawn life_fnc_revRmvItemsFilter;
player playMoveNow "AmovPknlmstpsrasWpstdnon_gear";

[_unit,steamid] spawn {
    waitUntil {(isNull (findDisplay 9822))OR((_this select 0) getVariable "looted" != (_this select 1))};
    closeDialog 0;
    (_this select 0) setVariable["looted",0,true];
}; 
