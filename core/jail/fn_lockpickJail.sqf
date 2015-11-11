
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_execute = true;
_curTarget = fed_jail ;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; 
_door = [] call life_fnc_nearestJailDoor;
if((_door select 0) == "0") exitWith {};

if (_execute) then{

	_title = format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
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
		sleep 0.26;
		if(isNull _ui) then {
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + 0.01;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {};
		if(life_istazed) exitWith {};
		if(life_interrupted) exitWith {};
		if((player getVariable["restrained",false])) exitWith {};
	};

	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
	if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
	if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

	life_action_inUse = false;
	titleText["Porta scassinata","PLAIN"];

	_curTarget animate [_door select 0,1];
};

