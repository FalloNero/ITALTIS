/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the client.
*/
private["_cop","_player","_restrain"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};

		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith {
			player setVariable["restrained",FALSE,TRUE];
			player setVariable["Escorting",FALSE,TRUE];            
			player setVariable["transporting",false,true];
            detach player;
            titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
			(findDisplay 46) displayRemoveEventHandler ['KeyDown',BLOCK_EXTERNAL];
		};
	};
};
if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };
waitUntil {animationState player != "ainjppnemstpsnonwrfldnon"};

titleText[format[localize "STR_Cop_Retrained",_cop getVariable["realname",name _cop]],"PLAIN"];
player say3D "restrain";

BLOCK_EXTERNAL = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 156) then {true};"];

while {player getVariable "restrained"} do
{
	if (vehicle player == player) then
	{	
		if (cameraView == "External") then
		{
			player switchCamera "Internal";
		};
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};

	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
 		player setVariable ["transporting",false,true];
 		detach _player;
		(findDisplay 46) displayRemoveEventHandler ['KeyDown',BLOCK_EXTERNAL];
	};

	if(!alive _cop) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;
  	};

	if(vehicle player != player) then
	{
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

if(alive player) then
{
	player say3D "restrain";
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
 	player setVariable ["transporting",false,true];
 	detach _player;
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',BLOCK_EXTERNAL];
};
