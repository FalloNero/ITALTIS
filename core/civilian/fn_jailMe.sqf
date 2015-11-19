/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };
life_bail_action = player addAction["Paga Cauzione",life_fnc_postBail,"",0,false,false,"",' isNil "life_canpay_bail" && life_is_arrested '];
if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep (10 * 60);
	}
		else
	{
		sleep (5 * 60);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(player distance (getMarkerPos "fed_jail_marker") > 100) exitWith {
		_esc = true;
	};
	
	if(life_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
		player removeaction life_bail_action ;
		if (isNil "Jail_OldUniform") then 
		{
			removeUniform player;
		}else{
			player addUniform Jail_OldUniform;
		};
		[5] call SOCK_fnc_updatePartial;	
		sleep 10;
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format[localize "STR_Jail_EscapeNOTF",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		player removeaction life_bail_action ;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		  //ticket da pagare una volta che si esce di prigione, circa il 10% del conto in banca
        _bankticket = (life_atmcash / 10);
        life_atmcash = life_atmcash - _bankticket;
		
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		player setPos (getMarkerPos "jail_release");
		[[player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;	
		if (isNil "Jail_OldUniform") then 
		{
			removeUniform player;
		}else{
			player addUniform Jail_OldUniform;
		};
		[] spawn life_fnc_payForfeit;
		[1] call life_fnc_removeLicenses;
		[5] call SOCK_fnc_updatePartial;
		player removeaction life_bail_action ;
		_position = [1,1,1];
		[8,_position] call SOCK_fnc_updatePartial;
		sleep 10;
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
};