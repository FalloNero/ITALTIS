/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_altezza","_pos","_lax","_lay"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_cell = [_this,2,[],[[]]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];


titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";

[] spawn {
_pos = getMarkerPos "jail_marker";
_lax = _pos select 0;
_lay = _pos select 1;
_altezza = 4;

player allowdamage false;
player setPos [_lax, _lay, _altezza];
sleep 1;
player allowdamage true;
};

Jail_OldUniform = Uniform player;
//player addUniform "A3L_Prisoner_Outfit";    //fixare

if(_bad) then
{
	waitUntil {alive player};
	waitUntil {life_session_completed};
	sleep 1;
	player setPosATL life_lsposition;
	
}else{
	//player setPos (fed_jail modeltoWorld _cell);
	//if(player distance (fed_jail modeltoWorld _cell) > 40) then
	//{
	//	player setPos (fed_jail modeltoWorld _cell);
	//};
	
	if(player distance (getMarkerPos "jail_marker") > 60) then
{
[] spawn {
	_pos = getMarkerPos "jail_marker";
	_lax = _pos select 0;
	_lay = _pos select 1;
	_altezza = 4;

	player allowdamage false;
	player setPos [_lax, _lay, _altezza];
	sleep 1;
	player allowdamage true;
	};
};


};



if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};	
if(life_inv_lsdu > 0) then {[false,"lsdu",license_civ_lsdu] call life_fnc_handleInv;};
if(life_inv_lsdp > 0) then {[false,"lsdp",license_civ_lsdp] call life_fnc_handleInv;};
if(life_inv_cracku > 0) then {[false,"cracku",life_inv_cracku] call life_fnc_handleInv;};	
if(life_inv_crackp > 0) then {[false,"crackp",life_inv_crackp] call life_fnc_handleInv;};	
if(life_inv_mdmau > 0) then {[false,"mdmau",life_inv_mdmau] call life_fnc_handleInv;};	
if(life_inv_mdmap > 0) then {[false,"mdmap",life_inv_mdmap] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};	
if(life_inv_semtex > 0) then {[false,"semtex",life_inv_semtex] call life_fnc_handleInv;};	
if(life_inv_sigari > 0) then {[false,"sigari",life_inv_sigari] call life_fnc_handleInv;};	
if(life_inv_Napalm > 0) then {[false,"Napalm",life_inv_Napalm] call life_fnc_handleInv;};	
if(life_inv_Oppio > 0) then {[false,"Oppio",life_inv_Oppio] call life_fnc_handleInv;};	
if(life_inv_Peyote > 0) then {[false,"Peyote",life_inv_Peyote] call life_fnc_handleInv;};	
if(life_inv_lsd > 0) then {[false,"lsd",life_inv_lsd] call life_fnc_handleInv;};	
if(life_inv_Proiettili > 0) then {[false,"Proiettili",life_inv_Proiettili] call life_fnc_handleInv;};	


life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[5] call SOCK_fnc_updatePartial;
//CANCELLA POSIZIONE SE FINISCO IN GALERA
private ["_position"];
_position = [1,1,1];
[8,_position] call SOCK_fnc_updatePartial;