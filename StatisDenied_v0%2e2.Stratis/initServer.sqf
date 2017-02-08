["Initialize", [true]] call BIS_fnc_dynamicGroups;

addMissionEventHandler ['HandleDisconnect',{deleteVehicle (_this select 0);}]; //Delete bodies upon disconnect

execVM "objectives\briefing.sqf";