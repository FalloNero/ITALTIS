/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if ((playerside==independent) and (_type=="morfina")) exitWith {

_license = "license_med_morfina";
_license2 = "Morfina Medica";

if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license2];};

life_cash = life_cash - _price;
titleText[format[localize "STR_NOTF_B_1", _license2,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license),true];

};

if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

life_cash = life_cash - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];