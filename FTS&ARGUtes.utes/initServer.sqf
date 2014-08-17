/*
Private ["_countInd"];

_countInd = independent countSide playableUnits;

[_countInd] spawn
{

_countInd = _this select 0;

if (_countInd > 0) then
	{	
		while {true} do
		{
			sleep 10;
			diag_log "Server: Start Mission System";
		};
	};
};
*/


diag_log "Mission Started";
_boxAway = false;
_heliSpawn = getMarkerPos "heliSpawn";
_veh = createVehicle ["I_Heli_light_03_unarmed_F", _heliSpawn, [], 0, "FLY"];
_veh allowDamage false;
_grp1 = createGroup independent;
_unit = _grp1 createUnit ["I_helipilot_F", Position _veh, [], 0, "NONE"];
_unit moveInDriver _veh;
_veh move (getMarkerPos "mission_1");
_veh flyInHeight 20;

while {!(_boxAway)} do
{
		_heliPos = getPos _veh;
		_missionPos = getMarkerPos "mission_1";
		_distance = _heliPos distance _missionPos;

	if (_distance < 100) then 
		{
			diag_log "Heli Arrived";
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
		_heliPos = getPos _veh;
		_missionPos = getMarkerPos "heliExit";
		_distance = _heliPos distance _missionPos;

	if (_distance < 300) then 
		{
			diag_log "Heli Deleted";
			_veh allowDamage true;
			_veh setDamage 1;
			diag_log "boom";
			_heliDeleteRun = false;
	};
};