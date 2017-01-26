sepa = 
["<t color='#ffff33'>Put on ear plugs</t>",
		{	
			_i = _this select 2;
			if (soundVolume == 1) then 
			{
				hintSilent "Putting earplugs in....";
				2 fadeSound 0.35;
				player setUserActionText [_i,"<t color='#ffff33'>Take off ear plugs</t>"];
			} 
			else 
			{
				hintSilent "Taking earplugs out...";
				2 fadeSound 1;
				player setUserActionText [_i,"<t color='#ffff33'>Put on ear plugs</t>"];
			}
		},
		[],
		-90,
		false,
		true,
		"",
		"_target == vehicle player"
];

player addAction sepa;
player addEventHandler 
[
	"Respawn",
	{
		2 fadeSound 1;
		player addAction sepa;
	}
];