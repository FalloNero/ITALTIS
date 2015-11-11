/*
	File: fn_cellphoneReceive.sqf
	Author: MarioF
	
	Description:
	Fill the Cellphone with DATA

*/

private["_data","_display","_delayTime","_msgS","_forData"];
disableSerialization;

_data = [_this,0,[]] call BIS_fnc_param;
_dir = [_this,1,0] call BIS_fnc_param;

if(isNull findDisplay 3200) exitWith {};

_display = findDisplay 3200;
_Clist = _display displayCtrl 3203;

//hint format["Data: %1", _data];

lnbClear ctrlIDC _Clist;
if(count _data > 0) then {
	{
		_delayTime = parseNumber (_x select 5);
		if(_delayTime > 60) then {
			_delayTime = _delayTime / 60;
			if(_delayTime > 60) then {
				_delayTime = _delayTime / 60;
				if(_delayTime > 24) then {
					_delayTime = _delayTime / 24;
					_delayTime = format["%1 Tage", round _delayTime];
				} else {
					_delayTime = format["%1 Std", round _delayTime];
				};
			} else {
				_delayTime = format["%1 Min",round  _delayTime];
			};
		} else {
			_delayTime = format["%1 Sek", round _delayTime];
		};
		
		_msgS = [_x select 4,37] call KRON_StrLeft;
		
		if(_dir == 0) then {
			_forData = ["Von", _x select 1, _x select 6, _x select 4];
			_Clist lnbAddRow[_delayTime, _x select 1, format["%1 ...",_msgS]];
			_Clist lnbSetData[[((lnbSize _Clist) select 0)-1,0],str(_forData)];
		} else {
			_forData = ["An", _x select 3, _x select 6, _x select 4];
			_Clist lnbAddRow[_delayTime, _x select 3, format["%1 ...",_msgS]];
			_Clist lnbSetData[[((lnbSize _Clist) select 0)-1,0],str(_forData)];
		};
	} foreach _data;
};

// Enable the Interface
ctrlEnable[3209, true];
ctrlEnable[3210, true];
ctrlEnable[3216, true];
ctrlEnable[3211, true];
ctrlEnable[3218, true];
ctrlEnable[3212, true];
ctrlEnable[3219, true];
ctrlEnable[3220, true];