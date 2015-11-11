/*
	File: core\furniture\fn_placePlant.sqf
	Author: FRS
	
	Description:
	Creates the in-game object plant 
*/
private["_position","_class","_obj"];
_class = _this select 0;
_obj = _class createVehicle [0,0,0];
_obj attachTo[player,[0,5.5,0]];
_obj setVariable["item","furnitureDeployed",true];

if(!([false,"cannabisSeed",1] call life_fnc_handleInv)) exitWith {};

FRS_fnc_placeHere = compileFinal 
"[] spawn {
	if(!isNull life_furnObj) then {
		_plants = nearestObjects [getPos life_furnObj,[""FRS_cannabisPlant"",""FRS_cannabisPlantF""],3];
		if (count _plants <= 1) then {
			detach life_furnObj; 
			life_furnObj = ObjNull;
			player removeAction life_action_furnDeploy; 
			life_action_furnDeploy = nil;		
		}else{
			hint ""Ci sono altre piante troppo vicine"";
		}; 
	};
};";

life_action_furnDeploy = player addAction["Posiziona",{[] call FRS_fnc_placeHere},"",999,false,false,"",'!isNull life_furnObj'];
life_furnObj = _obj;
waitUntil {isNull life_furnObj};
if(!isNil "life_action_furnDeploy") then {player removeAction life_action_furnDeploy;};
if(isNull _obj) exitWith {life_furnObj = ObjNull;};
_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];

//[[_class,(getPos _obj)],"FRS_fnc_createPlant",false,false] spawn life_fnc_MP;	//Create plant on database 
[[_obj],"FRS_fnc_plantState",false,false] spawn life_fnc_MP;