/*
	Ganascie per poliziotti - bloccano veicoli di terra
	Richiedono il lockpick per essere rimosse
*/

private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
//_curTarget = _this select 0;
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; 
_isVehicle = if((_curTarget isKindOf "LandVehicle") ) then {true} else {false};
if !(_isVehicle) exitWith {hint "Questo veicolo non ha ganasce";};
if (_curTarget getVariable "ganascia" != 1) exitWith {hint "Questo veicolo non ha ganasce applicate";};

_title = format["Sbloccando %1",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
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
	sleep 0.20;
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
life_action_inUse = false;
[false,"tenaglie",1] call life_fnc_handleInv;

if ((side player == west) or (side player == east)) then
{
	[true,"ganascia",1] call life_fnc_handleInv;
	_curTarget setVariable["ganascia",0,true];  
	detach _curTarget ;
	_obj = attachedTo _curTarget ;
	deletevehicle _obj ; 
	{    detach _x;deleteVehicle _x;  } forEach attachedObjects _curTarget;
	titleText["Il veicolo è stato sbloccato.","PLAIN"];
}else{
	private ["_dice"];
	if(license_civ_meccanico) exitwith {
			_curTarget setVariable["ganascia",0,true];  
		detach _curTarget ;
		_obj = attachedTo _curTarget ;
		deletevehicle _obj ; 
		titleText["Hai rimosso le ganasce","PLAIN"];
		{    detach _x;deleteVehicle _x;  } forEach attachedObjects _curTarget;
	};
	
	_dice = random(100);
	if(_dice < 50) then {
		_curTarget setVariable["ganascia",0,true];  
		detach _curTarget ;
		_obj = attachedTo _curTarget ;
		deletevehicle _obj ; 
		titleText["Hai rimosso le ganasce","PLAIN"];
		{    detach _x;deleteVehicle _x;  } forEach attachedObjects _curTarget;
		[[getPlayerUID player,player getVariable["realname",name player],"487"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		hint "Le ganasce si sono rotte";
	} else {
		[[_curTarget],"life_fnc_CarAlarmSound",nil,true] spawn life_fnc_MP;		//ANTIFURTO AUTO
		[[getPlayerUID player,player getVariable["realname",name player],"215"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
 		[[0,format["%1 è stato visto mentre cercava di rubare un veicolo",player getVariable["realname",name player]]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		titleText["Tenaglie rotte","PLAIN"];
	};
};