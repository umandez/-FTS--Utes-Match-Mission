
	Private ["_rand","_spawnMarker","_spawnPoint","_randomGunChance"];
	// Declare some variables
	diag_log "Inistialising Variables";
		_handle = execVM "config.sqf";
		waitUntil {scriptDone _handle};
	diag_log "Inistialising Variables - Done";
	diag_log "Inistialising Event Handler";
		player addMPEventHandler["MPKilled", {_this execVM "killedPlayer.sqf"}];
	diag_log "Inistialising Event Handler - Done";

	// Remove our weapons as we will not be needing these anymore!
	removeAllWeapons player;
	{player removeMagazine _x} forEach magazines player;
	removeAllItems player;
	player removeWeapon "ItemMap";
	//player removeWeapon "ItemRadio";
	player removeWeapon "NVGoggles_INDEP";
	player addWeapon "ItemWatch";
	player addWeapon "ItemCompass";
	player addWeapon "FirstAidKit";

		// Starts Introduction
		if (dez_playIntro) then
		{
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
	diag_log "Handle Player Spawn - Done";

	[] spawn
		{
		Private ["_playerFatigue"];
		
		_playerFatigue = getFatigue player;
		
		if (_playerFatigue > 0.5)
			then
			{
				player setFatigue 0;
			};
		sleep 10;
	};

/*
		// Selects a random spawn point out of 31 placed spawn markers
		_rand = round (random 31);
		_spawnMarker = format ["spawn_%1",_rand]; // Concatinating string and number to get spawn marker number e.g. spawn_2
		hint _spawnMarker; // Test which spawn point name we go to.

		_spawnPoint = getMarkerPos _spawnMarker;
		player setPosATL _spawnPoint; // Moves us to our new spawn.
		
		_randomGunChance = round (random 100);
		if (_randomGunChance > 90) then
		{
		hint "You were lucky and recieved a Silenced Rook, now lookout for the objectives and head inland!";
		player addWeapon "hgun_Rook40_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";	
		}
		else
		{
		hint "You are all set, now i'd head in-land!";
		player addWeapon "hgun_Rook40_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";	
		};
*/