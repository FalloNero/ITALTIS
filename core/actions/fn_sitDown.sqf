//////////////////////////////////////////////////////////////////////////
//                            Script Made By                            //
//                                MacRae                                //
//                                                                      //
//                                                                      //
//1.Place a Camping Chair on the map.                                   //
//                                                                      //
//2.Add this to the Camping chair Init:                                 //
//this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf"]//
//                              4D6163526165                            //
//////////////////////////////////////////////////////////////////////////


if(life_sitting) then{
    player switchMove "";
    life_sitting = false;
} else {
    _chair = cursorTarget;
    _unit = player;

    [[_unit, "Crew"], "life_fnc_executeAnim"] spawn BIS_fnc_MP; 
    _unit setPosATL (getPosATL _chair); 
    _unit setDir ((getDir _chair) - 180); 
    _unit setposATL [getPosATL _unit select 0, getPosATL _unit select 1,((getPosATL _unit select 2) +1)];
    life_sitting = true;
};


