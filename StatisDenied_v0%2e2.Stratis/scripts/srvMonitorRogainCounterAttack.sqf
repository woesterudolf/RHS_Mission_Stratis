if !(isServer) exitWith {};

_run = true;
_numUnitsInGroup = count (units grpRogainCounterAttack);
_grpMin = _numUnitsInGroup / 4;
_completed = false;

while (_run) do
{
	if ((count (units grpRogainCounterAttack) < _grpMin) && canMove rogainTruck) then {_completed = true;};
	if (count (units grpRogainCounterAttack) < 1) then {_completed = true;};
	if (_completed) then
	{
		_run = false;
		//radioCounterStatus = "destroyed";
		//publicVariable "radioCounterStatus";
		_nul = execVM "objectives\tasks\task12Success.sqf";
	};
	sleep 4;
};