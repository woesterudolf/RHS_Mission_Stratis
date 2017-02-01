//in the trigger execVM "B\taskTransition1.sqf";
if(!isServer) exitWith{};

["Task1", "succeeded"] call FHQ_fnc_ttSetTaskState;