/*

*/
private["_position","_barrier"];
_barrier = "RoadBarrier_F" createVehicle [0,0,0];
_barrier attachTo[player,[0,5.5,0]];
_barrier setDir 90;
_barrier setVariable["item","barrierDeployed",true];

life_action_barrierDeploy = player addAction["Posiziona barriera",{if(!isNull life_barrierRoad) then {detach life_barrierRoad; life_barrierRoad = ObjNull;}; player removeAction life_action_barrierDeploy; life_action_barrierDeploy = nil;},"",999,false,false,"",'!isNull life_barrierRoad'];
life_barrierRoad = _barrier;
waitUntil {isNull life_barrierRoad};
if(!isNil "life_action_barrierDeploy") then {player removeAction life_action_barrierDeploy;};
if(isNull _barrier) exitWith {life_barrierRoad = ObjNull;};
_barrier setPos [(getPos _barrier select 0),(getPos _barrier select 1),0];
_barrier setDamage 1;
life_action_barrierPickup = player addAction["Rimuovi barriera",life_fnc_packupBarrier,"",0,false,false,"",
' _barriers = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_barriers" && !isNil {(_barriers getVariable "item")}'];
//[[_barrier],"TON_fnc_barrierRoad",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.