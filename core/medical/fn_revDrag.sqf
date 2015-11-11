////////////////////////////////////////////////
// Drag Injured Player
////////////////////////////////////////////////
	private ["_target", "_id"];

	FAR_isDragging = true;

	_target = _this select 0 ;

	//player playMoveNow "AcinPknlMstpSrasWrflDnon";

	_target setVariable["Escorting",TRUE,TRUE];
	player playAction "grabDrag";

	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;
	//_target setPos getPos _target;
	// Rotation fix

	_target setVariable ["FAR_isDragged", 1, true];
	FAR_isDragging_EH = _target;
	[[FAR_isDragging_EH,180],"life_fnc_setDirection",FAR_isDragging_EH,FALSE] spawn life_fnc_MP;
	//publicVariable "FAR_isDragging_EH";

	// Add release action and save its id so it can be removed
	_id = player addAction ["<t color=""#C90000"">" + "Lascia" + "</t>", life_fnc_revRelease,[player], 10, true, true, "", "true"];
	_id2 = player addAction ["<t color=""#C90000"">" + "Posiziona nel veicolo" + "</t>", life_fnc_revPutIn, [FAR_isDragging_EH], 9, false, true, "", "call life_fnc_CheckPutIn"];

	hint "Premi C se non riesci a muoverti";

	// Wait until release action is used || player getVariable "IStazed" == 1 
	waitUntil
	{
		!alive player || player getVariable "FAR_isUnconscious" == 1 ||!alive _target || life_istazed || _target getVariable "FAR_isUnconscious" == 0 || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0
	};

	// Handle release action
	FAR_isDragging = false;
	player playMove "amovpknlmstpsraswrfldnon";

	if (!isNull _target && alive _target) then
	{
		//FAR_isDragging_EH switchMove "AinjPpneMstpSnonWrflDnon";
		[[FAR_isDragging_EH,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",FAR_isDragging_EH,FALSE] spawn life_fnc_MP;
		FAR_isDragging_EH setVariable ["FAR_isDragged", 0, true];
		FAR_isDragging_EH setVariable["Escorting",FALSE,TRUE];
		detach FAR_isDragging_EH;
	};

	player removeAction _id;
	player removeAction _id2;
