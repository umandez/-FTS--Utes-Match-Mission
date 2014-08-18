Private ["_boxAway","_heliSpawn","_veh","_grp1","_unit","_heliPos","_missionPos","_distance","_box","_smoke","_heliDeleteRun","_mission","_rand"];

diag_log "Server: Mission Started";
////////// Initalise some vars////////
dez_missionActive = true;
_boxAway = false;
_heliDeleteRun = false;
//////////////////////////////////////

_heliSpawn = getMarkerPos "heliSpawn";
_veh = createVehicle ["I_Heli_light_03_unarmed_F", _heliSpawn, [], 0, "FLY"];
_veh allowDamage false;
_grp1 = createGroup independent;
_unit = _grp1 createUnit ["I_helipilot_F", Position _veh, [], 0, "NONE"];
_unit moveInDriver _veh;

_rand = round (random 4);
_mission = format ["mission_%1",_rand]; // Concatinating string and number to get spawn marker number e.g. mission_1

_veh move (getMarkerPos _mission);
_veh flyInHeight 20;
[["Mission/n/nA helicopter has been spotted approaching the island! Get there quickly as it will most likely be dropping supplies!"], "dez_fnc_MPhint", true, false] spawn BIS_fnc_MP;

while {!(_boxAway)} do
{
	sleep 1;
		_heliPos = getPos _veh;
		_missionPos = getMarkerPos _mission;
		_distance = _heliPos distance _missionPos;

	if (_distance < 100) then 
		{
			diag_log "Server: Heli Arrived";
			_box = createVehicle ["Box_East_Wps_F", position _veh, [], 0, "NONE"];
			_box allowDamage false;
			_box attachTo [_veh];
			detach _box;
			_smoke = createVehicle ["SmokeShellRed", position _box, [], 0, "NONE"];
			_smoke attachTo [_box];
			_veh move (getMarkerPos "heliExit");
			_boxAway = true;
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
if (_boxAway) then
{
	[_box] spawn
	{
		Private ["_box"];
		_box = _this select 0;
		sleep 360;
		_box allowDamage true;
		_box setDamage 1;
		if (!alive _box) exitWith {diag_log "Server: Mission crate deleted";};
	};
};
