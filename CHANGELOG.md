# [0.3.0] - 2025-10-18
Mod API Version: `0.3.0`

This version is the first showcase of the new changelog format
that will most likely change as we go.

## Stages

- [FUNKIN] Fixed incorrect image paths in the `limoRideErect` stage
- [FUNKIN] Fixed incorrect image paths in the `phillyBlazin` stage
- [FUNKIN] Fixed incorrect image paths in the `tankmanBattlefield` stage

## Freeplay

- All private variables included in `funkin.modding.events.callbacks.CallbackEventDataGenerator.generateFreeplayData` are public now
- Removed (Most likely) debug traces of `FlxG.width`, `FlxG.camera.zoom`, `FlxG.camera.initialZoom`, and `FlxCamera.defaultZoom`

## Scripts

### Callbacks

- Added `callbackEventHolder` to the following states:
  - `funkin.ui.freeplay.FreeplayState`
  - `funkin.ui.story.StoryMenuState`
  - `funkin.ui.mainmenu.MainMenuState`
  - `funkin.ui.title.TitleState`

- Added `funkin.modding.events.callbacks.CallbackEventDataGenerator` - `CallbackEventData` data generator for different classes
  - Functions:
    - `generateFreeplayData(freeplay:FreeplayState)` - Generates event data for `funkin.ui.freeplay.FreeplayState`
      - `subState`
      - `songs`
      - `curSelected`
      - `currentDifficulty`
      - `currentVariation`
      - `currentCapsule`
      - `grpCapsules`
      - `dj`
      - `ostName`
      - `albumRoll`
      - `charSelectHint`
      - `currentCharacter`
      - `backingCard`
      - `backingImage`
      - `fromResultsParams`
      - `styleData`

    - `generateMusicbeatSubStateData(musicBeatSubState:MusicBeatSubState)` - Generates event data for `funkin.ui.MusicBeatSubState`
      - `subState`
      - `leftWatermarkText`
      - `rightWatermarkText`

    - `generateMusicbeatStateData(musicBeatState:MusicBeatState)` - Generates event data for `funkin.ui.MusicBeatState`
      - `state`
      - `leftWatermarkText`
      - `rightWatermarkText`

- Added `funkin.modding.events.callbacks.CallbackEventData` - A holder of data for `CallbackEvent` functions
  - Variables:
    - `id` - A unique id to difference Callback Event Data Classes
    - `data` - A container of custom data depending on the event

  - Functions:
    - `new(id:String, data:Dynamic)` - Initalizes the data

- Added `ICallbackEventClass` to `funkin.modding.IScriptedClass`
  - Added `onCallbackEvent(event:CallbackScriptEvent)` to `funkin.modding.IScriptedClass.ICallbackEventClass`
  - `funkin.modding.module.Module` implements `ICallbackEventClass`

- Added new Script Event Types: `CALLBACKSCRIPTHOLDER_NEW`, `CALLBACKSCRIPTEVENT_INIT`, `CALLBACKSCRIPTEVENT_CREATE`, `CALLBACKSCRIPTEVENT_UPDATE`, `CALLBACKSCRIPTEVENT_CUSTOM`

- Added `funkin.modding.events.callbacks.CallbackScriptEvent` - A class extending `funkin.modding.events.ScriptEvent` for Callback Event script events
  - Variables:
    - `callbackEvent:CallbackEvent` - A variable to represent the event calling the script event

  - Functions:
    - `new(typeID:Int = 0, callbackEvent:CallbackEvent)` - initalizes the Script Event

- Added `funkin.modding.events.callbacks.CallbackEventHolder` - A simple manager for `CallbackEvent` so each state won't require a unique one
  - Variables:
    - `callbackEvents:Array<CallbackEvent>` - A container with all the callback events

  - Functions:
    - `new()` - This will initalize `callbackEvents` and call the `CALLBACKSCRIPTHOLDER_NEW` `CallbackScriptEvent`
    - `addCallbackEvent` - Easy function to add callback events without having to worry about referencing the Array and also prevents dupe events
    - `onCreate` - Calls `onCreate` for all CE's
    - `onUpdate` - Calls `onUpdate` for all CE's
    - `onCall` - Calls `onCall` for all CE's

- Added `funkin.modding.events.callbacks.CallbackEvent` - Callback event to allow scripts to do things in other states without requiring instances
  - Variables:
    - `id:String` - Unique ID for this Callback Event that also will be used in `CallbackEventHolder` to prevent dupe events
    - `onInit:Void -> Void` - Called when added to a `CallbackEventHolder`
    - `onCreate:(eventdata:CallbackEventData) -> Void` - Called when `create` is done (For the state)
    - `onUpdate:(eventdata:CallbackEventData) -> Void` - Called when `update` is done (For the state)
    - `onCall:(id:String, eventdata:CallbackEventData) -> Void` - Custom callback that scripts can make

  - Functions:
    - `new(id:String)` - This will set the callback event identifier

## Playable Characters

### Data

- [FUNKIN] The pause death names for Pico are "Blam" (Single) and "Blams" (Multiple) now

- Added new `funkin.ui.freeplay.charselect.PlayableCharacter` function
  - `getPauseDeathName` (Params: `death`, Return Type: `String`) - A simple function to return a string depending on the amount of deaths that have happened

### Pause Screen

- Added 2 new `funkin.data.freeplay.player.PlayerData` variables
  - `pauseDeathNameSingle` (Optional, Default: `Blue Ball`) - Text displayed in the PauseSubState for deaths when there is only 1 death
  - `pauseDeathNameMultiple` (Optional, Default: `Blue Balls`) - Text displayed in the PauseSubState for deaths by default

