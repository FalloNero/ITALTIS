private ["_userPlaylist", "_keyPlay", "_keyNext", "_keyPre", "_keyVolUp", "_keyVolDown", "_CLAY_CarRadio_KeyPressed"];

sleep 0.22;
#include "userconfig\CLAY_CarRadio\CLAY_CarRadio.hpp";

CLAY_CarRadio_UserPlaylist = _userPlaylist;

CLAY_CarRadio_KeyPlay    = _keyPlay;
CLAY_CarRadio_KeyNext    = _keyNext;
CLAY_CarRadio_KeyPre     = _keyPre;
CLAY_CarRadio_KeyVolUp   = _keyVolUp;
CLAY_CarRadio_KeyVolDown = _keyVolDown;

CLAY_CarRadio_KeyPressedCode = compile preprocessFile "CLAY_CarRadio\scripts\key.sqf";
_CLAY_CarRadio_KeyPressed = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CLAY_CarRadio_KeyPressedCode"];

If (isNil "CLAY_RadioAddMusic") Then {CLAY_RadioAddMusic = []};
If (isNil "CLAY_RadioAddVehicles") Then {CLAY_RadioAddVehicles = []};
If (isNil "CLAY_RadioNoVehicles") Then {CLAY_RadioNoVehicles = []};
If (isNil "CLAY_RadioShowTooltips") Then {CLAY_RadioShowTooltips = false};

_trigger1 = createTrigger ["EmptyDetector", [0,0,0]];
_trigger1 setTriggerArea [0, 0, 0, false];
_trigger1 setTriggerActivation ["NONE", "PRESENT", true];
_trigger1 setTriggerStatements ["(('Car' countType [(vehicle player)] > 0) || (typeOf (vehicle player) in CLAY_RadioAddVehicles)) && !(typeOf (vehicle player) in CLAY_RadioNoVehicles)", "CLAY_RadioVeh = vehicle player; CLAY_ID_RADIO = CLAY_RadioVeh addAction ['Car Radio','CLAY_CarRadio\scripts\radio.sqf'];", "CLAY_RadioEndTimer = true; CLAY_RadioPlaying = false; playMusic ''; CLAY_RadioVeh removeAction CLAY_ID_RADIO; CLAY_RadioVeh = nil;"];

CLAY_RadioAddMusic = [["radio1civ", "DJ@Altis - Heal Bass", 350]];
CLAY_RadioAddMusic = [["song", "Gemini - Fire Inside", 450]];
CLAY_RadioPlaying = false;
CLAY_RadioEndTimer = true;

CLAY_RadioGameMusic = 
[
	["Fallout", "Fallout", 163], 
	["Defcon", "Defcon", 145], 
	["Wasteland", "Wasteland", 142], 
	["SkyNet", "Sky Net", 175], 
	["MAD", "Mutual Assured Destruction", 153]
];

CLAY_RadioGameMusicOA = 
[

];


If (count CLAY_CarRadio_UserPlaylist > 0) Then
{
	CLAY_RadioCustomMusic = CLAY_CarRadio_UserPlaylist;
}
Else
{
	CLAY_RadioCustomMusic = [];
};

CLAY_RadioPlayList = CLAY_RadioGameMusic;

CLAY_RadioTrack = 0;
CLAY_RadioVol = 0.5;
CLAY_RadioVolStep = 10;

CLAY_RadioSrc = 1;
CLAY_RadioRepeat = false;
CLAY_RadioRandom = false;
CLAY_RadioKeyColor = 1;
CLAY_RadioDisplay = 9;
CLAY_RadioColor = "Black";
