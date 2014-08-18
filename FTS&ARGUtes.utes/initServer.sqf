
Private ["_countInd","_rand"];

dez_fnc_MPhint = { [hint format _this]; };

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
				[["A mission will be starting shortly..."], "dez_fnc_MPhint", true, false] spawn BIS_fnc_MP;
			};
			
		};
	}
else {diag_log "Server: Not Enough players online to start a mission";};
};