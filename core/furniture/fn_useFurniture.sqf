/*
	File: core\furniture\fn_useFurniture.sqf
	Author: FRS
	
	Description:
	Creates the in-game object if i am inside my house
*/
private["_position","_class","_obj","_boundingBox","_altH"];
_class = _this select 0;
_house = nearestBuilding position player;
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
_containers = _house getVariable["containers",[]];
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint localize "STR_ISTR_Box_HouseFull"};

_obj = _class createVehicle [0,0,0];
_boundingBox = boundingBoxReal _obj;      
_altH = ((_boundingBox select 1) select 2) - ((_boundingBox select 0) select 2) ;
_obj attachTo[player,[0,1,_altH]];
_altH = _altH - ((getPos _obj) select 2);
_obj attachTo[player,[0,1,_altH]];
_obj setVariable["item","furnitureDeployed",true];

life_furnObj = _obj;

DRAW3DEVENT = addMissionEventHandler ["Draw3D", { 
  INTEROBJ = false;
  _boundingBox = boundingBoxReal life_furnObj;  
  _pmin = _boundingBox select 0;                                       
  _pmax = _boundingBox select 1; 
 
  _p1 = [_pmin select 0,_pmin select 1,_pmin select 2];
  _p2 = [_pmin select 0,_pmin select 1,_pmin select 2];
  _p3 = [_pmin select 0,_pmin select 1,_pmin select 2];
  _p4 = [_pmin select 0,_pmin select 1,_pmin select 2];
  _p5 = [_pmax select 0,_pmax select 1,_pmax select 2];
  _p6 = [_pmax select 0,_pmax select 1,_pmax select 2];
  _p7 = [_pmax select 0,_pmax select 1,_pmax select 2];
  _p8 = [_pmax select 0,_pmax select 1,_pmax select 2];
  
  _p2 set [2,_pmax select 2];
  _p3 set [2,_pmax select 2];
  _p3 set [1,_pmax select 1];
  _p4 set [1,_pmax select 1];
  _p6 set [2,_pmin select 2];
  _p7 set [2,_pmin select 2];
  _p7 set [1,_pmin select 1];
  _p8 set [1,_pmin select 1];
  
  _p1 = life_furnObj modelToWorld _p1;
  _p2 = life_furnObj modelToWorld _p2;  
  _p3 = life_furnObj modelToWorld _p3;
  _p4 = life_furnObj modelToWorld _p4;  
  _p5 = life_furnObj modelToWorld _p5;
  _p6 = life_furnObj modelToWorld _p6;  
  _p7 = life_furnObj modelToWorld _p7;
  _p8 = life_furnObj modelToWorld _p8;   
  
  _p1a = ATLtoASL _p1;
  _p2a = ATLtoASL _p2;
  _p3a = ATLtoASL _p3;
  _p4a = ATLtoASL _p4;
  _p5a = ATLtoASL _p5;
  _p6a = ATLtoASL _p6;
  _p7a = ATLtoASL _p7;
  _p8a = ATLtoASL _p8;  
  
  if (lineIntersects [_p1a,_p2a]) then 
  {
	drawLine3D [_p1 ,_p2, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p1 ,_p2, [0,1,0,1]];   
  };
  if (lineIntersects [_p2a,_p3a]) then 
  {
	drawLine3D [_p2 ,_p3, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p2 ,_p3, [0,1,0,1]];   
  };
  if (lineIntersects [_p3a,_p4a]) then 
  {
	drawLine3D [_p3 ,_p4, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p3 ,_p4, [0,1,0,1]];   
  };
  if (lineIntersects [_p4a,_p1a]) then 
  {
	drawLine3D [_p4 ,_p1, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p4 ,_p1, [0,1,0,1]];   
  };
  if (lineIntersects [_p5a,_p6a]) then 
  {
	drawLine3D [_p5 ,_p6, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p5 ,_p6, [0,1,0,1]];   
  };
  if (lineIntersects [_p6a,_p7a]) then 
  {
	drawLine3D [_p6 ,_p7, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p6 ,_p7, [0,1,0,1]];   
  };
  if (lineIntersects [_p7a,_p8a]) then 
  {
	drawLine3D [_p7 ,_p8, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p7,_p8, [0,1,0,1]];   
  };
  if (lineIntersects [_p8a,_p5a]) then 
  {
	drawLine3D [_p8,_p5, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p8,_p5, [0,1,0,1]];   
  };
  if (lineIntersects [_p3a,_p5a]) then 
  {
	drawLine3D [_p3 ,_p5, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p3 ,_p5, [0,1,0,1]];   
  };
  if (lineIntersects [_p2a,_p8a]) then 
  {
	drawLine3D [_p2 ,_p8, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p2 ,_p8, [0,1,0,1]];   
  };
  if (lineIntersects [_p1a,_p7a]) then 
  {
	drawLine3D [_p1 ,_p7, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p1,_p7, [0,1,0,1]];   
  };
  if (lineIntersects [_p4a,_p6a]) then 
  {
	drawLine3D [_p4,_p6, [1,0,0,1]]; 
	INTEROBJ = true;
  }else{
	drawLine3D [_p4,_p6, [0,1,0,1]];   
  };  
  
  }]; 

FURNUP = (findDisplay 46) displayAddEventHandler ["KeyDown","_shift =_this select 2;if((_this select 1) == 201) then { 
  if (_shift) then {
  _dir = (getDir life_furnObj);
  _dir = _dir + 10; 
  _dirP = getDir player;
  _dir = _dir - _dirP; 
  life_furnObj setDir _dir;
}else{
  _dir = (getDir life_furnObj);
  _dir = _dir + 1; 
  _dirP = getDir player;
  _dir = _dir - _dirP; 
  life_furnObj setDir _dir;
};};"];  
FURNDOWN = (findDisplay 46) displayAddEventHandler ["KeyDown","_shift =_this select 2;if((_this select 1) == 209) then { 
  if (_shift) then {
  _dir = (getDir life_furnObj);
  _dir = _dir - 10; 
  _dirP = getDir player;
  _dir = _dir - _dirP; 
  life_furnObj setDir _dir;
}else{
  _dir = (getDir life_furnObj);
  _dir = _dir - 1; 
  _dirP = getDir player;
  _dir = _dir - _dirP; 
  life_furnObj setDir _dir;
};};"];  
hint format["POSIZIONA MOBILI \n\n PAG UP: RUOTA + 1\n PAG DOWN: RUOTA - 1\n Shift + PAG UP: RUOTA + 10\n Shift + PAG DOWN: RUOTA - 10 \n Posiziona il mobile tramite la rotella del mouse;"];  
life_action_furnDeploy = player addAction["Posiziona",life_fnc_placeFurniture,[_obj,_house,1],999,false,false,"",'!isNull life_furnObj && !(INTEROBJ)'];
waitUntil {isNull life_furnObj};
removemissioneventhandler ["Draw3D",DRAW3DEVENT];
(findDisplay 46) displayRemoveEventHandler ['KeyDown',FURNUP];
(findDisplay 46) displayRemoveEventHandler ['KeyDown',FURNDOWN];
if(!isNil "life_action_furnDeploy") then {player removeAction life_action_furnDeploy;};
if(isNull _obj) exitWith {life_furnObj = ObjNull;};


