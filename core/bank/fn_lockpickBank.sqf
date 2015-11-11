
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_door = "0";
_execute = true;
//_curTarget = nearestObject [[8254,6461.4531,0],"il_bank"];
_curTarget = fed_bank ;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_door = [] call life_fnc_nearestBankDoor;
if(_door == "0") exitWith {};
if((_curTarget getVariable format ["osa_%1",_door]) == 1) exitWith {hint "Porta gia' forzata";};
if !(_door == "dc_int") then{
	if !(_door == "dc_ext") then{
		if(_curTarget getVariable "bank_block")then {hint "Banca in blocco di sicurezza";_execute = false;};
	};
};
if !(fed_bank getVariable "bank_robbery_ip") then
{
	if((east countSide playableUnits) < 5) exitWith
		{
		hint "Sono necessari almeno 5 poliziotti di Tijuana";
		_execute = false;
		};
};
if (_execute) then{

	_title = format[localize "STR_ISTR_Lock_Process",getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")];
	life_action_inUse = true; //Lock out other actions

	//Setup the progress bar
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
		if(life_istazed) exitWith {}; //Tazed
		if(life_interrupted) exitWith {};
		if((player getVariable["restrained",false])) exitWith {};
	};

	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
	if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
	if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

	life_action_inUse = false;
	titleText["Porta scassinata","PLAIN"];
	_curTarget setVariable[format ["osa_%1",_door],1,true];
	_curTarget setVariable[format ["%1_forced",_door],1,true];
	switch (_door) do
	{
		case "h1f": {_curTarget animate ["h1fAnim",0] ; _curTarget animate ["h1bAnim",1] ; _curTarget setObjectTextureGlobal [1,"\il_bank\textures\unlocked.paa"]};
		case "h2f": {_curTarget animate ["h2fAnim",1] ; _curTarget animate ["h2bAnim",0] ; _curTarget setObjectTextureGlobal [2,"\il_bank\textures\unlocked.paa"]};
		case "h3f": {_curTarget animate ["h3fAnim",1] ; _curTarget animate ["h3bAnim",0] ; _curTarget setObjectTextureGlobal [3,"\il_bank\textures\unlocked.paa"]};
		case "h4f": {_curTarget animate ["h4fAnim",1] ; _curTarget animate ["h4bAnim",0] ; _curTarget setObjectTextureGlobal [4,"\il_bank\textures\unlocked.paa"]};
		case "h5f": {_curTarget animate ["h5fAnim",1] ; _curTarget animate ["h5bAnim",0] ; _curTarget setObjectTextureGlobal [5,"\il_bank\textures\unlocked.paa"]};
		case "h6f": {_curTarget animate ["h6fAnim",1] ; _curTarget animate ["h6bAnim",0] ; _curTarget setObjectTextureGlobal [6,"\il_bank\textures\unlocked.paa"];_curTarget animate ["cdl_Anim",0]; _curTarget setObjectTextureGlobal [0,"\il_bank\textures\green_light.paa"]};
		case "h7f": {_curTarget animate ["h7fAnim",1] ; _curTarget animate ["h7bAnim",0] ; _curTarget setObjectTextureGlobal [7,"\il_bank\textures\unlocked.paa"]};
		case "b1": {_curTarget animate ["gatebolt_1Anim",1] ; _curTarget setObjectTextureGlobal [10,"\il_bank\textures\unlocked.paa"]};
		case "b2": {_curTarget animate ["gatebolt_2Anim",1] ; _curTarget setObjectTextureGlobal [11,"\il_bank\textures\unlocked.paa"]};
		case "b3": {_curTarget animate ["gatebolt_3Anim",1] ; _curTarget setObjectTextureGlobal [12,"\il_bank\textures\unlocked.paa"]};
		case "d8": {_curTarget animate ["lbl_Anim",0]; _curTarget setObjectTexture [13,"\il_bank\textures\green_light.paa"];_curTarget setObjectTexture [9,"\il_bank\textures\unlocked.paa"]};
		default {};
	};
	//se è la prima porta che scassino allora attivo l'allarme e faccio scattare la rapina

	if !(_door == "dc_int") then{
		if !(_door == "dc_ext") then{
			[player] spawn life_fnc_startRobbery;
		}else{
			[[],"life_fnc_bankLockDC",false,false] spawn life_fnc_MP;
		};
	}else{
		[[],"life_fnc_bankLockDC",false,false] spawn life_fnc_MP;
	};

};

