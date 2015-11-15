/*
file: fn_robShops.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name;



if(side _robber != civilian) exitWith { hint "Non puoi rapinare la banca perchè non sei un civile!" };
if(_robber distance _shop > 5) exitWith { hint "Devi essere entro 5m dalla cassa per rapinare!" };

_cops = (west countSide playableUnits);
if(_cops < 4) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "Devono esserci almeno 5 poliziotti";};




if (_rip) exitWith { hint "Rapina già in corso!" };
_rip = true;
if (vehicle player != _robber) exitWith { hint "Esci dal veicolo!" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "Ahahahahaha, non mi fai paura, esci di qui pagliaccio!" };

if (_kassa == 0) exitWith { hint "Non ci sono soldi nella cassa!" };


_kassa = 1000000 + round(random 1000000);

 if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {hint"Non hai il grimaldello";};
 
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";




 

[] spawn {call life_fnc_banksound;};

hint "E' scattato l'allarme.. Stai attento!";
[[2,"ALLARME! E IN CORSO UNA RAPINA ALLA BANCA!"],"life_fnc_broadcast"] spawn life_fnc_MP;



 
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress, stay close (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
while{true} do
{
sleep 0.4;
_cP = _cP + 0.005;
_progress progressSetPosition (_cP / 8);
_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (%1%2)...",round(_cP * 12.5),"%"];
_Pos = position player; // by ehno: get player pos
				                _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "Rapina alla banca in corso";
				                "Marker200" setMarkerType "mil_warning";			
if(_cP >= 8) exitWith {};
if(_robber distance _shop > 10.5) exitWith { };
if!(alive _robber) exitWith {};

//animazione
if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
};


if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hint "You need to stay within 10m to Rob registry! - Now the registry is locked."; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["Hai rubato $%1, ora scappa via!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
life_cash = life_cash + _kassa;

_rip = false;
life_use_atm = false;
sleep (600 + random(300));
life_use_atm = true;
if!(alive _robber) exitWith {};
[[getPlayerUID _robber,name _robber,"34"],"life_fnc_wantedAdd2",false,false] spawn life_fnc_MP;
};
sleep 300;


_action = _shop addAction["Rapina Banca",life_fnc_robBankGuy];	
_shop switchMove "";