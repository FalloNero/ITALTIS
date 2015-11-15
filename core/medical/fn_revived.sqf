/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir","_unit"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_unit = [_this,1,player,[player]] call BIS_fnc_param;
//_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
//[_oldGear] spawn life_fnc_loadDeadGear;
// [[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
//_dir = getDir life_corpse;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.

if (side _unit == independent) then
{
	hint format["%1 ti ha rianimato ed una tassa di €%2 è stata prelevata dal tuo conto bancario.",_medic,[(call life_revive_fee)] call life_fnc_numberText];
	closeDialog 0;
	//life_deathCamera cameraEffect ["TERMINATE","BACK"];
	//camDestroy life_deathCamera;

	//Take fee for services.
	if(life_atmcash > (call life_revive_fee)) then {
		life_atmcash = life_atmcash - (call life_revive_fee);
	} else {
		life_atmcash = 0;
	};
}else{
	hint format["Sei stato rianimato all'ospedale la somma di €%2 è stata prelevata dal tuo conto bancario.",_medic,[(call life_revive_fee)] call life_fnc_numberText];
	closeDialog 0;
	//life_deathCamera cameraEffect ["TERMINATE","BACK"];
	//camDestroy life_deathCamera;

	//Take fee for services.
	if(life_atmcash > (call life_revive_fee)) then {
		life_atmcash = life_atmcash - (call life_revive_fee);
	} else {
		life_atmcash = 0;
	};
};
//Bring me back to life.
//player setDir _dir;
//player setPosASL (visiblePositionASL life_corpse);
//life_corpse setVariable["Revive",nil,TRUE];
//life_corpse setVariable["name",nil,TRUE];
// [[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
//hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
//player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
player setVariable ["FAR_isUnconscious", 0, true];
player setVariable ["FAR_isDragged", 0, true];
player setVariable ["FAR_isStabilized", 0, true];
// Player got revived
sleep 6;
// Clear the "medic nearby" hint
hintSilent "";
// Unmute ACRE
player setVariable ["ace_sys_wounds_uncon", false];
player enableSimulation true;
player allowDamage true;
player setDamage 0.15;
player setCaptive false;
player playMove "amovppnemstpsraswrfldnon";

Life_request_timer = false;
FAR_killed = false ;
FAR_deadGear = [];
[] call life_fnc_hudUpdate; //Request update of hud.
[] call SOCK_fnc_updateRequest;