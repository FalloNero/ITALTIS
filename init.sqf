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

[]execVM "zombie\configurations.sqf";

//weather
[] execVM "weather\real_weather.sqf";

//null = [] execVM "\life_server\Functions\WantedSystem\fn_wlupdate.sqf";


["life_fnc_updateWanted"] spawn life_fnc_MP;

//[] execVM "CLAY_CarRadio\initCarRadio.sqf";
//igiLoad
//sleep 10;
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

StartProgress = true;


sleep 0.5;
dokeyCheck={    
private ["_r"] ;   
 _r = false ;    
 if ((_this select 1) in (actionKeys "TacticalView")) then {       
 hint "Command mode disabled" ;        
_r=true;    };  _r;} ;
(FindDisplay 46) displaySetEventHandler [     "keydown",     "_this call dokeyCheck"     ];




[] spawn
{
	while{true} do
	{
	_ilmezzo =  nearestObject [player, "Car"]; 
	_meters = player distance _ilmezzo;	

			if (!(player in _ilmezzo) and (_meters<4)) then
			{
			if(((player getVariable["restrained",false])) and ((player getVariable "lockedinveh"))) then {player moveInCargo _ilmezzo};
			};
		sleep 0.5;
	};
};


[] spawn 
{    
while {true} do {

        [] call life_fnc_noflyzone;    
		
		sleep 2;   
		
	};
};

	
//AGGIORNA LE SKIN OGNI 2 MINUTI
[] spawn
{
		sleep 120;
		[] call life_fnc_updateTexture ;
};





