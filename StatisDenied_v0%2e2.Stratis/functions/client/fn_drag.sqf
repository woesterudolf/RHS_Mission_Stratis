/********************************************
TG Drag: 2016_10_20
			
Credits:
	Naong for INS revive system
	Farooq for FAR revive system
	Monsoon for SRS revive system
	Psychobastard for A3 Wounding System
	
	|TG| B for fusion of the three systems and 
		squashing existing bugs as well as add 
		enhancements
*********************************************/

FAR_isDragging = false;
FAR_isDragging_EH = [];

if (isDedicated) exitWith {};

FAR_Player_Actions = {
	if (alive player && player isKindOf "Man") then 
	{
		player addAction ["<t color=""#0000FF"">" + "Drag" + "</t>", "call FAR_handleAction", ["action_drag"], 9, false, true, "", "call FAR_Check_Dragging"];
	};
};

FAR_handleAction = {
	private ["_params", "_action"];

	// Parameters passed by the action
	_params = _this select 3;
	_action = _params select 0;

	////////////////////////////////////////////////
	// Handle actions
	////////////////////////////////////////////////
	if (_action == "action_drag") then
	{	
		[cursorTarget] spawn FAR_Drag;
	};

	if (_action == "action_release") then
	{
		[] spawn FAR_Release;
	};	
};

INS_REV_FNCT_remote_exec = {
	private ["_unit", "_command", "_parameter"];
	_unit = _this select 1 select 0;
	_command = _this select 1 select 1;
	_parameter = _this select 1 select 2;
	
	if (_command == "switchMove") exitWith {
		_unit switchMove _parameter;
	};
	if (_command == "allowDamage") exitWith {
		if (_parameter) then {
			_unit allowDamage true;
			_unit setCaptive false;
		} else {
			_unit allowDamage false;
			_unit setCaptive true;
		};
	};
	
	if (local _unit) then 
	{
		switch (_command) do
		{
			case "switchMove":	{_unit switchMove _parameter;};
			case "setDir":		{_unit setDir _parameter;};
			case "playMove":	{_unit playMove _parameter;};
			case "playMoveNow":	{_unit playMoveNow _parameter;};
		};
	};
};
"INS_REV_GVAR_remote_exec" addPublicVariableEventHandler INS_REV_FNCT_remote_exec;

// Switch move
// Usage : '[_unit, _move] call INS_REV_FNCT_switchMove;'
INS_REV_FNCT_switchMove = {
	private ["_unit","_move"];
	
	_unit = _this select 0;
	_move = _this select 1;
	
	//_unit switchMove _move;
	//processInitCommands;
	INS_REV_GVAR_remote_exec = [_unit, "switchMove", _move];
	publicVariable "INS_REV_GVAR_remote_exec";
	["INS_REV_GVAR_remote_exec", INS_REV_GVAR_remote_exec] spawn INS_REV_FNCT_remote_exec;
};

// Set dir
// Usage : '[_unit, _value] call INS_REV_FNCT_setDir;'
INS_REV_FNCT_setDir = {
	private ["_unit","_dir"];
	_unit = _this select 0;
	_dir = _this select 1;
	
	INS_REV_GVAR_remote_exec = [_unit, "setDir", _dir];
	publicVariable "INS_REV_GVAR_remote_exec";
	["INS_REV_GVAR_remote_exec", INS_REV_GVAR_remote_exec] spawn INS_REV_FNCT_remote_exec;
};

// Play move
// Usage : '[_unit, _move] call INS_REV_FNCT_playMoveNow;'
INS_REV_FNCT_playMove = {
	private ["_unit","_move"];
	_unit = _this select 0;
	_move = _this select 1;
	
	INS_REV_GVAR_remote_exec = [_unit, "playMove", _move];
	publicVariable "INS_REV_GVAR_remote_exec";
	["INS_REV_GVAR_remote_exec", INS_REV_GVAR_remote_exec] spawn INS_REV_FNCT_remote_exec;
};

// Play move now
// Usage : '[_unit, _move] call INS_REV_FNCT_playMoveNow;'
INS_REV_FNCT_playMoveNow = {
	private ["_unit","_move"];
	_unit = _this select 0;
	_move = _this select 1;
	
	INS_REV_GVAR_remote_exec = [_unit, "playMoveNow", _move];
	publicVariable "INS_REV_GVAR_remote_exec";
	["INS_REV_GVAR_remote_exec", INS_REV_GVAR_remote_exec] spawn INS_REV_FNCT_remote_exec;
};

