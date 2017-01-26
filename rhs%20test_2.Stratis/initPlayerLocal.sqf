waituntil {!isnull player};

[] spawn TG_fnc_squadUI;
[] spawn TG_fnc_drag;
call TG_fnc_earplugs;

//-------------------------------------------Group--------------------------------------------------------
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

//-----------------------------UAV start---------------------------------
_color = EAST call BIS_fnc_sideColor;
0 = [
		player, 
		"US forces are staging for an assault on Stratis...",
		300,
		nil,
		270,
		1,
		[
			["\a3\ui_f\data\map\markers\nato\o_inf.paa", _color, player, 1, 1, 0, "Kamino Firing Range", 0]
		]
	] spawn BIS_fnc_establishingShot;