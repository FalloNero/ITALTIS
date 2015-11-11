////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////

	private ["_target", "_isPlayerUnconscious", "_isDragged"];

	_target = _this select 0;
	_return = false;
	_isPlayerUnconscious = player getVariable "FAR_isUnconscious";

	if( !alive player || _isPlayerUnconscious == 1 || FAR_isDragging || isNil "_target" || !alive _target || (_target distance player) > 2 ) exitWith
	{
		_return;
	};

	// Target of the action
	_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
	_isDragged = _target getVariable ["FAR_isDragged",0];

	if(_isTargetUnconscious == 1 && _isDragged == 0) then
	{
		_return = true;
	};

	_return
