/*version: 2016_10_23*/
private ["_marker","_markerNumber", "_markerName", "_getNextMarker","_vehicle", "_str", "_txt"];

if (isDedicated) exitWith {};

_getNextMarker = //Helping function to create or update position of the marker.
{
	private ["_marker"];
	
	_markerNumber = _markerNumber + 1;
	_marker = format["um%1",_markerNumber];
	
	if(getMarkerType _marker == "") then {createMarkerLocal [_marker, _this];} 
	else 										{_marker setMarkerPosLocal _this;};
	
	_marker;
};

while {true} do //The Main loop
{
	waitUntil {sleep 1;	(visibleMap or visibleGPS);}; //wait until map or gps is open
	_markerNumber = 0;
	
	_occupiedVics = [];	
	{
		_vehicle = vehicle _x; 			
		
		if(_vehicle != _x) then	//if the _x is in a vehicle create a listed names in there.
		{			
			if (!(_vehicle in _occupiedVics)) then {_occupiedVics pushBack _vehicle;};
		}
		else 
		{
			_pos = getPosATL _vehicle;
			_txt = name _x;
			_marker = _pos call _getNextMarker;				
			_colorName = "ColorBrown";
			_markerType = "mil_dot";
			_markerSize = 0.4;
			
			if ( _x in (units group player)) then 
			{
				_markerType = "mil_dot";
				
				if (_x == leader player) then 
				{						
					_markerType = "mil_circle";
					_markerSize = 0.5;
				};
				
				_stgi_color = assignedTeam _x;
				switch (_stgi_color) do
				{
					case "MAIN": 	{_colorName = "Default";};
					case "RED": 	{_colorName = "ColorRed";};
					case "GREEN": 	{_colorName = "ColorGreen";};
					case "BLUE": 	{_colorName = "ColorBlue";};
					case "YELLOW":	{_colorName = "ColorYellow";};
					default			{_colorName = "Default";};
				};
			}
			else
			{
				if (_x == (leader group _x)) then 
				{
					_markerType = "mil_box";
					_markerSize = 0.5;
					_txt = format["%1 [%2]", name(leader _x), groupID (group _x)];
				};						
			};
			
			if(!visibleGPS || visibleMap) then{_marker setMarkerTextLocal _txt;} else {_marker setMarkerTextLocal "";};
			
			_marker setMarkerColorLocal _colorName;
			_marker setMarkerTypeLocal _markerType;
			_marker setMarkerSizeLocal [_markerSize, _markerSize];
		};			
	} forEach playableUnits;
	
	{
		_aVic = _x;
		_str = ""; _txt = "";		

		{
			if(_foreachindex == ((count (crew (vehicle _x))) - 1)) then 
			{
				_str = format["%1",name _x];	
			} 	
			else 
			{ 
				_str = format["%1, ",name _x];
			};				
			_txt = _txt + _str;
		}forEach crew (_aVic);
		
		_pos = getPosATL _aVic;
		_marker = _pos call _getNextMarker;
		if(!visibleGPS || visibleMap) then{_marker setMarkerTextLocal _txt;} else {_marker setMarkerTextLocal "";};
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerSizeLocal [0.7, 0.7];
		_marker setMarkerTypeLocal "n_inf";
	}forEach _occupiedVics;	
	
	_markerNumber = _markerNumber + 1;
	_marker = format["um%1",_markerNumber];	
	
	while {(getMarkerType _marker) != ""} do 
	{	
		deleteMarkerLocal _marker;
		_markerNumber = _markerNumber + 1;
		_marker = format["um%1",_markerNumber];
	};		
};	
