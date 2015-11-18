/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","apple_5","luppolo","tartaruga","rame","canapa","alluminio","papavero","ferro","petrolio","oro","platino","cocaina","uranio"];
_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	/*hint localize "STR_NOTF_notNearResource";*/
	life_action_inUse = false;
};


_val = random 5;

/*
//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4","apple_5"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["luppolo"]): {_gather = "luppolo"; _val = 2;};
	case (_zone in ["turtle_1","turtle_2","turtle_4"]): {_gather = "tartaruga"; _val = 2;};
	case (_zone in ["rame"]): {_gather = "rame"; _val = 2;};
	case (_zone in ["canapa"]): {_gather = "canapa"; _val = 2;};
	case (_zone in ["alluminio"]): {_gather = "alluminio"; _val = 2;};
	case (_zone in ["papavero"]): {_gather = "papavero"; _val = 2;};
	case (_zone in ["ferro"]): {_gather = "ferro"; _val = 2;};
	case (_zone in ["petrolio"]): {_gather = "petrolio"; _val = 2;};
	case (_zone in ["oro"]): {_gather = "oro"; _val = 2;};
	case (_zone in ["platino"]): {_gather = "platino"; _val = 2;};
	case (_zone in ["cocaina"]): {_gather = "cocaina"; _val = 2;};
	case (_zone in ["uranio"]): {_gather = "uranio"; _val = 2;};
	default {""};
};

*/
//gather check??
if(vehicle player != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};


//[[player,"CL3_Anim_Gatheringin3"],"life_fnc_animSync",nil,FALSE] spawn life_fnc_MP;
//sleep 10;

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	if(_gather == "cannabis")then
	{
		_diff2 = floor random 100;			//RANDOM VALUE
		if (_diff2 > 96) then{					//4% 
			_diff2 = 1;
			_gather = "cannabisSeed";
			if(([true,_gather,_diff2] call life_fnc_handleInv)) then
			{
				_itemName2 = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
				titleText[format["Hai raccolto: \n%1\n%2",format[localize "STR_NOTF_Gather_Success",_itemName,_diff],format[localize "STR_NOTF_Gather_Success",_itemName2,_diff2]],"PLAIN"];					
			};
		}else{
			titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];		
		}; 
	}else{
		titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
	};
};

life_action_inUse = false;
