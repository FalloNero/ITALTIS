/*
	Author: Bryan "Tonic" Boardwine
	Edited: FROST
	Description:
	Fetches the nearest door of the building the player is looking at.
	
*/
private["_bank","_door","_pos","_worldSpace","_maxVectorAngle","_vectorPlayer","_selectionPos","_dist","_vectorObj","_vectorDotProduct","_vectorAngle"];
//_bank = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//_bank = nearestObject [[8254,6461.4531,0],"il_bank"];
_bank = fed_bank;
if(isNull _bank) exitWith {"0"};
if(!(_bank isKindOf "il_bank")) exitWith {"0"};


//ok ok allora sto calcolo di merda con i vettori previene la possibilità che si vada a selezionare la porta sbagliata 
//in quanto l'angolo massimo di scostamento tra oggetto e visuale del giocatore è impostata a 50 gradi
_maxVectorAngle = 50 ;
_vectorPlayer = vectorDir player;
_vectorPlayer set [2,0];
_vectorPlayer = vectorNormalized _vectorPlayer;
_door = "0";


for "_i" from 1 to 7 do {
	_selectionPos = _bank selectionPosition format["osa_h%1f",_i];
	_worldSpace = _bank modelToWorld _selectionPos;
	_dist = player distance _worldSpace ;
	if(player distance _worldSpace < 2) then
	{
		_worldSpace set [2,0];
		_pos = (getPos player);
		_pos set [2,0];
		_vectorObj = _pos vectorFromTo _worldSpace;
		_vectorObj set [2,0];
		_vectorObj = vectorNormalized _vectorObj ;
		_vectorDotProduct = _vectorPlayer vectorDotProduct _vectorObj;
		_vectorAngle = acos (_vectorDotProduct);
		if (_vectorAngle < _maxVectorAngle)exitWith{_door = format ["h%1f",_i];};
	};
};
for "_i" from 1 to 3 do {
	_selectionPos = _bank selectionPosition format["osa_b%1",_i];
	_worldSpace = _bank modelToWorld _selectionPos;
	if(player distance _worldSpace < 2) then 
	{
		_worldSpace set [2,0];
		_pos = (getPos player);
		_pos set [2,0];
		_vectorObj = _pos vectorFromTo _worldSpace;
		_vectorObj set [2,0];
		_vectorObj = vectorNormalized _vectorObj ;
		_vectorDotProduct = _vectorPlayer vectorDotProduct _vectorObj;
		_vectorAngle = acos (_vectorDotProduct);
		if (_vectorAngle < _maxVectorAngle)exitWith{_door = format ["b%1",_i];};
	};
};
for "_i" from 1 to 1 do {
	_selectionPos = _bank selectionPosition "osa_d8";
	_worldSpace = _bank modelToWorld _selectionPos;
	if(player distance _worldSpace < 3) exitWith {_door = format ["d8"];};
};
for "_i" from 1 to 1 do {
	_selectionPos = _bank selectionPosition "osa_dc_int";
	_worldSpace = _bank modelToWorld _selectionPos;
	if(player distance _worldSpace < 2) exitWith {_door = format ["dc_int"];};
};
for "_i" from 1 to 1 do {
	_selectionPos = _bank selectionPosition "osa_dc_ext";
	_worldSpace = _bank modelToWorld _selectionPos;
	if(player distance _worldSpace < 2) exitWith {_door = format ["dc_ext"];};
};

_door;
