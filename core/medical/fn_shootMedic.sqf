/*
	SCRIPT CHE DOVREBBE DIRCI SE SPARANO AD UN MEDICO E TOGLIERE l'ARMA AL GIOCATORRE CHE HA SPARATO

*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true;};

if(_shooter isKindOf "Man" && alive player) then
{
		// [[player],"life_fnc_removeWeapons",_shooter,false] spawn life_fnc_MP;
		// [[0,format["%2 ha sparato al medico: %1", _unit getVariable["realname",name _unit], _shooter getVariable["realname",name _shooter]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		//sleep 20;
		//_unit allowDamage true;
}else{
	_unit allowDamage true;
};