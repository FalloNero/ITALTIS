/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;

if(_shop == "mecstore") then {
		if(!license_civ_meccanico) then {
			hint "NON SEI UN MECCANICO";	
		}else{
			createDialog "shops_menu";
			[] call life_fnc_virt_update;
		};
		
}else{
if(_shop == "cop") then {
		if!((playerSide == west) or (playerSide == east)) then {
			hint localize "STR_NOTF_NotACop";	
		}else{
			createDialog "shops_menu";
			[] call life_fnc_virt_update;
		};
		
}else{

createDialog "shops_menu";
[] call life_fnc_virt_update;
};
};