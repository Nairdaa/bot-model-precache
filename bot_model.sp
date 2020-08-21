#include <sourcemod>
#include <sdktools>

#pragma newdecls required
#pragma semicolon 1

char BOT_MODEL[PLATFORM_MAX_PATH] = "models/some_model.mdl"; //edit this shit

public void OnPluginStart()
{
	HookEvent("player_spawn", Event_PlayerSpawn);
}

public void OnMapStart()
{
	PrecacheModel(BOT_MODEL, true);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	
	if(IsFakeClient(client))
	{
		SetEntityModel(client, BOT_MODEL);
	}
}