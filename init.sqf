enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.3";

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "zlt_fastrope.sqf"; //FastRope
[] execVM "IntLight.sqf"; //Interior Lights
[] execVM "teargas.sqf";


//weather
[] execVM "weather\real_weather.sqf";

//null = [] execVM "\life_server\Functions\WantedSystem\fn_wlupdate.sqf";


["life_fnc_updateWanted"] spawn life_fnc_MP;

//[] execVM "CLAY_CarRadio\initCarRadio.sqf";
//igiLoad
//sleep 10;
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

StartProgress = true;


//AGGIORNA LE SKIN OGNI 2 MINUTI
[] spawn
{
		sleep 120;
		[] call life_fnc_updateTexture ;
};


//prova modifica github seconda


