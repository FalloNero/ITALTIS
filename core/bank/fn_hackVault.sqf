/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_bankBlocked","_save"];
//_curTarget = nearestObject [[8254,6461.4531,0],"il_vault"];
//_bank = nearestObject [[8254,6461.4531,0],"il_bank"];
_curTarget = bank_vault;
_bank = fed_bank;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; 
_distance = ((boundingBox _curTarget select 1) select 0) + 12;
if(player distance _curTarget > _distance) exitWith {}; 
_isVehicle = if(_curTarget isKindOf "il_vault") then {true} else {false};

if(!_isVehicle) exitWith {};
if(_curTarget getVariable "vault_hacked") exitWith {};
if(_bank getVariable "bank_block") exitWith {hint "Hacking Impossibile. Sistema di sicurezza bloccato"};
//se stranamente la rapina non fosse già in corso allora la faccio scattare
if(_curTarget getVariable ["vault_hacking_ip",false]) exitWith {hint "Hacking in corso"};
_curTarget setVariable ["vault_hacking_ip",true,true];


[player] spawn life_fnc_startRobbery;

_title = "Hacking Vault";
life_action_inUse = true; 

[[2,"$$$ HACKING VAULT IN CORSO $$$"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[2,"$$$ HACKING VAULT IN CORSO $$$"],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = _curTarget getVariable ["hackingProgress",0.01];

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.18;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.001;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_save = true;};
	if(life_istazed) exitWith {_save = true;}; 
	if(life_interrupted) exitWith {_save = true;};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
	if(_bank getVariable "bank_block")exitWith {_bankBlocked = true;};
};

if(!isNil "_save") then {
	_curTarget setVariable ["hackingProgress",_cP,true];
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;[[2,"$$$ RAPINATORE BLOCCATO $$$"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;_curTarget setVariable ["hackingProgress",_cP,true];_curTarget setVariable ["vault_hacking_ip",false,true];;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;[[2,"$$$ RAPINATORE ARRESTATO $$$"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;_curTarget setVariable ["vault_hacking_ip",false,true];};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;[[2,"$$$ HACKING VAULT INTERROTTO $$$"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;_curTarget setVariable ["hackingProgress",_cP,true];_curTarget setVariable ["vault_hacking_ip",false,true];};
if(!isNil "_bankBlocked") exitWith {titleText["Hacking Fallito","PLAIN"]; life_action_inUse = false;[[2,"$$$ BANCA BLOCCATA $$$"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;_curTarget setVariable ["vault_hacking_ip",false,true];};

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;[[2,"$$$ RAPINATORE BLOCCATO $$$"],"life_fnc_broadcast",east,false] spawn life_fnc_MP;_curTarget setVariable ["hackingProgress",_cP,true];_curTarget setVariable ["vault_hacking_ip",false,true];;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;[[2,"$$$ RAPINATORE ARRESTATO $$$"],"life_fnc_broadcast",east,false] spawn life_fnc_MP;_curTarget setVariable ["vault_hacking_ip",false,true];};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;[[2,"$$$ HACKING VAULT INTERROTTO $$$"],"life_fnc_broadcast",east,false] spawn life_fnc_MP;_curTarget setVariable ["hackingProgress",_cP,true];_curTarget setVariable ["vault_hacking_ip",false,true];};
if(!isNil "_bankBlocked") exitWith {titleText["Hacking Fallito","PLAIN"]; life_action_inUse = false;[[2,"$$$ BANCA BLOCCATA $$$"],"life_fnc_broadcast",east,false] spawn life_fnc_MP;_curTarget setVariable ["vault_hacking_ip",false,true];};


if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;_curTarget setVariable ["hackingProgress",_cP,true];_curTarget setVariable ["vault_hacking_ip",false,true];};

life_action_inUse = false;

[[2,"$$$ VAULT APERTO $$$"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[2,"$$$ VAULT APERTO $$$"],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
titleText["Vault aperto","PLAIN"];
_curTarget setVariable ["vault_hacked",true,true];
_curTarget animate ["d_l_Anim",1];
sleep 30;
_curTarget animate ["d_o_Anim",1];