Private ["_OffroadAway","_heliSpawn","_veh","_grp1","_unit","_heliPos","_missionPos","_distance","_Offroad","_smoke","_heliDeleteRun","_mission","_rand","_markerstr"];

diag_log "Server: Mission Started";
////////// Initalise some vars////////
dez_missionActive = true;
_OffroadAway = false;
_heliDeleteRun = false;
//////////////////////////////////////

_heliSpawn = getMarkerPos "heliSpawn";
_veh = createVehicle ["I_Heli_light_03_unarmed_F", _heliSpawn, [], 0, "FLY"];
_veh allowDamage false;
_grp1 = createGroup independent;
_unit = _grp1 createUnit ["I_helipilot_F", Position _veh, [], 0, "NONE"];
_unit allowDamage false;
_unit moveInDriver _veh;

_rand = round (random 12);
_mission = format ["mission_%1",_rand]; // Concatinating string and number to get spawn marker number e.g. mission_1
			_markerstr = createMarker ["missionBox",getMarkerPos _mission];
			_markerstr setMarkerShape "ICON";
			_markerstr setMarkerType "mil_dot";
			_markerstr setMarkerText "Mission: Armed Offroad!";
			_markerstr setMarkerColor "colorRed";

_veh move (getMarkerPos _mission);
_veh flyInHeight 20;
[["Mission: Armed Offroad Heli drop incoming! Go and claim it for yourself!"], "fn_MPhint", true, false] spawn BIS_fnc_MP;
systemChat _mission;

while {!(_OffroadAway)} do
{
	sleep 1;
		_heliPos = getPos _veh;
		_missionPos = getMarkerPos _mission;
		_distance = _heliPos distance _missionPos;
	if (_distance < 100) then 
	{
		diag_log "Server: Heli Arrived";
		_Offroad = createVehicle ["B_G_Offroad_01_armed_F", position _veh, [], 0, "CAN COLLIDE"];  
		_Offroad allowDamage false;
		_Offroad attachTo [_veh, [0,0,-2]];
		detach _Offroad;
		sleep 3;
		_Offroad allowDamage true;
		_smoke = createVehicle ["SmokeShellRed", position _Offroad, [], 0, "NONE"];
		_smoke attachTo [_Offroad];
		_veh flyInHeight 40;
		_veh move (getMarkerPos "heliExit");
		_OffroadAway = true;
		_heliDeleteRun = true;
	};
};

while {_heliDeleteRun} do
{
	sleep 1;
		_heliPos = getPos _veh;
		_missionPos = getMarkerPos "heliExit";
		_distance = _heliPos distance _missionPos;

	if (_distance < 300) then 
		{
			diag_log "Server: Mission Heli Deleted";
			_veh allowDamage true;
			_veh setDamage 1;
			diag_log "Server: boom";
			_heliDeleteRun = false;
			if (!_heliDeleteRun) exitWith 
			{
				dez_missionActive = false;
				diag_log "Mission Finished";
			};
	};
};

//Spawn a script to monitor our box and remove after 6 minutes of being active
if (_OffroadAway) then
{
	[_Offroad,_markerstr] spawn
	{
		Private ["_Offroad","_markerstr"];
		_Offroad = _this select 0;
		_markerstr = _this select 1;
		deleteMarker _markerstr;
	};
};
