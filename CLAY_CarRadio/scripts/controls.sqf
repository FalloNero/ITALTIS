
disableSerialization;
CLAY_RadioEndTimer = true;

switch (_this select 0) do
{
	case "play":
	{
		If (count CLAY_RadioPlayList == 0) exitWith {Hint "Keine Musik in der Playlist";};

		If (CLAY_RadioPlaying) Then
		{
			CLAY_RadioPlaying = false;
			playMusic "";
			ctrlSetText [626, ">"];
		}
		Else
		{
			CLAY_RadioPlaying = true;
			ctrlSetText [626, "||"];

			_act = CLAY_RadioPlayList select CLAY_RadioTrack;
			_track = _act select 0;
			_title = _act select 1;
			_t = _act select 2;

			[_t] execVM "CLAY_CarRadio\scripts\play.sqf";

			playMusic _track;
			ctrlSetText [610, _title];
			If (!dialog) Then {titletext [format ["%1", _title], "PLAIN DOWN"];};
		};
	};
	case "pre":
	{
		If (count CLAY_RadioPlayList == 0) exitWith {Hint "Keine Musik in der Playlist";};

		private ["_act"];
		If (CLAY_RadioRandom) Then
		{
			_rnd = floor (random (count CLAY_RadioPlayList));
			_act = CLAY_RadioPlayList select _rnd;
			CLAY_RadioTrack = _rnd;
		}
		Else
		{
			CLAY_RadioTrack = CLAY_RadioTrack - 1;
			If (CLAY_RadioTrack < 0) Then
			{
				CLAY_RadioTrack = ((count CLAY_RadioPlayList) - 1);
			};
			_act = CLAY_RadioPlayList select CLAY_RadioTrack;
		};

		CLAY_RadioPlaying = true;
		ctrlSetText [626, "||"];

		_track = _act select 0;
		_title = _act select 1;
		_t = _act select 2;

		[_t] execVM "CLAY_CarRadio\scripts\play.sqf";
		ctrlSetText [610, _title];
		ctrlSetText [606, "0:00"];

		playMusic _track;
		If (!dialog) Then {titletext [format ["%1", _title], "PLAIN DOWN"];};
	};
	case "next":
	{
		If (count CLAY_RadioPlayList == 0) exitWith {Hint "Keine Musik in der Playlist";};

		private ["_act"];
		If (CLAY_RadioRandom) Then
		{
			CLAY_RadioPlaying = true;
			ctrlSetText [626, "||"];

			_rnd = floor (random (count CLAY_RadioPlayList));
			_act = CLAY_RadioPlayList select _rnd;
			CLAY_RadioTrack = _rnd;
			_track = _act select 0;
			_title = _act select 1;
			_t = _act select 2;

			[_t] execVM "CLAY_CarRadio\scripts\play.sqf";
			ctrlSetText [610, _title];
			ctrlSetText [606, "0:00"];

			playMusic _track;
			If (!dialog) Then {titletext [format ["%1", _title], "PLAIN DOWN"];};
		}
		Else
		{
			CLAY_RadioTrack = CLAY_RadioTrack + 1;
			If (CLAY_RadioTrack >= count CLAY_RadioPlayList) Then
			{
				CLAY_RadioTrack = 0;
				If ((_this select 1 == 1) || CLAY_RadioRepeat) Then
				{
					CLAY_RadioPlaying = true;
					ctrlSetText [626, "||"];

					_act = CLAY_RadioPlayList select CLAY_RadioTrack;
					_track = _act select 0;
					_title = _act select 1;
					_t = _act select 2;

					[_t] execVM "CLAY_CarRadio\scripts\play.sqf";
					ctrlSetText [610, _title];
					ctrlSetText [606, "0:00"];

					playMusic _track;
					If (!dialog) Then {titletext [format ["%1", _title], "PLAIN DOWN"];};
				}
				Else
				{
					CLAY_RadioPlaying = false;
					playMusic "";
					ctrlSetText [610, ""];
					ctrlSetText [626, ">"];
				};
			}
			Else
			{

				CLAY_RadioPlaying = true;
				ctrlSetText [626, "||"];

				_act = CLAY_RadioPlayList select CLAY_RadioTrack;
				_track = _act select 0;
				_title = _act select 1;
				_t = _act select 2;

				[_t] execVM "CLAY_CarRadio\scripts\play.sqf";
				ctrlSetText [610, _title];
				ctrlSetText [606, "0:00"];

				playMusic _track;
				If (!dialog) Then {titletext [format ["%1", _title], "PLAIN DOWN"];};
			};
		};
	};
};
