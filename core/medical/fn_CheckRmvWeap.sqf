////////////////////////////////////////////////
// Abilita l'opzione di loot armi sulle persone ferite
////////////////////////////////////////////////

	private["_unit","_unconscious","_loot"];
	_unit = _this select 0 ;
	_return = false ;
	if(isNull _unit OR !isPlayer _unit) then
	{
		_return = false;
	};
	if ((_unit distance player) > 2) exitWith {_return;};
	_unconscious = (_unit getVariable "FAR_isUnconscious");
	_loot = (_unit getVariable "looted");
	if (_unconscious == 1 && _loot == 0) then
	{
		_return = true;
	};
	_return
