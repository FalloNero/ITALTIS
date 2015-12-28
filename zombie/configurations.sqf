/*
	file: configurations.sqf
	author: corvobrok
	EDITED: CRY
	
	description:
	set up files
*/
//XXXXXXXXXXXXXXXXXXXXX  EDIT FROM HERE!  XXXXXXXXXXXXXXXXXXXXXXXXX
//---------general settings----------------------------------------

zombielimit=15;		//zombies respawn afterdead, but for each unit in zone, 7 zombies will spawn
zombiedamage=50;	//% of the damage of a zombie for a punch
zombierun = 1; 		//set 1 if zombie must run, 0 if they must walk
respawntime = 200;	//time for respawn killed zombies

zdebugging = 0;	//show the debug stats; enable with 1



//----------Only marker spawn---------------------------------------
//with this function, zombies will spawn only near markers

zombiemkr=["zombie1","zombie2","zombie3","zombie4","zombie5","zombie6","zombie7"];	   //markers where zombie spawn
//EXAMPLE: zombiemkr=["marker1",marker2"];
//where marker1 and marker2 are marker placed on the editor

markerdist = 500;  //distance from markers where zombies spawn/despawn



//XXXXXXXXXXXXXXXXXXXXX  DON'T EDIT BELOW!  XXXXXXXXXXXXXXXXXXXXXXXXX
SideZMB = createCenter civilian;
groupZMB = createGroup civilian;
sleep 0.1;
fncZcontact = compile preprocessFile "zombie\fnc_Zcontact.sqf";
fncZproximity = compile preprocessFile "zombie\fnc_ZProximity.sqf";
fncZMarkers = compile preprocessFile "zombie\fnc_ZMarkers.sqf";
zarray=[];

if (count zombiemkr > 0) then
{[]call fncZMarkers;}
else
{[]call fncZproximity;};
