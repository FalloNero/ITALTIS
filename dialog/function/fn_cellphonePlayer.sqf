/*
	File: fn_cellphonePlayer.sqf
	Author: MarioF
	
	Description:
	Setup the Playerlist for the Cellphone menu
*/

private["_mode","_display","_search","_sortList","_selList","_selPlayer"];
disableSerialization;

_mode = [_this,0,-1] call BIS_fnc_param;
_selList = [_this,1,-1] call BIS_fnc_param;
_player = [_this,2,objNull] call BIS_fnc_param;

if(isNull findDisplay 3200 || _mode == -1) exitWith {};

_display = findDisplay 3200;
_CplayerSearch = _display displayCtrl 3201;
_CplayerList = _display displayCtrl 3202;
_CchoosenPlayer = _display displayCtrl 3217;
_CbtnSendMessage = _display displayCtrl 3207;

// Fill Playerlist
if(_mode == 1) then {
	lbClear _CplayerList;
	_search = (ctrlText _CplayerSearch);
	_sortList = [];
	{
		if(_x != player) then {
			if(_search != "") then {
				if([name _x,_search] call KRON_StrInStr) then {
					_sortList pushBack [name _x, _x];
				};
			} else {
				_sortList pushBack [name _x, _x];
			};
		};
	} foreach playableunits;
	_debugTick = diag_tickTime;
	_sortList = [_sortList, 0] call KRON_ArraySort;
	if((call life_adminlevel) > 2) then { systemChat format["Sorting playerlist tock: %1ms", (diag_tickTime - _debugTick)]; };
	
	{
		_CplayerList lbAdd format["%1", _x select 0];
		_CplayerList lbSetData [(lbSize _CplayerList)-1,str(_x select 1)];
	} foreach _sortList;
};

if(_mode == 2) then {
	_selPlayer = call compile format["%1",(lbData[ctrlIDC _CplayerList, _selList])];
	life_cellphone_lockedDestination = _selPlayer;
	ctrlEnable[ctrlIDC _CbtnSendMessage, true];
	ctrlSetText[ctrlIDC _CchoosenPlayer, format["%1", name _selPlayer]];
};

if(_mode ==  3) then {
	life_cellphone_lockedDestination = _player;
	ctrlEnable[ctrlIDC _CbtnSendMessage, true];
	ctrlSetText[ctrlIDC _CchoosenPlayer, format["%1", name _player]];
};