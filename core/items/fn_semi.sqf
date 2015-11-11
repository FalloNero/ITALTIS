closeDialog 0;
life_action_inuse = true;
_pianta = "frs_cannabisPlantF" createVehicle position player;
_logica = "Land_HelipadEmpty_F" createVehicle position player;
_pianta setPos [getPos _logica select 0, getPos _logica select 1, (getPos _logica select 2) -2];
[false,"semierba",1] call life_fnc_handleInv;



_upp = "Piantando.....";

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;


	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;

while{true} do
{

	sleep  1;

	_cP = _cP + 0.1;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};

};
life_action_inuse = false;

5 cutText ["","PLAIN"];
player playActionNow "stop";
_pianta setPos [getPos _logica select 0, getPos _logica select 1, (getPos _logica select 2) -1.5];
sleep 300;
_pianta setPos [getPos _logica select 0, getPos _logica select 1, (getPos _logica select 2) -1];
sleep 300;
_pianta setPos [getPos _logica select 0, getPos _logica select 1, (getPos _logica select 2) -0.5];
sleep 300;
_pianta setPos [getPos _logica select 0, getPos _logica select 1, (getPos _logica select 2) +0.1];





