/*
	Collegato al trigger crea il dialogo che mostra il tempo restante al blocco della banca
*/
_blockTime = 20 * 60 ;
waitUntil {hackTime != 0};
_timer = hackTime + _blockTime ;

while {true} do
{
	_countDown = [(_timer - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
	if((player distance fed_bank) < 20) then  
	{
		if ((_timer - time) < 300) then
		{
			hintSilent parseText format["Blocco di sicurezza<br/><br/>Tempo restante:<br/> <t color='#FF0000'> %1 <\t> <br/>",_countDown];
		}else{
			hintSilent format["Blocco di sicurezza\n\nTempo restante:\n %1 \n\n",_countDown];
		};
	};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
	sleep 0.1;
};

hintSilent "";