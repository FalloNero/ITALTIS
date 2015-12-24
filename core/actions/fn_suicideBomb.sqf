/*
    ALAH SNACKBAR!
    Created By: TAW_Tonic
    Edited By: MidgetGrimm,PeterBeer, and Xetoxyc
    Tested and Approved by: 617th PMC
*/
private["_test"];
if(vest player != "V_HarnessOGL_brn") exitWith {};
if(life_istazed) exitWith {};
if(life_knockout) exitWith {};
if((player getVariable["restrained",false])) exitWith {};

life_isSuiciding = true;

[[0,format["ALLAHU AKBAR"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP; // 0 second warning shown in chat


//[player, "AllahuAkbar", 50] call life_fnc_globalSound;

[[player,"xplode"],"life_fnc_playsound",nil,true] spawn life_fnc_MP;

sleep 6;

//BOOM

if(vest player != "V_HarnessOGL_brn") exitWith {life_isSuicide = false;};

removeVest player;
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

life_isSuicide = false;

[[0,format["%1 ha donato la vita ad Allah!",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;