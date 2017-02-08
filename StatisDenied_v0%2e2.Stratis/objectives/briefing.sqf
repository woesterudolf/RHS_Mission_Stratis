if(!isServer) exitWith{};

[     
    {true},        
        ["Task1",                                                                                   //Task ID
		"Destroy the guarding armored personnel carrier at the power station.",     					//Long Description
        "Search and Destroy",                                                                              //Task title in Briefing
        "Destroy",                                                                              //Task marker on map hover over text        getMarkerPos  "mrk_obj1",                                                                       //Location can be object or marker (OPTIONAL)
        objNull,                                                                       //Location can be object or marker (OPTIONAL)
        "created"                                                                                  //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)
        ]
] call FHQ_fnc_ttAddTasks;

[     
    {true},        
        ["Task2",                                                                                   //Task ID
        "Destroy the guarding main battle tank at the power station.",     					//Long Description
        "Search and Destroy",                                                                              //Task title in Briefing
        "Destroy",                                                                              //Task marker on map hover over text
        objNull,                                                                       //Location can be object or marker (OPTIONAL)
        "created"                                                                                  //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)
        ]
] call FHQ_fnc_ttAddTasks;

[     
    {true},        
        ["Task3",                                                                                   			//Task ID
        "Destroy the guarding main battle tank at the power station.",     					//Long Description
        "Search and Destroy",                                                                              //Task title in Briefing
        "Destroy",                                                                              //Task marker on map hover over text
        objNull,                                                                       //Location can be object or marker (OPTIONAL)
        "created"                                                                                  //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)
        ]
] call FHQ_fnc_ttAddTasks;

[     
    {true},        
        ["Task4",                                                                                   //Task ID
		"Destroy the guarding armored personnel carrier at the power station.",     					//Long Description
        "Search and Destroy",                                                                              //Task title in Briefing
        "Destroy",                                                                              //Task marker on map hover over text        getMarkerPos  "mrk_obj1",                                            
        objNull,                                                                       //Location can be object or marker (OPTIONAL)
        "created"                                                                                  //task state.  "created", "assigned", "succeeded", "failed", or "canceled". (OPTIONAL)
        ]
] call FHQ_fnc_ttAddTasks;

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[
{true}, // for all playable units
["Diary", "SITUATION", 
"You are part of a direct action armored task force heading to the power station installation on the NorthEasrtern Altis. Recent intel suggested increased activity near the AO forcing NATO to send in intercepting force."
],

["Diary", "MISSION", 
"Move into the AO and complete the tasks as stated. Destroy the guarding armors. Move in and capture the facility."
],

["Diary", "INTEL",
"UAV shows 2 pieces of main battle tanks and two mechanized squads guarding the facility. Infantry troops were dropped off yesterday to further garrison the facility along with AAA armors. Whatever they are doing, they are spending quite a bit of hardware to defend it."
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
"Mission by B for TacticalGamer community. Feel free to re-imagine, refine.
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
//MadSoloSniper - TGBanner graphics.
<br/>
<br/>
Champ - View Distance script.
<br/>
<br/>
Varanon - TaskTracker."
],
["Game-play Hints", "Group Manager",
"Team management script is in usage. To access: press team switch (Default: ""U"")."
],       

["Game-play Hints", "Squad Name-tags",
"Name-Tag script is active. Press NUMPAD DEL(.) (Keybinding: Tactical View) to see the names of your squad-mates. Leaders are able to other leaders as well."
]
] call FHQ_fnc_ttAddBriefing;