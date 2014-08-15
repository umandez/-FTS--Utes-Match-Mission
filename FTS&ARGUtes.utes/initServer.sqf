
Private ["_countInd"];

_countInd = independent countSide playableUnits;

[_countInd] spawn
{
if (_countInd > 1) then
	{	
	diag_log "Server: Start Mission System";

	};
}