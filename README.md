Instant Creative Mode
==================

A server-side only mod to instantly bring every connecting player into creative mode on every shard.

- [Instant Creative Mode](#instant-creative-mode)
  - [Features and Usage](#features-and-usage)
  - [Installation and Setup](#installation-and-setup)
    - [Mod Installation using the Steam Workshop](#mod-installation-using-the-steam-workshop)
      - [Edit dedicated_server_mods_setup.lua in mods directory](#edit-dedicated_server_mods_setuplua-in-mods-directory)
      - [Edit modoverrides.lua in server/shard directory](#edit-modoverrideslua-in-servershard-directory)
    - [Mod Installation Without Steam Workshop](#mod-installation-without-steam-workshop)
  - [Roadmap](#roadmap)
  - [Acknowledgements](#acknowledgements)
    - [Source Code](#source-code)
  - [Changelog](#changelog)
    - [Version 1.0.0 (2021-10-12)](#version-100-2021-10-12)


Features and Usage
------------------

The mod automatically runs commands on players upon connection on a shard to

  - make them invincible (God Mode),
  - allow building everything without needing materials or prototyping (Creative Mode),
  - increase movement speed,
  - increase damage to one-hit kill everything.

Individual features can be enabled or disabled by configuration settings,
with the defaults setting the movement speed multiplier to 2x, and enabling everything
else for maximum cheatage. The mod is designed to just work out of the box, with
minimal maintenance and setup, and not have to bother with hastily hacking console
commands before dying to the angry deerclops next to you.

The remote console can still disable or override anything with explicit commands.
There is no regular "check" of any sort to keep the configured mod settings enforced.


Installation and Setup
----------------------

Please follow generic installation instructions on how to install a mod on your dedicated or
client-hosted server, this mod works exactly the same as any other mod in that regard.

### Mod Installation using the Steam Workshop

#### Edit dedicated_server_mods_setup.lua in mods directory

Add this snippet to the file `<dedicated_server_install>/mods/dedicated_server_mods_setup.lua` to automatically let the server download the mod from the Steam Workshop on boot. This does not activate the mod, yet.

```lua
-- Instant Creative Mode by Gyroplast
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2625841618
ServerModSetup("2625841618")
```

#### Edit modoverrides.lua in server/shard directory

Add configuration options and enable the mod in the server's `modoverrides.lua` file. Please note that this file is server specific! As Overworld and Caves are technically two independent servers, you will generally want to modify this file in at least two locations, most of the time identically, unless you want differing configuration for any mod from Caves to Overworld.

Below is a commented, comprehensive default configuration for this mod that can be copied into the file directly to configure the Steam Workshop installation of the mod.

```lua
  -- Instant Creative Mode by Gyroplast
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=2625841618
  ["workshop-2625841618"]={
    configuration_options={
      log_level="INFO",     -- server log level: TRACE, DEBUG, INFO, WARN, ERROR
      godmode=true,         -- Players are invincible and maintain all stats
      creative_mode=true,   -- Players can build everything without materials
      speed_multiplier=2,   -- Player walking speed multiplier
      one_hit_kill=true     -- Players one-hit kill everything
    },
    enabled=true
  }
```

### Mod Installation Without Steam Workshop

If you prefer to install the mod without using the Steam Workshop, download the release you want as an archive, and extract it into the `mods` directory in the dedicated server installation directory, where the `dedicated_server_mods_setup.lua` file resides. After extraction, you should have a new directory for the mod in the `mods` directory, named `Instant_Creative_Mode-<version>`, similar to this:

```
.../
    Don't Starve Together Dedicated Server/
        mods/
            Instant_Creative_Mode-1.0.0/
                lib/
                LICENSE
                modicon.tex
                modicon.xml
                modinfo.lua
                modmain.lua
                README.md
            INSTALLING_MODS.txt
            MAKING_MODS.txt
            dedicated_server_mods_setup.lua
            modsettings.lua
```

Take note of the *exact* name of the mod directory, `Instant_Creative_Mode-1.0.0` in this example. The mod configuration must refer to this exact, case-sensitive directory name. The actual directory name is not important, but it must be consistent with the `modoverrides.lua` entry for the mod, otherwise the server will not be able to associate the configuration with the mod, and the mod will stay disabled entirely.

To achieve the required consistency, you may now either just rename the mod directory to `workshop-2625841618`, and edit the `modoverrides.lua` files exactly as described in the [Steam Workshop Installation above](#edit-modoverrideslua-in-servershard-directory), 

**OR**

replace the `workshop-2625841618` reference in the `modoverrides.lua` file with the exact, case-sensitive name of the mod, i. e. `Instant_Creative_Mode-1.0.0` in this case, like this:

```lua
  -- Instant Creative Mode by Gyroplast
  -- https://steamcommunity.com/sharedfiles/filedetails/?id=2625841618
  ["Instant_Creative_Mode-1.0.0"]={
    configuration_options={
      ...
```

**Do not edit the `dedicated_server_mods_setup.lua` file to include the `ServerModSetup("2625841618")` line.**

The `ServerModSetup`'s *only job* is to download the mod files from the Steam Workshop, which is unnecessary after downloading, extracting, and placing the mod files manually.
In fact, if you renamed the directory to `workshop-2625841618`, leaving the `ServerModSetup` line active would overwrite the manually installed mod with the Steam Workshop version on server start, so ensure there is no `ServerModSetup("2625841618")` line in the `dedicated_server_mods_setup.lua` file, or leave the mod directory name as-is.


Roadmap
-------

This is a list of changes and features that are planned to be implemented,
in no particular order.

- [ ] make items not lose durability on use
- [ ] add invisibility to god mode
- [ ] re-apply god mode after any respawn (telepoof, wormholes, revive, etc.)
- [ ] add modicon and screenshots


Acknowledgements
--------------

### Source Code

Please see the enclosed [license file](LICENSE),
applicable to the sources unless noted otherwise. Mod sources are hosted on
[GitHub](https://github.com/gyroplast/mod-dont-starve-instant-creative-mode).


Changelog
---------

### Version 1.0.0 (2021-10-12)
  - first release
