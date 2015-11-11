/*
	CONTROLLA SE IL PLAYER E' DROGATO
*/

private["_civ","_inv","_drug"];

_civ = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _civ) exitWith {};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Impossibile effetuare test su %1", _civ getVariable["realname",name _civ]]};
hint "Test droghe..";
_inv = "1";
life_action_inUse = true;

if (_civ getVariable "drug_lsd") then
{
	//[0,format["%1 ha assunto LSD",(_civ getVariable["realname",name _civ])],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	_inv = _inv + "LSD<br/>";
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"45"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};

if (_civ getVariable "drug_cocaine") then
{
	//[0,format["%1 ha assunto COCAINA",(_civ getVariable["realname",name _civ])],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	_inv = _inv + "COCAINA<br/>";
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"45"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};

if (_civ getVariable "drug_weed") then
{
	//[0,format["%1 ha assunto CANNABIS",(_civ getVariable["realname",name _civ])],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	_inv = _inv + "CANNABIS<br/>";
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"45"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
if (_inv != "1") then
{
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Droghe assunte</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'></t>"
,(_civ getVariable["realname",name _civ]),_inv];
}else{
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Droghe assunte</t></t><br/>Test droghe assunte negativo<br/><br/><br/><br/><t color='#FF0000'></t>"
,(_civ getVariable["realname",name _civ])];
};
life_action_inUse = false;

