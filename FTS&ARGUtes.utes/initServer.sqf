
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