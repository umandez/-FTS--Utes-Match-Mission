
Private ["_countInd","_rand"];

_handle = execVM "config.sqf";
	waitUntil {scriptDone _handle};
_handle = execVM "functions.sqf";
	waitUntil {scriptDone _handle};
player addMPEventHandler["MPKilled", {_this execVM "killedPlayer.sqf"}];

_countInd = independent countSide playableUnits;
dez_missionActive = false;

while {true} do
{
sleep 30;
	if (_countInd > 0) then
	{	
		while {true} do
		{
			if (!dez_missionActive) then
			{
				diag_log "Server: Enough players online.. starting mission";
				//_rand = round (random 2); // For when more missions are made
				execVM "missions\heliDropOff.sqf"
				sleep 600; //Sleep for 10 mins when a mission has been started
				[["A mission will be starting shortly..."], "fn_MPhint", true, false] spawn BIS_fnc_MP;
			};
			
		};
	}
else {diag_log "Server: Not Enough players online to start a mission";};
};