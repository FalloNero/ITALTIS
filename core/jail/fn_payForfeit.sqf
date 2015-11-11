/*
	File: fn_payForfait.sqf
	Author: TUO PADRE
	
	Description:
	Called when the player is released from jail
*/
private["_unit","_forfeit"];
if(life_atmcash < 10000) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
_forfeit = life_bail_amount;
_bperc = floor ((_forfeit * 50) / 100);

_forfeit = floor((_forfeit / 100) * 5);	

_atmcash = life_atmcash + 10000;

if (_atmcash > _forfeit) then
{
	life_atmcash = life_atmcash - _forfeit;
	hint format ["Sono stati rimossi $%1 dal tuo conto bancario per spese processuali",_forfeit];
}else{
	_forfeit = (life_atmcash - 10000);
	life_atmcash = 10000;
	hint format ["Sono stati rimossi $%1 dal tuo conto bancario per spese processuali",_forfeit];
};


