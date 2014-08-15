/*
-- Filename: killedPlayer.sqf
-- Author: =FTS= Dez
-- Date: 13/08/14
-- Description: Well.. it rewards for kills and does other cool things.
*/

Private["_victim","_killer","__randomSound","_realNameVictim","_realNameKiller","_killedDistance"];
_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//if (_victim == objNull) exitWith {}; // Dafuqqq???

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

	_realNameVictim = name _victim;
	_realNameKiller = name _killer;
	_killedDistance = _victim distance _killer;
	_killedDistance = round _killedDistance;
	//hint str _killedDistance;

if (_killer == _victim) then
{
	systemChat format ["%1 has made a fool of themselves!",_realNameVictim];
	
	// Player Penalty for killing themselves
	if (player == _victim && player == _killer) then
	{
		playSound "Humiliation";
		dez_deathCount = dez_deathCount + 1;
		if (dez_playerCash >= 500) then
		{dez_playerCash = dez_playerCash - 500;}
		else
		{dez_playerCash = 0;};
		hintSilent "You have lost $500 for commiting suicide! Fool...";

		[dez_killCount,dez_deathCount] call fn_calckdRatio;
		systemChat format ["Kills: %1 | Deaths: %2 | K/D Ratio: %3 | Cash: $%4",dez_killCount,dez_deathCount,dez_kdRatio,dez_playerCash];
	};
}
else
{
	switch (true) do
		{
			case (_killedDistance < 100): {systemChat format ["SYSTEM: %1 was humiliated by %2 from %3 meters away",_realNameVictim,_realNameKiller,_killedDistance];};
			case ((_killedDistance >= 100) && (_killedDistance < 500)): {systemChat format ["SYSTEM: %1 was killed by %2 from %3 meters away",_realNameVictim,_realNameKiller,_killedDistance];};
			case ((_killedDistance >= 500) && (_killedDistance < 1000)): {systemChat format ["SYSTEM: %1 was slaughtered by %2 from %3 meters away",_realNameVictim,_realNameKiller,_killedDistance];};
			case (_killedDistance >= 1000): {systemChat format ["SYSTEM: %1 was sniped by %2 from %3 meters away",_realNameVictim,_realNameKiller,_killedDistance];};
		};
};

if ((player != _victim) && (player != _killer)) exitWith {}; // Player was not involved, no need to waste resources any more.

if ((player == _killer) && (player != _victim)) then
{	
	dez_killCount = dez_killCount + 1;
	
	switch (true) do
		{
			case (_killedDistance < 50): 
			{
				hintSilent format ["You have gained $100 for killing %1",_realNameVictim];
				dez_playerCash = dez_playerCash + 100;
				playSound "Impressive";
			};
			case ((_killedDistance > 50) && (_killedDistance < 500)): 
			{
				hintSilent format ["You have gained $150 for killing %1",_realNameVictim];
				dez_playerCash = dez_playerCash + 150;
				
				_randomSound = round (random 4);
				switch (_randomSound) do
				{
				case 1: {playSound "Maniac"};
				case 2: {playSound "MonsterKill"};
				case 3: {playSound "Unstoppable"};
				case 4: {playSound "Excellent"};
				default {playSound "Unstoppable";};
				};	
			};
			case ((_killedDistance >= 500) && (_killedDistance <= 1000)): 
			{
				hintSilent format ["You have gained $200 by killing %1 from over 500 meters away!",_realNameVictim];
				dez_playerCash = dez_playerCash + 200;
				playSound "Headshot";
			};
			case (_killedDistance > 1000): 
			{
				hintSilent format ["You have gained $250 for a LONGSHOT on %1",_realNameVictim];
				dez_playerCash = dez_playerCash + 250;
				playSound "EagleEye";
			};
		};	
	[dez_killCount,dez_deathCount] call fn_calckdRatio;
	systemChat format ["Kills: %1 | Deaths: %2 | K/D Ratio: %3 | Cash: $%4",dez_killCount,dez_deathCount,dez_kdRatio,dez_playerCash];
};

if ((player != _killer) && (player == _victim)) then
{
	hintSilent "You have lost £100";
	dez_deathCount = dez_deathCount + 1;
	playSound "Denied";
	
	if (dez_playerCash >= 100) then
	{
	dez_playerCash = dez_playerCash - 100;
	}
	else
	{
	dez_playerCash = 0;
	};

	[dez_killCount,dez_deathCount] call fn_calckdRatio;
	systemChat format ["Kills: %1 | Deaths: %2 | K/D Ratio: %3 | Cash: $%4",dez_killCount,dez_deathCount,dez_kdRatio,dez_playerCash];
};