Private ["_ammoBoxAway","_heliSpawn","_veh","_grp1","_unit","_heliPos","_missionPos","_distance","_ammoBox","_smoke","_heliDeleteRun","_mission","_rand","_markerstr"];

diag_log "Server: Mission Started";
////////// Initalise some vars////////
dez_missionActive = true;
_ammoBoxAway = false;
_heliDeleteRun = false;
//////////////////////////////////////

_heliSpawn = getMarkerPos "heliSpawn";
_veh = createVehicle ["I_Heli_light_03_unarmed_F", _heliSpawn, [], 0, "FLY"];
_veh allowDamage false;
_grp1 = createGroup independent;
_unit = _grp1 createUnit ["I_helipilot_F", Position _veh, [], 0, "NONE"];
_unit moveInDriver _veh;
_unit allowDamage false;

_rand = round (random 12);
_mission = format ["mission_%1",_rand]; // Concatinating string and number to get spawn marker number e.g. mission_1
	_markerstr = createMarker ["missionBox",getMarkerPos _mission];
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerType "mil_dot";
	_markerstr setMarkerText "Mission: Crate!";
	_markerstr setMarkerColor "colorRed";

_veh move (getMarkerPos _mission);
_veh flyInHeight 20;
[["Mission: A helicopter has been spotted approaching the island! Get there quickly as it will most likely be dropping supplies!"], "fn_MPhint", true, false] spawn BIS_fnc_MP;
systemChat _mission;

while {!(_ammoBoxAway)} do
{
	sleep 1;
		_heliPos = getPos _veh;
		_missionPos = getMarkerPos _mission;
		_distance = _heliPos distance _missionPos;

	if (_distance < 100) then 
	{
		diag_log "Server: Heli Arrived";
		_ammoBox = createVehicle ["Box_NATO_WpsSpecial_F", position _veh, [], 0, "NONE"];
		[_ammoBox] call fn_randomiseAmmoBox; // Calls our box loadout...
		_ammoBox allowDamage false;
		_ammoBox attachTo [_veh];
		detach _ammoBox;
		_smoke = createVehicle ["SmokeShellRed", position _ammoBox, [], 0, "NONE"];
		_smoke attachTo [_ammoBox];
		_veh flyInHeight 40;
		_veh move (getMarkerPos "heliExit");
		_ammoBoxAway = true;
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
if (_ammoBoxAway) then
{
	[_ammoBox,_markerstr] spawn
	{
		Private ["_ammoBox","_markerstr"];
		_ammoBox = _this select 0;
		_markerstr = _this select 1;
		sleep 240;
		_ammoBox allowDamage true;
		_ammoBox setDamage 1;
		deleteMarker _markerstr;
		if (!alive _ammoBox) exitWith {diag_log "Server: Mission crate deleted";};
	};
};
