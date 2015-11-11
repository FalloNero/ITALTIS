/*
	Crea e gestisce le telecamere della banca
	
*/
//_bank = nearestObject [[8254,6461.4531,0],"il_bank"];
_bank = fed_bank;
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj];
CAM_ATTACHED = _obj;

NCAM = 1;
CAMERA_MODE = true;

CAM1 = "camera" camCreate (getPos fed_bank);
CAM1 setPosATL (_bank modelToWorld [8.3,-5,4]);
CAM1 switchCamera "INTERNAL"; 

CAM2 = "camera" camCreate (getPos fed_bank);  
CAM2 setPosATL (_bank modelToWorld [-1.3,-3,4]);  
CAM2 setDir 240;

CAM3 = "camera" camCreate (getPos fed_bank);  
CAM3 setPosATL (_bank modelToWorld [-16,-9.7,4]);  
CAM3 setDir 340;



if ((call compile format ["bank_camera_%1",NCAM]) getVariable "active_camera")then
{
	if ((daytime > 0 && daytime < 6) || (daytime > 19 && daytime < 24)) then{camUseNVG true;};
	ACTIVE = true;
	"filmGrain" ppEffectEnable true;
	"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  
	"filmGrain" ppEffectCommit 1; 
}else{
	camUseNVG true;
	ACTIVE = false;
	"filmGrain" ppEffectEnable true;
	"filmGrain" ppEffectAdjust [2, -3, 2, 0.05, 8, false];     
	"filmGrain" ppEffectCommit 1; 
};

FRS_fnc_cameraView =
compileFinal "
[] spawn {
	while {CAMERA_MODE} do{
		if !((call compile format [""bank_camera_%1"",NCAM]) getVariable ""active_camera"") then
		{
			if (ACTIVE) then
			{
				ACTIVE = false;
				camUseNVG true;
				""filmGrain"" ppEffectEnable true;
				""filmGrain"" ppEffectAdjust [2, -3, 2, 0.05, 8, false];     
				""filmGrain"" ppEffectCommit 1; 
			};
		}else{
			if !(ACTIVE) then
			{
				ACTIVE = true;
				if ((daytime > 0 && daytime < 6) || (daytime > 19 && daytime < 24)) then{camUseNVG true;};
				""filmGrain"" ppEffectEnable true;
				""filmGrain"" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  
				""filmGrain"" ppEffectCommit 1; 
			};
		};
		if(!alive player) exitWith {};
		if(life_istazed) exitWith {}; 
		if (animationState player == ""Incapacitated"") exitWith {};
		if((player getVariable[""restrained"",false])) exitWith {};
		sleep 0.1;
	};
	detach player;
	deletevehicle CAM_ATTACHED;
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_EXIT];
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_MOVER];
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_MOVEL];
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_SWITCHU];
	(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_SWITCHD];
	player switchCamera 'INTERNAL';
	'filmGrain' ppEffectEnable false;
	camUseNVG false;
	CAMERA_MODE = false;
};
";

[] call FRS_fnc_cameraView;

/*
[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};
*/

hint format["TELECAMERA \n\n FRECCIA SU: Telecamera successiva \n FRECCIA GIU': Telecamera precedente \n FRECCIA DESTRA : Ruota \n FRECCIA SINISTRA: Ruota \n Premi F10 per uscire",NCAM];

AM_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown",
"if((_this select 1) == 68) then {
(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_EXIT];
(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_MOVER];
(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_MOVEL];
(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_SWITCHU];
(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_SWITCHD];
player switchCamera 'INTERNAL';
'filmGrain' ppEffectEnable false;
camUseNVG false;
CAMERA_MODE = false;
detach player;
deletevehicle CAM_ATTACHED;
};false"];
AM_MOVER = (findDisplay 46) displayAddEventHandler ["KeyDown",
"if((_this select 1) == 205) then {
_camera = call compile format ['CAM%1',NCAM];
_dir = direction _camera;
_camera setDir (_dir + 1);
};false"];
AM_MOVEL = (findDisplay 46) displayAddEventHandler ["KeyDown",
"if((_this select 1) == 203) then {
_camera = call compile format ['CAM%1',NCAM];
_dir = direction _camera;
_camera setDir (_dir - 1);
};false"];
AM_SWITCHU = (findDisplay 46) displayAddEventHandler ["KeyDown",
"if((_this select 1) == 200) then {
if (NCAM == 3)then{NCAM = 1}else{NCAM = NCAM + 1};
_camera = call compile format ['CAM%1',NCAM];
_camera switchCamera 'INTERNAL';
[] call FRS_fnc_cameraView;
};false"];
AM_SWITCHD = (findDisplay 46) displayAddEventHandler ["KeyDown",
"if((_this select 1) == 208) then 
{if (NCAM == 1)then{NCAM = 3}else{NCAM = NCAM - 1};
_camera = call compile format ['CAM%1',NCAM];
_camera switchCamera 'INTERNAL';
[] call FRS_fnc_cameraView;
};false"];
