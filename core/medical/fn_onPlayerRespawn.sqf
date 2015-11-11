#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse","_handle","_position","_altitude"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;
FAR_deadGear = [life_corpse] call life_fnc_fetchDeadGear;
disableSerialization;
_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player setCaptive false;

[] spawn life_fnc_setupActions;
//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.
detach _unit;
_unit switchMove "";

//Load our gear as a cop incase something horrible happens
if((playerSide == west) or (playerSide == east)) then {
	[FAR_deadGear] spawn life_fnc_loadDeadGear;
	_unit setVariable["coplevel",__GETC__(life_coplevel),true];
};

if(life_is_arrested) then
{
	hint "Hai provato a suicidarti in prigione , la pena da scontare verrà aumentata!";
	life_is_arrested = false;
	[_unit,true] spawn life_fnc_jail;
}
	else
{
	_position = [0,0,0];
	life_lsposition = [0,0,0];
	//SE MUOIO SALVA INVENTARIO PRIMA DI RICARICARLO
	//DOVREBBE RISOLVERE IL PROBLEMA DEGLI INFAMI CHE SI DISCONNETTONO DA MORTI
	if ((playerSide != west) or (playerSide != east)) then
	{
		[_position] call SOCK_fnc_updateRequest;
	}else{
		[8,_position] call SOCK_fnc_updatePartial;
		[0] call SOCK_fnc_updatePartial;
	};
	if (FAR_killed) then
	{
		[_unit] spawn life_fnc_setUnconscious ;
		if !((playerSide == west) or (playerSide == east)) then
		{
			[FAR_deadGear] spawn life_fnc_loadDeadGear;
		};
		_unit setPosATL (getPosATL life_corpse);
		[] spawn life_fnc_updateTexture;
		_unit setVariable ["FAR_isUnconscious", 1, true];


		createDialog "DeathScreen";
		(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu
		//Create a thread for something?
		_unit spawn
		{
			private["_maxTime","_RespawnBtn","_Timer"];
			disableSerialization;
			_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
			_Timer = ((findDisplay 7300) displayCtrl 7301);
			_numMed = Resistance countSide playableUnits;
			if (_numMed <= 0) then
			{
				if (life_respawn_timer == 2) then
				{
					_maxTime = time + 60;
				}else{
					_maxTime = time + (life_respawn_timer * 60);
				};
			}
			else
			{
				_maxTime = time + (life_respawn_timer * 60);
			};
			_RespawnBtn ctrlEnable false;
			waitUntil {_Timer ctrlSetText format["Respawn Available in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
			round(_maxTime - time) <= 0 || isNull _this || Life_request_timer};
			if (life_request_timer) then {
				_maxTime = time + (life_respawn_timer * 150);
				waitUntil {_Timer ctrlSetText format["Respawn Available in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
				round(_maxTime - time) <= 0 || isNull _this};
			};
			Life_request_timer = false; //resets increased respawn timer
			life_respawn_timer = 2;
			_RespawnBtn ctrlEnable true;
			_Timer ctrlSetText "Puoi respawnare";			

		};
		[] spawn life_fnc_deathScreen;
	}else{
		hideBody _corpse;
		titleText["","BLACK FADED"];
		titleFadeOut 9999999999;
		[] call life_fnc_spawnMenu;
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};


//_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
//player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_hudUpdate;
cutText ["","BLACK IN"];