
Private ["_rand","_spawnMarker","_spawnPoint","_randomGunChance"];
// Declare some variables
diag_log "Inistialising Variables";
	_handle = execVM "config.sqf";
	waitUntil {scriptDone _handle};
diag_log "Inistialising Variables - Complete!";

diag_log "Inistialising Functions";
	_handle = execVM "functions.sqf";
	waitUntil {scriptDone _handle};
diag_log "Inistialising Functions - Complete!";

diag_log "Inistialising Event Handler";
	player addMPEventHandler["MPKilled", {_this execVM "killedPlayer.sqf"}];
diag_log "Inistialising Event Handler - Complete!";

// Remove our weapons as we will not be needing these anymore!
removeAllWeapons player;
{player removeMagazine _x} forEach magazines player;

// Starts Introduction
if (dez_playIntro) then {
	cutText ["Welcome to =FTS= & [ARG] Gaming Utes Server!","BLACK FADED",2];
	sleep 5;
	cutText ["You have been deserted on a small island, there are no friendlies","BLACK FADED",1];
	sleep 5;
	cutText ["Random Objectives will spawn around the map that will reward better items.","BLACK FADED",1];
	sleep 5;
	cutText ["Goodluck soilder! Let the games begin!","BLACK FADED",1];
	sleep 5;
	cutText ["","BLACK IN",2];
};

diag_log "Handle Player Spawn";
	_handle = execVM "respawn.sqf";
	waitUntil {scriptDone _handle};
diag_log "Handle Player Spawn - Complete!";

// Make sure we don't run out of fatigue... can be really annoying!
[] spawn
{
	while {true} do {
	Private ["_playerFatigue"];
		
	_playerFatigue = getFatigue player;
		
	if (_playerFatigue > 0.5)
		then
		{
			player setFatigue 0;
		};
	sleep 10;
	};
};