FAR_Drag_prone = {
	private ["_target", "_id"];
	_wrong_moves = ["helper_switchtocarryrfl","acinpknlmstpsraswrfldnon_amovppnemstpsraswrfldnon","acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon","acinpercmrunsraswrfldnon","acinpercmrunsraswrfldf"];
	_prone_moves = ["amovppnemstpsraswrfldnon","amovppnemrunslowwrfldf","amovppnemsprslowwrfldfl","amovppnemsprslowwrfldfr","amovppnemrunslowwrfldb","amovppnemsprslowwrfldbl","amovppnemsprslowwrfldr","amovppnemstpsraswrfldnon_turnl","amovppnemstpsraswrfldnon_turnr","amovppnemrunslowwrfldl","amovppnemrunslowwrfldr","amovppnemsprslowwrfldb","amovppnemrunslowwrfldbl","amovppnemsprslowwrfldl","amovppnemsprslowwrfldbr"];
		
	_target = _this select 0;
	
	FAR_isDragging = true;
	
	// Attach player to injured
	_target attachTo [player, [0, 1.5, 0.092]];	
	[_target, 180] call INS_REV_FNCT_setDir;	
	_target setVariable ["FAR_isDragged", 1, true];	
	
	//[_target, "AinjPpneMstpSnonWrflDnon"] call INS_REV_FNCT_playMoveNow; //might be the culprit.
	
	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";
	
	INS_REV_FNCT_drag_prone_keydown = {
	if ((_this select 1) in (actionKeys "moveForward" + actionKeys "moveFastForward")) exitWith {true};
		false
	};

	// Add KeyDown event handler
	INS_REV_GVAR_keydown_event = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call INS_REV_FNCT_drag_prone_keydown"];
	
	// Add release action and save its id so it can be removed
	_id = player addAction ["<t color=""#0000FF"">" + "Release" + "</t>", "call FAR_handleAction", ["action_release"], 10, true, true, "", "true"];	
	
	// Wait until release action is used or dragger goes unconscious or draggee wakes up or dragger stands up or crouches up.
	waitUntil 
	{ 
		!alive player 							|| 
		lifeState player == "INCAPACITATED" 	|| 
		!alive _target 						|| 
		lifeState _target != "INCAPACITATED" 	|| 
		!FAR_isDragging 						|| 
		_target getVariable "FAR_isDragged" == 0||
		!(animationState player in _prone_moves)		
	};

	// Handle release action
	FAR_isDragging = false;
	
	if (!isNull _target && alive _target) then
	{
		_target switchMove "AinjPpneMstpSnonWrflDnon"; //animation after being released.
		_target setVariable ["FAR_isDragged", 0, true];
		detach _target;
	};
	
	player removeAction _id;
	
	// Finish dragging
	if !(isNull player) then 
	{		
		if (alive player && lifeState player != "INCAPACITATED") then 
		{
			// If player stand up, terminate move
			if ((animationState player) in _wrong_moves) then 
			{
				while {(animationState player) in _wrong_moves} do 
				{
					[player, "amovppnemstpsraswrfldnon"] call INS_REV_FNCT_switchMove;
					sleep 0.5;
				};
			};			
		};
	};

	//Remove the key event handler
	if (!isNil {INS_REV_GVAR_keydown_event}) then 
	{
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", INS_REV_GVAR_keydown_event];
	};	
	INS_REV_GVAR_keydown_event = nil;
};

