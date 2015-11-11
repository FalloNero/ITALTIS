//LANCIA GRANATE FUMOGENE 

private ["_veicolo","_pos","_smoke","_smoke1","_smoke2","_smoke3","_smoke4","_smoke5"];

_veicolo = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_pos = getPosATL _veicolo ;

_smoke = "SmokeShell" createVehicle position _pos;
_smoke attachto [_veicolo,[0.2,0,0]];
_smoke1 = "SmokeShell" createVehicle position _pos;
_smoke1 attachto [_veicolo,[-0.2,0,0]];
_smoke2 = "SmokeShell" createVehicle position _pos;
_smoke2 attachto [_veicolo,[0,0.2,0]];
_smoke3 = "SmokeShell" createVehicle position _pos;
_smoke3 attachto [_veicolo,[0,-0.2,0]];
_smoke4 = "SmokeShell" createVehicle position _pos;
_smoke4 attachto [_veicolo,[0,0,0]];
_smoke5 = "SmokeShell" createVehicle position _pos;
_smoke5 attachto [_veicolo,[0,0,0]];

sleep 2;
detach _smoke;
detach _smoke1;
detach _smoke2;
detach _smoke3;
detach _smoke4;
detach _smoke5;


