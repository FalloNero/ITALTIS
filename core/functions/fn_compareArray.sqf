/*
	Compares two Arrays
*/
private ["_array1", "_array2", "_i", "_return"];

_array1 = _this select 0;
_array2 = _this select 1;

_return = true;
if ( (count _array1) != (count _array2) ) then
{
	_return = false;
}
else
{
	_i = 0;
	while {_i < (count _array1) && _return} do
	{
		if ( (typeName (_array1 select _i)) != (typeName (_array2 select _i)) ) then
		{
			_return = false;
		}
		else
		{
			if (typeName (_array1 select _i) == "ARRAY") then
			{
				if (!([_array1 select _i, _array2 select _i] call _arrayCompare)) then
				{
					_return = false;
				};
			}
			else
			{
				if ((_array1 select _i) != (_array2 select _i)) then
				{
					_return = false;
				};
			};
		};
		_i = _i + 1;
	};
};

_return