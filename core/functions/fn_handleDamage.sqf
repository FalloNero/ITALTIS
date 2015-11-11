/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//hint format ["unit = %1\npart = %2\ndamage = %3\nsource = %4\nprojectile = %5\nweapon = %6",_unit,_part,_damage,_source,_projectile,currentWeapon _source];

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball"] && _curWep in ["hgun_P07_snds_F"]) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = 35;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

				_damage = 0;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
							_damage = 0;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
							_damage = 0;
						};
					};
				};

			//Temp fix for super tasers on cops.
			if((playerSide == west && side _source == west) or (playerSide == east && side _source == east)) then {
				_damage = 0;
			};
		}else{
		    // Lower Damage with Cocaine
			if(_projectile != "" && isPlayer _unit && _damage != 0 && life_drugged_cocaine > 0) then
			{
				_lowCoca = life_drugged_cocaine * 10 * 1;
				_damage = _damage - ((_damage * _lowCoca) / 100);
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;