---@diagnostic disable: lowercase-global
local function trim(s) return s:gsub("^%s*(.-)%s*$", "%1") end

-- custom field for description and in-game constants
_src_url = "https://github.com/gyroplast/mod-dont-starve-instant-creative-mode"

name = "Instant Creative Mode"
author = "Gyroplast"
version = "1.0.0"
forumthread = ""
api_version = 10
dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"
all_clients_require_mod = false
client_only_mod = false
server_filter_tags = { "instant creative mode"}

description = trim [[
Version __VERSION__, Steam ID 2625841618
A server-side only mod to instantly bring every connecting player into creative mode on every shard.
Sources: __SRC_URL__
]]:gsub("__VERSION__", version):gsub("__SRC_URL__", _src_url)
configuration_options = {
    {
        name = "",
        label = "Player Settings",
        hover = "",
        options = { { description = "", data = "" } },
	default = ""
    },
    {
        name = "log_level",
        label = "Log Level",
        hover = "Write log messages to file with selected or higher severity. Trace may contain sensitive data and/or be very chatty!",
        options = {
            {description = "Trace", data = "TRACE"},
            {description = "Debug", data = "DEBUG"},
            {description = "Info", data = "INFO"},
            {description = "Warning", data = "WARNING"},
            {description = "Error", data = "ERROR"}
        },
        default = "INFO"
    },
    {
        name = "godmode",
        label = "God Mode",
        hover = "Players are invincible and maintain all stats (sanity, hunger, wetness, etc.).",
        options = {
            {description = "Enabled", data = true },
            {description = "Disabled", data = false }
        },
        default = true
    },
    {
        name = "creative_mode",
        label = "Creative Mode",
        hover = "Players can build everything without materials, research, or prototyping.",
        options = {
            {description = "Enabled", data = true },
            {description = "Disabled", data = false }
        },
        default = true
    },
    {
        name = "speed_multiplier",
        label = "Movement Speed",
        hover = "Player movement speed multiplier.",
        options = {
            {description = "1x", data = 1 },
            {description = "1.5x", data = 1.5 },
            {description = "2x", data = 2 },
            {description = "4x", data = 4 },
            {description = "6x", data = 6 }
        },
        default = 2
    },
    {
        name = "one_hit_kill",
        label = "One Hit Kill",
        hover = "Players can kill everything with one hit, through excessive damage multiplication.",
        options = {
            {description = "Enabled", data = true },
            {description = "Disabled", data = false }
        },
        default = true
    },
}
