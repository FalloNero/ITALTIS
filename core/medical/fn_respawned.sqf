#include <macro.h>
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private ["_handle","_position"];
//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0; //Make sure we don't get our cash back.
life_respawned = false;
Life_request_timer = false;
FAR_killed = false ;
LIFE_HEAD_SHOOTED = false;
FAR_deadGear = [];

//PULISCE HINT BLEEDING
hintSilent "";
moveOut player ;
player setPos [29.2097,10214.6,0];
detach player;
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
////////////////////////////////////////////////////////
//DROGHE
player setVariable["drug_lsd",false,true];
player setVariable["drug_weed",false,true];
player setVariable["drug_cocaine",false,true];
life_drugged_cocaine = -1;
life_drugged_weed = -1;
//FATICA
player enablefatigue false;
///////////////////////////////////////////
//	FAROOQ REVIVE
player setVariable ["FAR_isUnconscious", 0, true]; //FAROOQ REVIVE
player setVariable ["FAR_isDragged", 0, true]; //FAROOQ REVIVE
player setVariable ["ace_sys_wounds_uncon", false];//FAROOQ REVIVE
player setVariable ["FAR_isStabilized", 0, true];//FAROOQ REVIVE
player enableSimulation true;
player allowDamage true;
player setDamage 0;
player setCaptive false;
player playMove "amovppnemstpsraswrfldnon";
player playMove "";
///////////////////////////////////////////////////////////////
//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
		//_handle = [] spawn life_fnc_loadGear;
		player setVariable["coplevel",__GETC__(life_coplevel),true];
	};
	
	case east: {
		_handle = [] spawn life_fnc_copLoadout;
		//_handle = [] spawn life_fnc_loadGear;
		player setVariable["coplevel",__GETC__(life_coplevel),true];
	};
	
	case civilian: {
		//[] call life_fnc_civFetchGear;
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		//[] call life_fnc_medicLoadout;
		_handle = [] spawn life_fnc_medicLoadout;
		player setVariable["mediclevel",__GETC__(life_mediclevel),true];
	};
	waitUntil {scriptDone _handle};
	
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	//private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	//_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	//{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hidebody life_corpse;
};

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	_position = [0,0,0];
	life_lsposition = [0,0,0];
	[_position] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[player,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};
//RIMUOVE LE LICENZE
[0] call life_fnc_removeLicenses;			
//SE SONO SPAWNATO CANCELLO LA POSIZIONE
_position = [0,0,0];
life_lsposition = [0,0,0];
[_position] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.