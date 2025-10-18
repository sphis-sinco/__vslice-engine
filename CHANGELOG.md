# Friday Night Funkin (V-Slice Engine)

## [0.2.0] - 2025-10-17

The changelog format will change after this version.
But you can see small previews of the new format (kinda) in this changelog.

### Fixed

- [FUNKIN] Missing Assets
- [FUNKIN] (Potential?) Crashes when trying to look for assets in library folders
- Crash when trying to look for Abot assets in the non-shared folder

### Removed

- FNF Changelog
- Abot from base engine assets (moved to `funkin` mod)
- Merch Mainmenu Button
- [MOBILE] Upgrade Mainmenu Button
- [MOBILE] Ads
- [MOBILE] In-App Purcheses
- Removed `Constants` `VERSION_SUFFIX` variable

### Changed

- `funkin.ui.PixelatedIcon` has been moved to `funkin.ui.objects.pixelated_icon.PixelatedIcon`
  - Backwards Compatability for this change has been added and `funkin.ui.objects.pixelated_icon.PixelatedIcon` is an import alias for `funkin.ui.PixelatedIcon`
- `FreeplaySongData` has been split from `FreeplayState`
- Freeplay OST Text will become blank for the random capsule
- Freeplay OST Text will change to "UNOFFICIAL OST" for songs outside of the base game weeks
- Freeplay Character Select Hint X Position (shifted over to the left)
- Git info is included
- `-indev` is added to the version string (pre-git info) instead of a suffix
- It is now easier to add Preferences
- The game data should save on exit now
- Some `FileUtil` functions are no longer Native(Sys)-only
  - `pathExists`
  - `readDir`
  - `directoryExists`
- `FunkinVSE.exe` is a Protected Path now
- `PolymodHandler`'s `modFileSystem` variable is public static now
- `FUNKIN_MOD` Feature Flag has been renamed to `FEATURE_FUNKIN_MOD`

### Added

- `FEATURE_GIT_INFO` Feature Flag that controls if the `GIT_BRANCH`, `GIT_HASH` or (`FEATURE_DEBUG_FUNCTIONS` only) Git Modified / `GIT_HAS_LOCAL_CHANGES` status is included in the version
- `PreferencesMenu` `instance` variable
- `PreferencesMenu` `isCurrentOptionsPage` function
- **MOD MENU** (Thanks again @KoloInDaCrib)
- `FEATURE_KOLO_MODMENU` Feature Flag that adds the Mod Menu from [Kolo's Mod Menu PR](https://github.com/FunkinCrew/Funkin/pull/4223) (Thanks @KoloInDaCrib)

## [0.1.1] - 2025-10-15

### Changed

- 0 mods loaded PolymodHandler message

### Removed

- PolymodHandler "Installed mods have replaced # __ files" message

### Fixed

- Base game songs still being in the assets folder
- `0.1.0` changelog entry date
- Updated Title Texts:
  - "The Funkin Crew Inc" -> "VSE Crew"
  - "In association with" -> "Not in association with"
  - "Friday Night Funkin" / "Friday Nigth Funkin" -> "V Slice Engine"

## [0.1.0] - 2025-10-15

### Added

- `FUNKIN_MOD` Feature Flag controlling if the `funkin` mod should be included
- InitState Task Text (Not in sync but I think this can depend on ur pc, idk just a guess)
- Empty save check for base game save
- Define Util (Thanks @PurSnake)
- Main Menu Mod List (Thanks @Trofem)
- Hashlink (`lime test hl` / `lime build hl`) support (Thanks @NotHyper-474)
- `Friday Night Funkin (V-Slice Engine)` Credits

### Removed

- "killed line" msg in credits
- Polymod duplicate imports warning in the terminal
- Removed Level Libraries
- `CENSOR_EXPLETIVES` feature flag

### Fixed

- `assets/videos/videos/` folder (now just `assets/videos/`)
- Lag with more then 10(?) mods installed (Thanks @PurSnake)
- Prevent crash with missing credits.json with `-D NO_HARDCODED_CREDITS`

### Changed

- Discord RPC Client ID
- Save company (`VSECrew`) and name (`FunkinVSE`)
- `FEATURE_FILE_LOGGING` is enabled on release AND debug builds
- `FEATURE_DEBUG_FILE_LOGGING` has been renamed to `FEATURE_FILE_LOGGING`
- PolymodHandler "Installed mods have replaced # __ files" message is now in release builds
  - removed general audio and music sections (they just ended up being sounds so ye)
  - sound files have specification for music and sounds (by folder)
  - text files have specification for scripts and json (by extension and folder)
  - "replaced" is now "added/replaced"
- **BASE GAME IS A MOD NOW**
- importedClasses no longer have multiple traces in the terminal during non-core initalization
- The `HARDCODED_CREDITS` feature flag is disabled by default now
- The `FEATURE_NEWGROUNDS` feature flag is disabled by default now
- [MOBILE] `Preferences.naughtyness` is disabled by default
- The `CENSOR_EXPLETIVES`  feature flag has been replaced with `Preferences.naughtyness`
- Instances of "Friday Night Funkin'" have " (V-Slice engine)" appended to the end of it
- The Discord presence large image text uses `Constants.TITLE` now
