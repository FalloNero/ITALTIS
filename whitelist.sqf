
/*
	File: WhitelistCheck.sqf

	Description:
	Controlla la whitelist per evitare le merde
	
	Author: CRY
*/



//CONTROLLA SE HAI LA MAMMA PUTTANA

private ["_list"];
_list = _this select 0;

if!(isDedicated) then {
if(getplayeruid player in _list) then {
		
		hint "Benvenuto!!";	
	}else{
	
["NotWhitelisted",false,true] call BIS_fnc_endMission;

	};
};