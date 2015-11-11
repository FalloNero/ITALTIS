private["_veh, _newPos"];
_veh = cursorTarget;
if(isNull _veh) exitWith {}; //Exit if Null
if(_veh isKindOf "Air") exitWith {titleText["Non è una macchina.","PLAIN"];}; //Exit if no car or boat
if({alive _x} count crew _veh > 0) exitWith {titleText["C'è qualcuno nella macchina","PLAIN"];}; //Exit if crew in car
//if(damage _veh > 0.02) exitWith {titleText["Non puoi flippare un veicolo danneggiato","PLAIN"];};//Exit if car is damaged
if((_veh isKindOf "Car")OR(_veh isKindOf "Motorcycle")) then {
titleText["Allontanati dalla macchina , 4 sec al FLIP","PLAIN"]; //Announce
sleep 4;
_newPos = getPosASL _veh;
_newPos set [2, (_newPos select 2)+1];
_veh setVectorUp (surfaceNormal _newPos);
_veh setPosASL _newPos;
};