FAR_Drag = {
	private ["_target", "_id"];
		
	_target = _this select 0;	
	
	_prone_moves = ["amovppnemstpsraswrfldnon","amovppnemrunslowwrfldf","amovppnemsprslowwrfldfl","amovppnemsprslowwrfldfr","amovppnemrunslowwrfldb","amovppnemsprslowwrfldbl","amovppnemsprslowwrfldr","amovppnemstpsraswrfldnon_turnl","amovppnemstpsraswrfldnon_turnr","amovppnemrunslowwrfldl","amovppnemrunslowwrfldr","amovppnemsprslowwrfldb","amovppnemrunslowwrfldbl","amovppnemsprslowwrfldl","amovppnemsprslowwrfldbr"];
	_wrong_moves = ["helper_switchtocarryrfl","acinpknlmstpsraswrfldnon_amovppnemstpsraswrfldnon","acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon","acinpercmrunsraswrfldnon","acinpercmrunsraswrfldf"];
	// If while prone call something else and exit
	if (animationState player in _prone_moves) exitWith 
	{
		_this spawn FAR_Drag_prone;
	};
	
	FAR_isDragging = true;
	
	_target attachTo [player, [0, 1.1, 0.092]];
	_target setDir 180;
	_target setVariable ["FAR_isDragged", 1, true];
	
	player playMoveNow "AcinPknlMstpSrasWrflDnon";
	
	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";
	
	// Add release action and save its id so it can be removed
	_id = player addAction ["<t color=""#0000FF"">" + "Release" + "</t>", "call FAR_handleAction", ["action_release"], 10, true, true, "", "true"];
	
	hint "Press 'C' if you can't move.";		
	
	// Wait until release action or carry action is used
	waitUntil 
	{ 
		!alive player || lifeState player == "INCAPACITATED" || !alive _target || lifeState cursorTarget != "INCAPACITATED" || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0
	};	
	
	// Handle release action
	FAR_isDragging = false;
	
	if (!isNull _target && alive _target) then
	{
		_target switchMove "AinjPpneMstpSnonWrflDnon";
		_target setVariable ["FAR_isDragged", 0, true];
		detach _target;
	};
	
	player removeAction _id;
	
	// Finish dragging
	if !(isNull player) then {
		// If player is dead, terminate move
		if (!alive player || lifeState player != "INCAPACITATED") then 
		{
			[player, "AmovPknlMstpSrasWrflDnon"] call INS_REV_FNCT_switchMove;
		} 
		else 
		{
			// If player stand up, terminate move
			if ((animationState player) in _wrong_moves) then 
			{
				while {(animationState player) in _wrong_moves} do 
				{
					[player, "AmovPknlMstpSrasWrflDnon"] call INS_REV_FNCT_switchMove;
					sleep 0.5;
				};
			} 
			else 
			{
				player playMoveNow "AmovPknlMstpSrasWrflDnon";
			};
		};
	};		
};


FAR_Release = {
	FAR_isDragging = false;
};

FAR_public_EH = {
	if(count _this < 2) exitWith {};
	
	_EH  = _this select 0;
	_target = _this select 1;

	// FAR_isDragging
	if (_EH == "FAR_isDragging_EH") then
	{
		_target setDir 180;
	};
};

FAR_Check_Dragging = {
	private ["_target", "_isDragged"];
	
	_return = false;
	_target = cursorTarget;


	if(FAR_isDragging || isNil "_target" || !alive _target || !isPlayer _target || (_target distance player) > 2 ) exitWith
	{
		_return;
	};
	
	// Target of the action
	_isDragged = _target getVariable "FAR_isDragged"; 
	
	if(lifeState cursorTarget == "INCAPACITATED" && _isDragged == 0) then
	{
		_return = true;
	};
		
	_return
};

FAR_Player_Init = {		
	player addEventHandler 
	[
		"Killed",
		{
			// Remove dead body of player (for missions with respawn enabled)
			_body = _this select 0;
			
			[player, [missionnamespace, "VirtualInventory"]] call BIS_fnc_saveInventory;
			
			[_body] spawn 
			{			
				waitUntil { alive player };
				_body = _this select 0;
				deleteVehicle _body;
			}
		}
	];

	[player, [missionnamespace, "VirtualInventory"]] call BIS_fnc_loadInventory;
	
	player setVariable ["FAR_isDragged", 0, true];	

	FAR_isDragging = false;	
	
	[] spawn FAR_Player_Actions;
};

////////////////////////////////////////////////
// Main function which controls the whole thing.
////////////////////////////////////////////////
[] spawn {
    waitUntil { !isNull player };

	// Public event handlers
	"FAR_isDragging_EH" addPublicVariableEventHandler FAR_public_EH;	
	
	[] spawn FAR_Player_Init;

	// Event Handlers
	player addEventHandler 
	[
		"Respawn", 
		{			
			[] spawn FAR_Player_Init;
		}
	];
};