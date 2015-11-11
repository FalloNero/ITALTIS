/*
	File: fn_speedtrapHack.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	speedtrap is a speedtrap and sometimes a speedtrap
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

if (isnil ("king_player_speedtrap_hack_is_running")) then {king_player_speedtrap_hack_is_running=0;};

private["_speedtrap","_inventory","_alarmsystems","_upp","_ui","_progress","_pgText","_cP","_displayName","_distance","_badDistance","_var_laptop","_value_laptop","_tool_type","_dice","_unlock_chance","_alarm_chance","_numDoors","_owner","_owner_object"];

_speedtrap = cursorTarget;
if(isNull _speedtrap) exitwith {};

_var_laptop = ["laptop",0] call life_fnc_varHandle;
_value_laptop = missionNamespace getVariable _var_laptop;
if(_value_laptop <= 0) exitWith {titleText["Hai bisogno di un computer portatile","PLAIN"];};

if(king_player_speedtrap_hack_is_running == 1) exitWith {hint "Hacking già in corso";};

_progress_text = format["Cracking Autovelox"];

_success = [20, _progress_text, _speedtrap] call life_fnc_progressWaitUntilFinished;
if(!_success) exitWith {};

_dice = random(100);
if(_dice <= 25) then
{
    //Speedtrap hacked
    king_player_speedtrap_hack_is_running = 1;
    [] spawn
    {
        sleep (5*60);
        king_player_speedtrap_hack_is_running = 0;
    };
    [] call king_fnc_speedtrapGetPhotoList;
    _speedtrap setVariable ["speedtrap_photos", [], true];
    titleText["Hacking riuscito le immagini sono state cancellate","PLAIN"];
}
else
{
    //HACK FAILED!!
	[[_speedtrap],"life_fnc_CarAlarmSound",nil,true] spawn life_fnc_MP;	
    titleText["SYSTEM MALFUNCTION... MEMORY SECURITY ALERT...","PLAIN"];
    [[getPlayerUID player,name player,"46"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
    [[0,format["%1 è stato visto mentre tentava un hacking di autovelox", name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	 [[0,format["%1 è stato visto mentre tentava un hacking di autovelox", name player]],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
    hint "?...Scappa ?";
};
