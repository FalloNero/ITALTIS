private["_msg","_from", "_type"];
	if(!hasInterface) exitWith {};
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == "") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private["_message"];
			_message = format[">>>Nachricht von %1: %2",_from,_msg];
			hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			
			["TextMessage",[format["Du hast eine Nachricht von %1 erhalten",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 1 :
		{
			if(side player != west) exitWith {};
			private["_message"];
			_message = format["---POLIZEINOTRUF von %1: %2",_from,_msg];
			hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Neuer Polizeinotruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Beamten<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			
			["PoliceDispatch",[format["Neuer Polizeinotruf von: %1",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private["_message"];
			_message = format["???ADMIN REQUEST FROM %1: %2",_from,_msg];
			hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
			
			["AdminDispatch",[format["%1 Has Requested An Admin!",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 3 :
		{
			private["_message"];
			_message = format["!!!ADMIN Nachricht: %1",_msg];
			_admin = format["Von Admin: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];
			
			["AdminMessage",["Du hast eine Nachricht von einen Admin erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 4 :
		{
			private["_message","_admin"];
			_message = format["!!!ADMIN Nachricht: %1",_msg];
			_admin = format["Von Admin: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Die Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];
			
			["AdminMessage",["Du hast eine Nachricht von einen Admin erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 5 :
		{
			private["_message"];
			_message = format["---Polizeileitstelle %1: %2",_from,_msg];
			hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Polizeileitstelle<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			
			["PoliceDispatch",[format["Neue Nachricht der Polizeileitstelle: %1",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 6 :
		{
			if(life_fms_group != "Medic") exitWith {};
			private["_message"];
			_message = format["---Medizinischer Notfall %1: %2",_from,_msg];
			hint parseText format ["<t color='#FDFF30'><t size='2'><t align='center'>Medizinischer Notfall<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Sanitäter<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			
			["MedicDispatch",[format["Neuer Medizinischer Notfall: %1",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
	};