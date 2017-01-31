if !(isServer) exitWith {};

_run = true;
_numUnitsInGroup = count (units grpMikeCounterAttack);
_grpMin = _numUnitsInGroup / 4;
_completed = false;

while (_run) do
{
	if ((count (units grpMikeCounterAttack) < _grpMin) && canMove mikeTruck) then {_completed = true;};
	if (count (units grpMikeCounterAttack) < 1) then {_completed = true;};
	if (_completed) then
	{
		_run = false;
		//radioCounterStatus = "destroyed";
		//publicVariable "radioCounterStatus";
		_nul = execVM "objectives\tasks\task15Success.sqf";
	};
	sleep 4;
};