#include <sourcemod>
#include <sdktools>

#pragma newdecls required
#pragma semicolon 1

char BOT_MODEL[PLATFORM_MAX_PATH] = "models/some_model.mdl"; //edit this shit to match the model path you are going to use to replace the bots' default model

public Plugin myinfo =
{
	name = "custom bot model",
	author = "Nairda",
	description = "Precache the model on bots if you want to use a custom one.",
	url = "https://steamcommunity.com/id/nairda1339/"
};

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
