-- server-only mod, exit early on client
if not GLOBAL.TheNet:GetIsServer() then do return end end

modimport("lib/logging") -- imports "Log"

-- convenient aliases and simple helpers
local _G = GLOBAL
Log:SetLogLevel(GetModConfigData("log_level"))

local CFG_GODMODE = GetModConfigData("godmode")
local CFG_CREATIVE_MODE = GetModConfigData("creative_mode")
local CFG_SPEED_MULTIPLIER = GetModConfigData("speed_multiplier")
local CFG_ONE_HIT_KILL = GetModConfigData("one_hit_kill")

local function player_settings(player)
    if CFG_GODMODE then
        Log:Debug(string.format("enabling God Mode for %s [%s] (%s)",
                                player.name, player.userid,
                                player:GetDisplayName()))
        _G.c_supergodmode(player)
        _G.c_maintainall(player)
    end

    if CFG_CREATIVE_MODE then
        Log:Debug(string.format("enabling Creative Mode for %s [%s] (%s)",
                                player.name, player.userid,
                                player:GetDisplayName()))
        player.components.builder:GiveAllRecipes()
    end

    if CFG_ONE_HIT_KILL then
        Log:Debug(string.format("enabling One-Hit Kill for %s [%s] (%s)",
                                player.name, player.userid,
                                player:GetDisplayName()))
        player.components.combat.damagemultiplier = 10000
    end

    Log:Debug(string.format(
                  "setting Movement Speed multiplier to %sx for %s [%s] (%s)",
                  CFG_SPEED_MULTIPLIER, player.name, player.userid,
                  player:GetDisplayName()))
    player.components.locomotor:SetExternalSpeedMultiplier(player,
                                                           "c_speedmult",
                                                           CFG_SPEED_MULTIPLIER)
end

local function main()
    Log:Info("starting")
    Log:Info("CFG: log level set to %s", Log:GetLogLevel())

    AddPlayerPostInit(player_settings)

    Log:Info("finished initialization")
end

main()
