/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
private["_newPos","_rem"] ;  //CUSTOM SPAWN
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if !(_mode) then {_basePrice = round(_basePrice / 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_cash] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";


private ["_possp"];

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{
			_possp = getMarkerPos _x;
			if(count(nearestObjects[(_possp),["Car","Ship","Air","Motorcycle"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
			_possp = getMarkerPos _spawnpoints ;
		if(count(nearestObjects[(_possp),["Car","Ship","Air","Motorcycle"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};
if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
/*
if(_spawnPoint == "")then
{
	hint "Un veicolo sta bloccando il punto di spawn, rimozione tra 10 secondi";
	_rem = nearestObjects[(_possp),["Car","Ship","Air"],5];
	sleep 10;
	[[_rem,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	hint "Rimosso";
};
*/
life_cash = life_cash - _basePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//CAMBIA ALTEZZA SPAWN DEI PUNTI INDICATI

_newPos = getMarkerPos _spawnPoint ;
_mPos = markerDir _spawnPoint;

switch (life_veh_shop select 0) do {

//Spawn the vehicle and prep it.

case "med_air_hs" :{ 

if (_mPos == -92) then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,13]);
	_vehicle lock 2;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};
};

case "cop_air": {
 if(_mPos == 98) then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	hint "ALZANDO L'ALZABILE";
	_vehicle setPosATL [_newPos select 0, _newPos select 1, (_newPos select 2) + 14];
	_vehicle lock 2;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
}else{

if(_mPos == 99) then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	hint "spawning eli";
	_vehicle setPosATL [_newPos select 0, _newPos select 1, (_newPos select 2) + 4];
	_vehicle lock 2;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
}else{
_vehicle = createVehicle [_className, _newPos, [], 0, "CAN_COLLIDE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	//_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	_vehicle allowDamage true; //Re-enable damage handling.
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"vehicle_disabled",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"ganascia",0,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};
};
};

case "cop_car": {
 if(_mPos == 65) then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	hint "Spawning veicolo";
	_vehicle setPosATL [_newPos select 0, _newPos select 1, (_newPos select 2) + 2];
	_vehicle lock 2;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
}else{
_vehicle = createVehicle [_className, _newPos, [], 0, "CAN_COLLIDE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	//_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	_vehicle allowDamage true; //Re-enable damage handling.
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"vehicle_disabled",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"ganascia",0,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};
};


default {
	_vehicle = createVehicle [_className, _newPos, [], 0, "CAN_COLLIDE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	//_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	_vehicle allowDamage true; //Re-enable damage handling.
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"vehicle_disabled",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"ganascia",0,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};
};

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_className == "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case east: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_className == "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		_vehicle addItemCargo ["Medikit", 2];
		_vehicle addBackpackCargo ["B_FieldPack_blk", 2];
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
};
//_vehicle addEventHandler["Dammaged", {_this spawn life_fnc_vehicleDamage;}];
//_vehicle addEventHandler["GetIn", {_this spawn life_fnc_vehicleEnter;}];
[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;