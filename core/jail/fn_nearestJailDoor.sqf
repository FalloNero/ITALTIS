private["_jail","_door","_dist","_worldSpace","_selectionPos"];
//_jail = fed_jail;
//if(isNull _jail) exitWith {["0",[0,0,0]]};
// XXX if(!(_jail isKindOf "armat_jail2")) exitWith {["0",[0,0,0]]};

//Q_Q
//_jail1 = [-4.7,8,0];
//_jail2 = [-4.7,3.5,0];
//_jail3 = [-4.7,-1,0];
//_jail4 = [-4.7,-5.5,0];
//_jail5 = [4.7,-5.5,0];
//_jail6 = [4.7,-1,0];
//_jail7 = [4.7,3.5,0];
//_jail8 = [4.7,8,0];
//_jail9 = [-4.7,8,2];
//_jail10 = [-4.7,3.5,2];
//_jail11 = [-4.7,-1,2];
//_jail12 = [-4.7,-5.5,2];
//_jail13 = [4.7,-5.5,2];
//_jail14 = [4.7,-1,2];
//_jail15 = [4.7,3.5,2];
//_jail16 = [4.7,8,2];
//_jail17 = [-4.7,8,5];
//_jail18 = [-4.7,3.5,5];
//_jail19 = [-4.7,-1,5];
//_jail20 = [-4.7,-5.5,5];
//_jail21 = [4.7,-5.5,5];
//_jail22 = [4.7,-1,5];
//_jail23 = [4.7,3.5,5];
//_jail24 = [4.7,8,5];

//_door = ["0",[0,0,0]];

for "_i" from 1 to 24 do {
	_cell = call compile format ["_jail%1",_i];
	_worldSpace = _jail modelToWorld _cell;
	_dist = player distance _worldSpace ;
	if(_dist < 2) exitWith {if (_cell select 0 < 0)then {_cell set [0,(_cell select 0)-1];_door = [format ["celldoor%1",_i],_cell]}else{_cell set [0,(_cell select 0)+1];_door = [format ["celldoor%1",_i],_cell]};};
};

_selectionPos = _jail selectionPosition "osa_controlmaindoor";
_worldSpace = _jail modelToWorld _selectionPos;
if(player distance _worldSpace < 3) then {_door = ["maindoorl",[0,0,0]]};

_door