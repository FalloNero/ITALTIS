/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( life_cash < 0 ) exitWith { systemChat "Du benötigst 6000€ um eine Nachricht zu senden!"; }; // Hint if person haves no 6000 dollar
if (!life_civ_news) exitWith {hint "You don't have the reporter license!"};
if ( playerSide != civilian ) exitWith { systemChat "You have to be a reporter!"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "You have to wait 5 minutes to send another report!"; }; //Gives Player the Hint to Wait 10 mins
life_cash = life_cash - 0;

_message = ctrlText 9001;
[[3,format ["Field Reporter %1 live for Channel 7: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;


life_channel_send = false;

[] spawn
{
	sleep 300;
	life_channel_send = true;
};

