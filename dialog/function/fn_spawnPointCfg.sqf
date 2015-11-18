/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_markers","_mkName","_mk"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_markers = [
			["cop_spawn_1","Kavala HQ","\a3\data\env_chrome_co.paa"],
			["cop_spawn_3","Athira HQ","\a3\data\env_chrome_co.paa"],
			["cop_spawn_fs","Forze Speciali QG","\a3\data\env_chrome_co.paa"]
		];
	};
	
	case east:
	{
		_markers = [
			["cop_spawn_3","Tijuana HQ","\a3\data\env_chrome_co.paa"]
			//["cop_spawn_5","Tijuana AIR","\a3\data\env_chrome_co.paa"]
		];
	};

	case civilian:
	{
		
		
		if(license_civ_meccanico) then  {
		    _markers = [
			    ["spawn_meccanico2","Meccanici Kavala","\a3\data\env_chrome_co.paa"],
				["spawn_meccanico1","Meccanici Athira","\a3\data\env_chrome_co.paa"]
			];
		}else{
			_markers = [
				["civ_spawn_1","Kavala","\a3\data\env_chrome_co.paa"],
				["civ_spawn_2","Athira","\a3\data\env_chrome_co.paa"],
				["civ_spawn_3","Dorida","\a3\data\env_chrome_co.paa"]
			
		];
		
		};
		
		
		if(license_civ_mafia) then  {
		    _markers = [
			    ["mafia_Spawn","Mafia HQ","\a3\data\env_chrome_co.paa"],
				["civ_spawn_1","Kavala","\a3\data\env_chrome_co.paa"],
				["civ_spawn_2","Athira","\a3\data\env_chrome_co.paa"],
				["civ_spawn_3","Dorida","\a3\data\env_chrome_co.paa"]
			];
		};
		
		if(license_civ_bb) then  {
		    _markers = [
			    ["bb_spawn","BB HQ","\a3\data\env_chrome_co.paa"],
				["civ_spawn_1","Kavala","\a3\data\env_chrome_co.paa"],
				["civ_spawn_2","Athira","\a3\data\env_chrome_co.paa"],
				["civ_spawn_3","Dorida","\a3\data\env_chrome_co.paa"]
			];
		};
		
		if(license_civ_spartan) then  {
		    _markers = [
			    ["Spartan_Spawn","Spartan HQ","\a3\data\env_chrome_co.paa"],
				["civ_spawn_1","Kavala","\a3\data\env_chrome_co.paa"],
				["civ_spawn_2","Athira","\a3\data\env_chrome_co.paa"],
				["civ_spawn_3","Dorida","\a3\data\env_chrome_co.paa"]
			];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_markers pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	

	};

	case independent: {
		_markers = [
			["medic_spawn_1","Ospedale Kavala","\a3\data\env_chrome_co.paa"],
			["medic_spawn_2","Ospedale Athira","\a3\data\env_chrome_co.paa"],
			["medic_spawn_3","Ospedale Dorida","\a3\data\env_chrome_co.paa"]
		];
		};

};

if (!((life_lsposition select 0) == 0))then
{
	_mk = createMarkerLocal ["Ultima_Posizione", life_lsposition];
	_mk setMarkerAlphaLocal 0;
	_markers pushBack ["Ultima_Posizione","Ultima Posizione","\a3\data\env_chrome_co.paa"];
};
_markers;