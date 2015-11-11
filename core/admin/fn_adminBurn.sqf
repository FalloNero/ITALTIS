#include <macro.h>
/*
	VEDO I PIPOLS BRUCIARE
*/



if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};


private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) then {hint "Non puoi darti fuoco merda";};


//_fire = createVehicle ["test_EmptyObjectForFireBig",(getPosATL _target),[], 0, "NONE"];
//_fire attachto [_target,[0,0.5,1]];
hint format["Stai bruciando vivo %1",_target getVariable["realname",name _target]];
_target setdamage 1;
waitUntil {!(alive _target)};
//deletevehicle _fire;
sleep 2;
hint format["Hai bruciato vivo %1",_target getVariable["realname",name _target]];




