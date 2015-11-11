
/*
 stupid script that makes you say hi! by CRY
 */


_suca = missionnamespace getvariable "saluting";
if(_suca=="true") exitWith {hint "non spammare!";};

missionnamespace setvariable ["saluting","true"];
publicvariable "saluting";


player playmove "AmovPercMstpSrasWrflDnon_Salute"; 
[[player,"hi"],"life_fnc_playsound",nil,true] spawn life_fnc_MP;




[] spawn {
sleep 5;


missionnamespace setvariable ["saluting","false"];
publicvariable "saluting";
};