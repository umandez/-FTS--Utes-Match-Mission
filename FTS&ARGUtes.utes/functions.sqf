/*
	FileName: functions.sqf
	Author: =FTS= Dez
	Description: Contains and custom fucntions that I want to delcare at the start of the mission.
*/

// Calculate KillDeath ratio
fn_calckdRatio = { 

dez_killCount = _this select 0;
dez_deathCount = _this select 1;

				if (dez_deathCount > 0)
					then
					{
					dez_kdRatio = (dez_killCount / dez_deathCount);
					}
				else
				{
		dez_kdRatio = dez_kdRatio + 1;
	};
};