# [0.2.0] - 2025-10-18
Mod API Version: `0.2.0`

The changelog format will change after this version.
But you can see small previews of the new format (kinda) in this changelog.

## Fixed

- [FUNKIN] Missing Assets
- [FUNKIN] (Potential?) Crashes when trying to look for assets in library folders
- Crash when trying to look for Abot assets in the non-shared folder

## Removed

- FNF Changelog
- Abot from base engine assets (moved to `funkin` mod)
- Merch Mainmenu Button
- [MOBILE] Upgrade Mainmenu Button
- [MOBILE] Ads
- [MOBILE] In-App Purcheses
- Removed `Constants` `VERSION_SUFFIX` variable

## Changed

- The `PreferencesMenu` `itemDescBox` object changes height depending on the height of the description text always instead of just on the start

- `funkin.ui.PixelatedIcon` has been moved to `funkin.ui.objects.pixelated_icon.PixelatedIcon`
  - Backwards Compatability for this change has been added and `funkin.ui.objects.pixelated_icon.PixelatedIcon` is an import alias for `funkin.ui.PixelatedIcon`

- `FreeplaySongData` has been split from `FreeplayState`

- Freeplay OST Text
  - Freeplay OST Text will become blank for the random capsule
  - Freeplay OST Text will change to "UNOFFICIAL OST" for songs outside of the base game weeks

- Freeplay Character Select Hint X Position (shifted over to the left)
- `-indev` is added to the version string (pre-git info) instead of a suffix
- The game data should save on exit now
- `FileUtil` changes
  - Some `FileUtil` functions are no longer Native(Sys)-only thanks to `PolymodHandler.modFileSystem`
    - `pathExists`
    - `readDir`
    - `directoryExists`
  - `FunkinVSE.exe` is a Protected Path now
- `PolymodHandler`'s `modFileSystem` variable is `public static variable` now
- `FUNKIN_MOD` Feature Flag has been renamed to `FEATURE_FUNKIN_MOD`

## Added

- `PreferencesMenu` `createCategory(categoryName:String, ?categoryDescription:String)` function

- `funkin.ui.objects.pixelated_icons.PixelatedIconData` typedef
  - `assets/data/ui/pixelated_icons/**.json` is the valid path for `PixelatedIconData` JSONS

  - `PixelatedIconData` JSON files have modifyable 3 fields
    - `iconPathPrefix` (Optional, Default: `freeplay/icons/`) - This is to change the image folder where the pixelated icon is found
    - `iconPathSuffix` (Optional, Default: `pixel`) - This is to change the pixelated icon suffix, probably to remove the `pixel` part at the end
    - `animated` (Optional, Default: `false`) - This is the new controller for if a pixelated icon is animated
    - `originX` (Optional, Default: `100.0`) - This is to change the origin.x value, most likely for bigger icons
    - `originY` (Optional) - This is to change the origin.y value, most likely for bigger icons
    - `scale` (Optional, Default: `2.0`) - This is to change the icon scale for VERY big icons
    - `additionalAnimations` (Optional, Default: `[]`) - Additional animations to add ontop of the base animations

- `FEATURE_GIT_INFO` Feature Flag that controls if the `GIT_BRANCH`, `GIT_HASH` or (`FEATURE_DEBUG_FUNCTIONS` only) Git Modified / `GIT_HAS_LOCAL_CHANGES` status is included in the version
  - Git info is included in the version string by default now

- `PreferencesMenu` Script / Mod related changes
  - `PreferencesMenu` `instance` variable
  - `PreferencesMenu` `isCurrentOptionsPage` function

- **MOD MENU** (Thanks again @KoloInDaCrib)
  - `FEATURE_KOLO_MODMENU` Feature Flag that adds the Mod Menu from [Kolo's Mod Menu PR](https://github.com/FunkinCrew/Funkin/pull/4223) (Thanks @KoloInDaCrib)

# [0.1.1] - 2025-10-15

## Changed

- 0 mods loaded PolymodHandler message

## Removed

- PolymodHandler "Installed mods have replaced # __ files" message

## Fixed

- Base game songs still being in the assets folder
- `0.1.0` changelog entry date
- Updated Title Texts:
  - "The Funkin Crew Inc" -> "VSE Crew"
  - "In association with" -> "Not in association with"
  - "Friday Night Funkin" / "Friday Nigth Funkin" -> "V Slice Engine"

# [0.1.0] - 2025-10-15

## Added

- `FUNKIN_MOD` Feature Flag controlling if the `funkin` mod should be included
- InitState Task Text (Not in sync but I think this can depend on ur pc, idk just a guess)
- Empty save check for base game save
- Define Util (Thanks @PurSnake)
- Main Menu Mod List (Thanks @Trofem)
- Hashlink (`lime test hl` / `lime build hl`) support (Thanks @NotHyper-474)
- `Friday Night Funkin (V-Slice Engine)` Credits

## Removed

- "killed line" msg in credits
- Polymod duplicate imports warning in the terminal
- Removed Level Libraries
- `CENSOR_EXPLETIVES` feature flag

## Fixed

- `assets/videos/videos/` folder (now just `assets/videos/`)
- Lag with more then 10(?) mods installed (Thanks @PurSnake)
- Prevent crash with missing credits.json with `-D NO_HARDCODED_CREDITS`

## Changed

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
