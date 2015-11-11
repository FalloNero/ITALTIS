/*
	File: fn_robReserve.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for robbing the federal reserve.
*/
private["_vault","_funds","_timer","_toFar"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_funds = [_this,1,-1,[0]] call BIS_fnc_param;
_toFar = false;

if(isNull _vault OR _funds == -1) exitWith {}; //Bad data
if(player distance _vault > 10) exitWith {[[_vault,-1],"TON_fnc_robberyState",false,false] spawn life_fnc_MP; hint "Devi restare entro i 10m dalla cassaforte"};

if(_funds < 50000) exitWith{[[_vault,-1],"TON_fnc_robberyState",false,false] spawn life_fnc_MP; hint "Non ci sono abbastanza fondi nella banca";};

if(((west countSide playableUnits) + (East countSide playableUnits)) < 4) exitWith{[[_vault,-1],"TON_fnc_robberyState",false,false] spawn life_fnc_MP; hint "Sono necessari almeno 4 poliziotti in gioco";};

_timer = time + (16 * 60); //Default timer is 10 minutes to rob.
titleText["Scassinando la cassaforte...","PLAIN"];
[[2,"$$$ RAPINA ALLA BANCA FEDERALE $$$"],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;


while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = [(_timer - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
	hintSilent format["Devi restare entro i 15m!\n\nTempo restante:\n %1\n\nDistanza: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 15) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
	sleep 0.1;
};

switch(true) do
{
	case (_toFar):
	{
		hint "Ti sei allontanato troppo dalla cassaforte.Rapina fallita.";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};

	case (!alive player):
	{
		hint "La rapina è fallita a causa del tuo decesso";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};

	case (life_istazed):
	{
		hint "Sei stato incapacitato dalla polizia.Rapina fallita.";
		[[_vault,0],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};

	case ((round(_timer - time)) < 1):
	{
		hint format["Hai rubato €%1\n\nLa tua carta bancaria resterà inattiva per 8 min",[_funds] call life_fnc_numberText];
		[] spawn
		{
			life_use_atm = false;
			sleep 480;
			life_use_atm = true;
		};
		life_cash = life_cash + _funds;
		[[_vault,1,_funds],"TON_fnc_robberyState",false,false] spawn life_fnc_MP;
	};
};