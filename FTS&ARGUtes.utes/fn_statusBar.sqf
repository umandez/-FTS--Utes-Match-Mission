waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information
	Edit v2: Dez
	Reason: Removed crap that did nothing?? Changed for my use.
*/

_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["Loading status bar...", _rscLayer];

[] spawn {
	sleep 5;
	while {true} do
	{
		sleep 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | GRIDREF: %2 | Players: %3 | Kills: %4 | Deaths: %5 | K/D Ratio: %6 | Cash: $%7", round diag_fps, mapGridPosition player, independent countSide playableUnits, dez_killCount, dez_deathCount, dez_kdRatio, dez_playerCash];
	}; 
};