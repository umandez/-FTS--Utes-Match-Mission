
Private ["_countInd","_randMission"];

_handle = execVM "config.sqf";
	waitUntil {scriptDone _handle};
_handle = execVM "functions.sqf";
	waitUntil {scriptDone _handle};
player addMPEventHandler["MPKilled", {_this execVM "killedPlayer.sqf"}];

_countInd = independent countSide playableUnits;
dez_missionActive = false;

while {true} do
{
sleep 10;
	if (_countInd > 0) then
	{	
		diag_log "Server: Enough players online.. starting mission";
		_randMission = round (random 5); // For when more missions are made
		systemChat str _randMission;
		switch (_randMission) do
		{
			case 1: {execVM "missions\offroadArmedDropOff.sqf"};
			case 2: {execVM "missions\hunterDropOff.sqf"};
			case 3: {execVM "missions\littleBirdDropOff.sqf"};
			case 4: {execVM "missions\atvDropOff.sqf"};
			case 5: {execVM "missions\heliDropOff.sqf"};
		};
		sleep dez_missionTimer; //Sleep for 10 mins when a mission has been started
		[["A mission will be starting shortly..."], "fn_MPhint", true, false] spawn BIS_fnc_MP;		
	}
else {diag_log "Server: Not Enough players online to start a mission";};
};