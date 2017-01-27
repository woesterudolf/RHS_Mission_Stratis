if(!isServer) exitWith{};

[     
    {true},        
        ["Task1", //Task ID
		"Complete Phase 1.", //Long Description        
		"Phase 1",//Task title in Briefing			
		"Phase 1",//Task marker on map hover over text
		objNull,//Location can be object or marker (OPTIONAL)	
		"created", //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)		
		"move1" //icon. https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
		],
		
			[["Task1_1", "Task1"],//Task ID
			"Kamino Firing range",//Long Description
			"Kamino",//Task title in Briefing
			"Destroy",//Task marker on map hover over text
			objNull,//Location can be object or marker (OPTIONAL)
			"created",//task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)
			"attack" //icon. https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
			],
				[["Task1_1_1", "Task1_1"],//Task ID
				"Kamino Firing range",//Long Description
				"Kamino",//Task title in Briefing
				"Destroy",//Task marker on map hover over text
				objNull,//Location can be object or marker (OPTIONAL)
				"created",//task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)
				"attack" //icon. https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
				],
				
		["Task2", //Task ID
		"Complete Phase 2.", //Long Description        
		"Phase 2",//Task title in Briefing			
		"Phase 2",//Task marker on map hover over text
		objNull,//Location can be object or marker (OPTIONAL)	
		"created", //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)		
		"move2" //icon. https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
		],
		
		["Task3", //Task ID
		"Complete Phase 3.", //Long Description        
		"Phase 3",//Task title in Briefing			
		"Phase 3",//Task marker on map hover over text
		objNull,//Location can be object or marker (OPTIONAL)	
		"created", //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)		
		"move3" //icon. https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul
		]
] call FHQ_fnc_ttAddTasks;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[
{true}, // for all playable units
["Diary", "SITUATION", 
"Situation briefing here."
],

["Diary", "MISSION", 
"Describe the mission here"
],

["Diary", "INTEL",
"Any kind of Intel?"
],

["Diary", "Win/Lose",
"Win condition: Complete the objectives within the time frame.
<br/>
<br/>
Loss condition: Run out of time: 45 minutes.
<br/>
<br/>
Loss condition: Lose both of the friendly tanks.
<br/>
<br/>
Loss condition: Casualty number exceeds allowed tickets (30)."
],
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Credits", "Mission by", 
"Mission by TacticalGamer projects team for TacticalGamer.com community.
<br/>
<br/>
Unkl, B, CapShawn, DMZ_Scount, BadStache, woesterrudolf, Xorriliz... who else?
<br/>
<br/>
Check out our forums for more information as we provide the best teamplay friendly environment.
<br/>
<br/>
http://www.tacticalgamer.com"
],
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Credits", "Thanks to", 
"TG|Toptonic-Butler - name tag script.
<br/>
<br/>
MadSoloSniper - TGBanner graphics.
<br/>
<br/>
Champ - View Distance script.
<br/>
<br/>
Varanon - TaskTracker."
],
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Game-play Hints", "Group Manager",
"Team management script is in usage. To access: press team switch (Default: ""U"")."
]
] call FHQ_fnc_ttAddBriefing;