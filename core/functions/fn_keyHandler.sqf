/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_unconscious"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//SE MORTO INTERROMPISS
_quitKey = [62,211];
if (!(_code in _quitKey)) then
{
	_unconscious = player getVariable "FAR_isUnconscious";
	if (_unconscious == 1) exitWith {true;};
};
//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case east: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};

	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//USA PICCONE con TAB
	case 15:
	{
		if((!life_action_inUse) && (vehicle player == player)) then
        {
            if(life_inv_pickaxe > 0) then
            {
                [] spawn life_fnc_pickAxeUse;
        	};
        };
	};

//Restraining or robbing (Shift + R)  (control+R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		
		if(_shift && playerSide == east && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};

//Robbing
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed && !(player getVariable["surrender",false])) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
			_handled = true;
		};
		
		//pugning
		
		if((_ctrlKey && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1)and ((playerSide == east) or (playerSide == west))) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed && !(player getVariable["surrender",false])) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
			_handled = true;
		};
		
	};

	
//surrender... shift + g
	case 34:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};
	/*
	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
			
			
		};
		
		
	};
	
	
	
	*/
	
	case 20:
	{
	if(!_alt && !_ctrlKey) then { [] call life_fnc_suicidebomb; };
	};
	
	
	//L Key?
	case 38:
	{
	if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [east,west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						if(playerSide == east) then {
							[vehicle player] call life_fnc_sirenLights;
						} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
	};
		
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};

	//F Key
	case 33:
	{
		if ((_shift && !_alt && !_ctrlKey && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) && ((playerSide == west) or (playerSide == east)))  then
		{
            [] spawn
            {
                life_siren2_active = true;
                sleep 1.5;
                life_siren2_active = false;
            };
            _veh = vehicle player;
            if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
            if((_veh getVariable "siren2")) then
            {
                titleText ["Stop OFF","PLAIN"];
                _veh setVariable["siren2",false,true];
            }
                else
            {
                titleText ["Stop ON","PLAIN"];
                _veh setVariable["siren2",true,true];
                [[_veh],"life_fnc_copSiren2",nil,true] spawn life_fnc_MP;
            };
		}else{

			if(playerSide in [east,west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
			{
				if ((playerSide == west) or (playerSide == east)) then
				{
					[] spawn
					{
						life_siren_active = true;
						sleep 4.7;
						life_siren_active = false;
					};
				}else{
					[] spawn
					{
						life_siren_active = true;
						sleep 6;
						life_siren_active = false;
					};
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
				if((_veh getVariable "siren")) then
				{
					titleText ["Sirena Off","PLAIN"];
					_veh setVariable["siren",false,true];
				}
				else
				{
					titleText ["Sirena On","PLAIN"];
					_veh setVariable["siren",true,true];
					if((playerSide == west) or (playerSide == east)) then {
						[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
					} else {
						[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
					};
				};
			};
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
				if(isNull cursorTarget) then
				{
					_veh = lineIntersectsWith [eyePos player, ATLtoASL screenToWorld [0.1,0.1]]; 
					_veh = _veh select 0;
				};
			} else {
				_veh = vehicle player;
			};
			if(((_veh isKindOf "House_F") || (_veh isKindOf "House_EP1")) && (playerSide == civilian)) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				if((_veh isKindOf "il_bank") and ((playerSide == west) or (playerSide == east))) then {
					_door = [_veh] call life_fnc_nearestBankDoor;
					if(_door == "0") exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["osa_%1",_door],0];
					_forced = _veh getVariable [format["%1_forced",_door],0];
					if (_forced == 0) then {
						if(_locked == 0) then {
							_veh setVariable[format ["osa_%1",_door],1,true];
							switch (_door) do
							{
								case "h1f": {_veh animate ["h1fAnim",0] ; _veh animate ["h1bAnim",1]; _veh setObjectTextureGlobal [1,"\il_bank\textures\unlocked.paa"]};
								case "h2f": {_veh animate ["h2fAnim",1] ; _veh animate ["h2bAnim",0] ; _veh setObjectTextureGlobal [2,"\il_bank\textures\unlocked.paa"]};
								case "h3f": {_veh animate ["h3fAnim",1] ; _veh animate ["h3bAnim",0] ; _veh setObjectTextureGlobal [3,"\il_bank\textures\unlocked.paa"]};
								case "h4f": {_veh animate ["h4fAnim",1] ; _veh animate ["h4bAnim",0] ; _veh setObjectTextureGlobal [4,"\il_bank\textures\unlocked.paa"]};
								case "h5f": {_veh animate ["h5fAnim",1] ; _veh animate ["h5bAnim",0] ; _veh setObjectTextureGlobal [5,"\il_bank\textures\unlocked.paa"]};
								case "h6f": {_veh animate ["h6fAnim",1] ; _veh animate ["h6bAnim",0] ; _veh setObjectTextureGlobal [6,"\il_bank\textures\unlocked.paa"];_veh animate ["cdl_Anim",0]; _veh setObjectTextureGlobal [0,"\il_bank\textures\green_light.paa"]};
								case "h7f": {_veh animate ["h7fAnim",1] ; _veh animate ["h7bAnim",0] ; _veh setObjectTextureGlobal [7,"\il_bank\textures\unlocked.paa"]};
								case "b1": {_veh animate ["gatebolt_1Anim",1] ; _veh setObjectTextureGlobal [10,"\il_bank\textures\unlocked.paa"]};
								case "b2": {_veh animate ["gatebolt_2Anim",1] ; _veh setObjectTextureGlobal [11,"\il_bank\textures\unlocked.paa"]};
								case "b3": {_veh animate ["gatebolt_3Anim",1] ; _veh setObjectTextureGlobal [12,"\il_bank\textures\unlocked.paa"]};
								case "d8": {_veh animate ["lbl_Anim",0]; _veh setObjectTexture [13,"\il_bank\textures\green_light.paa"];_veh setObjectTexture [9,"\il_bank\textures\unlocked.paa"]};
								default {};
							};
							systemChat localize "STR_House_Door_Unlock";
						} else {
							_veh setVariable[format ["osa_%1",_door],0,true];
							switch (_door) do
							{
								case "h1f": {_veh animate ["door_1Anim",0];_veh animate ["h1fAnim",1]; _veh animate ["h1bAnim",0]; _veh setObjectTextureGlobal [1,"\il_bank\textures\locked.paa"]};
								case "h2f": {_veh animate ["door_2Anim",0];_veh animate ["h2fAnim",0]; _veh animate ["h2bAnim",1] ; _veh setObjectTextureGlobal [2,"\il_bank\textures\locked.paa"]};
								case "h3f": {_veh animate ["door_3Anim",0];_veh animate ["h3fAnim",0]; _veh animate ["h3bAnim",1] ; _veh setObjectTextureGlobal [3,"\il_bank\textures\locked.paa"]};
								case "h4f": {_veh animate ["door_4Anim",0];_veh animate ["h4fAnim",0]; _veh animate ["h4bAnim",1] ; _veh setObjectTextureGlobal [4,"\il_bank\textures\locked.paa"]};
								case "h5f": {_veh animate ["door_5Anim",0];_veh animate ["h5fAnim",0]; _veh animate ["h5bAnim",1] ; _veh setObjectTextureGlobal [5,"\il_bank\textures\locked.paa"]};
								case "h6f": {_veh animate ["door_6Anim",0];_veh animate ["h6fAnim",0]; _veh animate ["h6bAnim",1] ; _veh setObjectTextureGlobal [6,"\il_bank\textures\locked.paa"];_veh animate ["cdl_Anim",1]; _veh setObjectTextureGlobal [0,"\il_bank\textures\red_light.paa"]};
								case "h7f": {_veh animate ["door_7Anim",0];_veh animate ["h7fAnim",0]; _veh animate ["h7bAnim",1] ; _veh setObjectTextureGlobal [7,"\il_bank\textures\locked.paa"]};
								case "b1": {_veh animate ["gatebolt_1Anim",0] ;_veh animate ["gate_1Anim",0];_veh setObjectTextureGlobal [10,"\il_bank\textures\locked.paa"]};
								case "b2": {_veh animate ["gatebolt_2Anim",0] ;_veh animate ["gate_2Anim",0];_veh animate ["gate_3Anim",0];_veh setObjectTextureGlobal [11,"\il_bank\textures\locked.paa"]};
								case "b3": {_veh animate ["gatebolt_4Anim",0] ;_veh animate ["gate_4Anim",0];_veh animate ["gate_5Anim",0];_veh setObjectTextureGlobal [12,"\il_bank\textures\locked.paa"]};
								case "d8": {_veh animate ["lbl_Anim",1];_veh animate ["door_8Anim",0]; _veh setObjectTexture [13,"\il_bank\textures\red_light.paa"];_veh setObjectTexture [9,"\il_bank\textures\locked.paa"]};
								default {};
							};
							systemChat localize "STR_House_Door_Lock";
						};
					}else{
						hint localize "STR_Bank_Door_Forced";
					};
				}else{
					_locked = locked _veh;
					if(_veh in life_vehicles && player distance _veh < 8) then {
						if(_locked == 2) then {
							if(local _veh) then {
								_veh lock 0;
							} else {
								[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							};
							systemChat localize "STR_MISC_VehUnlock";
							player say3D "car_unlock";
						} else {
							if(local _veh) then {
								_veh lock 2;
							} else {
								[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							};	
							systemChat localize "STR_MISC_VehLock";
							player say3D "car_lock";
						};
					};
				};
			};
		};
		if((!_alt && !_ctrlKey) and (playerSide==east)) then {
		_curTarget = cursorTarget;
		
			if(_curTarget iskindof "armat_jail2") then {
			
				_selectionPos = _curTarget selectionPosition "osa_controlmaindoor";
				_worldSpace = _curTarget modelToWorld _selectionPos;
				
				if(player distance _worldSpace < 3) then {
		
					_state = _curTarget animationPhase "maindoorl";
					_state2 = _curTarget animationPhase "maindoorr";
	
					if(_state>0.5) then {
					_curTarget animate ["maindoorl",0];
					}else{
					_curTarget animate ["maindoorl",1];
					};
					
					if(_state2>0.5) then {
					_curTarget animate ["maindoorr",0];
					}else{
					_curTarget animate ["maindoorr",1];
					};
				};
			};
		};
	};
	//Disconnessione tramite ALT+F4 e CTRL+ALT+CANC

	case 62:
	{
		if(_alt && !_shift) then {
			_text = format["%1 ha usato ALT F4.ID del figlio di puttana = %2",profileName,getPlayerUID player];
			[[_text],"life_fnc_logging",false,false] spawn life_fnc_MP;
		};
	};
	case 211:
	{
		if(_ctrlKey && _alt)  then {
			_text = format["%1 ha usato CTRL ALT CANC.ID del figlio di puttana = %2",profileName,getPlayerUID player];
			[[_text],"life_fnc_logging",false,false] spawn life_fnc_MP;
		};
	};
		//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	case 79:
	{	
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Takwondo!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};

		//Kneebend Slow(Shift + Num 2)
	case 80:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["KneeBend Slow baby~"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};

		//Kneebend Fast(Shift + Num 3)
	case 81:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["KneeBend more Hard!!!Move!!Move!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};

		//Pushup(Shift + Num 4)
	case 75:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Pushup!!!!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
		//EMP Console - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && ((playerSide == west) or (playerSide == east)) && (vehicle player != player && (typeOf vehicle player) == "B_Heli_Transport_01_F")) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };
	
	case 25:
	{
		if(_shift) then
		{
			[] call life_fnc_fadesound;
			_handled = true;
		};
	};
	
	case 1:
	{
		[] spawn
		{
		_cP = 0;
		if (!alive player) exitWith {};
		_itemArray = life_gear;
		if(count _itemArray == 0) exitWith {};
		
			while{true} do
			{
				sleep  0.02;
				_cP = _cP + 1;
					if(_cP >= 200) exitWith {};
			
					if (!isnull (findDisplay 602)) then 
					{
						closeDialog 602;
						[[player getVariable["realname",name player],format["Variable: %1","SOSPETTO DUPING"]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
					};
			};
		
		
		
		};
	};
};


	
	
_handled;