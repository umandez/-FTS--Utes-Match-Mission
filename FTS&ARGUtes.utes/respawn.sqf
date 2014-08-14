	Private ["_rand","_spawnMarker","_spawnPoint","_randomGunChance"];

	waitUntil {alive player}; // So we don't try and respawn before the player is alive.... dohh

	// Remove our weapons as we will not be needing these anymore!
	removeAllWeapons player;
	{player removeMagazine _x} forEach magazines player;
	removeAllItems player;
	//player removeWeapon "ItemMap";
	//player removeWeapon "ItemRadio";
	player removeWeapon "NVGoggles_INDEP";
	player addWeapon "ItemWatch";
	player addWeapon "ItemCompass";
	player addWeapon "FirstAidKit";

		// Selects a random spawn point out of 31 placed spawn markers
		_rand = round (random 31);
		_spawnMarker = format ["spawn_%1",_rand]; // Concatinating string and number to get spawn marker number e.g. spawn_2
		_spawnPoint = getMarkerPos _spawnMarker; // For Arma.. get's the coords of the spawn marker so it knows where to send us.
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