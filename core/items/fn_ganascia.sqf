/*
	Ganascie per poliziotti - bloccano veicoli di terra
	Richiedono il lockpick per essere rimosse
*/

private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; 
_isVehicle = if((_curTarget isKindOf "LandVehicle") ) then {true} else {false};
if !(_isVehicle) exitWith {hint "Non puoi applicare le ganascie su questo veicolo"};
if(_curTarget getVariable ["ganascia",0] == 1) exitWith {hint "Questo veicolo è già bloccato"};


_title = format["Bloccando %1",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
life_action_inUse = true; 



disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.10;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; 
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText["Ti sei allontanato troppo.","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Azione cancellata","PLAIN"]; life_action_inUse = false;};
if(!([false,"ganascia",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;
_curTarget setVariable["ganascia",1,true];  
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _curTarget);
_obj setDir getDir _curTarget;  
_obj setPosATL (getPosATL _curTarget);  
_curTarget attachTo [_obj]; 
//EFFETTO GANASCIA
[_curTarget] spawn life_fnc_objGanascia ;
//
titleText["Il veicolo è stato bloccato.","PLAIN"];