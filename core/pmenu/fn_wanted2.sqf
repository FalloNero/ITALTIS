// fn_wanted2    CREA IL MENU E IL TESTO 

private["_unit","_amount"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hint "Nessuna selezione";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

[[1,format["%1 aggiunto alla lista ricercati da %2",_unit getVariable ["realname",name _unit],profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[1,format["%1 aggiunto alla lista ricercati da %2",_unit getVariable ["realname",name _unit],profileName]],"life_fnc_broadcast",east,false] spawn life_fnc_MP;
_text = format["%1 aggiunto alla lista ricercati da %2 -- %3 -- %4 ",_unit getVariable ["realname",name _unit],profileName,getPlayerUID _unit,_amount];
[[_text],"life_fnc_logging",false,false] spawn life_fnc_MP;
[[getPlayerUID _unit,name _unit,_amount],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;