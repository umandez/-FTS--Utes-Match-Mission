// 12/08/14
// Created by =FTS= Dez

private["_victim","_killer"];
disableSerialization;
_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

sleep 1;
if (!alive player) then {

dez_killStreak = 0; //Resets our killstreak on death!

_handle = execVM "respawn.sqf";
waitUntil {scriptDone _handle};
};