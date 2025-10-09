# PULL REQUESTS
Community members are welcome to contribute their changes by [opening pull requests](https://github.com/FunkinCrew/Funkin/pulls).
This section covers guidelines for opening and managing pull requests (PRs).

## Choosing a base branch
When creating a branch in your fork, base your branch on either the `develop` or `main` branch depending on the types of changes you want to make.

> [!CAUTION]
> Avoid using your fork's default branch (`main` in this case) for your PR. This is considered an [anti-pattern](https://jmeridth.com/posts/do-not-issue-pull-requests-from-your-master-branch/) by GitHub themselves!
> Instead, make a separate branch for your additions (ex. `docs/fix-typo` or `minor-bugfix`).

Choose the `develop` branch if you modify:
- Engine code (`.hx` files)
- Any other type of file

Choose the `main` branch if you modify:
- Documentation (`.md` files)
- GitHub files (`.yml` files or anything in the `.github` folder, if it exists)

> [!TIP]
> When in doubt, base your branch on the `develop` branch.

Choosing the right base branch helps keep your commit history clean and avoid merge conflicts.
Once you’re satisfied with the changes you’ve made, open a PR and base it on the same branch you previously chose.

## Maintaining your pull request
Keeping your pull request clean and easy to review increases the chance that it will be accepted!

Our maintenance policy is as follows:
- If your PR requires changes you will get a label saying so.
- We may also leave a comment under your PR specifying what changes you should make.
- If you receive a comment, you have 90 days to implement the requested changes.
- After this period, your PR will be closed due to inactivity and labeled `status: stale`.
- Even after your PR is closed, you may request for us to reopen it. Just be sure to address the issues!

This policy ensures that PRs awaiting review are up to date and ready to merge.

### Merge conflicts and rebasing
Some engine updates introduce significant breaking changes that may create merge conflicts in your PR. To resolve them, you will need to update or rebase your PR.

Most merge conflicts are small and will only require you to modify a few files to resolve them.
However, some changes are so big that your commit history will be a total mess!
In this case, you will have to perform a [**rebase**](https://docs.github.com/en/get-started/using-git/about-git-rebase).
This process reapplies your changes on top of the updated branch and cleanly resolves the merge conflicts.

> [!TIP]
> If your commit history becomes too long, you can use rebase to `squash` your PR's commits into a single commit.

## Code PRs

> [!IMPORTANT]
> This guide does not cover compiling. If you have trouble compiling the game, refer to the [Compilation Guide](https://github.com/FunkinCrew/Funkin/blob/main/docs/COMPILING.md).

Code-based PRs make changes such as **fixing bugs** or **implementing new features** in the game.

This involves modifying one or several of the repository’s `.hx` files, found within the `source/` folder.

### Codestyle
Before submitting your PR, check that your code follows the [Style Guide](https://github.com/FunkinCrew/Funkin/blob/main/docs/style-guide.md). This keeps your code consistent with the rest of the codebase!

### Code comments
Code comments help others understand your changes, so the way you write them is important!
Here are some guidelines for writing comments in your code:
- Leave comments only when you believe a piece of code warrants explanation. If a piece of code is self-explanatory, it does not need a comment.
- Ensure that your comments provide meaningful insight into the function or purpose of the code.
- Write your comments in a clear and concise manner.
- Only sign your comments with your name when your changes are complex and may require further explanation.

### Example code comments
#### DO NOT:
Below are examples of what you SHOULD NOT do when writing code comments.
```haxe
/**
  * jumps around the song
  * works with bpm changes but skipped notes still hurt
  * @param sections how many sections to jump, negative = backwards
  */
function changeSection(sections:Int):Void
{
  // Pause the music, as you probably guessed
  // FlxG.sound.music.pause();

  // Set the target time in steps, I don’t really get how this works though lol - [GitHub username]
  var targetTimeSteps:Float = Conductor.instance.currentStepTime + (Conductor.instance.stepsPerMeasure * sections);
  var targetTimeMs:Float = Conductor.instance.getStepTimeInMs(targetTimeSteps);

  // Don't go back in time to before the song started, that would probably break a lot of things and cause a bunch of problems!
  targetTimeMs = Math.max(0, targetTimeMs);

  if (FlxG.sound.music != null) // If the music is not null, set the time to the target time
  {
    FlxG.sound.music.time = targetTimeMs;
  }

  // Handle skipped notes and events and all that jazz
  handleSkippedNotes();
  SongEventRegistry.handleSkippedEvents(songEvents, Conductor.instance.songPosition);
  // regenNoteData(FlxG.sound.music.time);

  Conductor.instance.update(FlxG.sound?.music?.time ?? 0.0);

  // I hate this function - [GitHub username]
  resyncVocals();
}
```

```haxe
// End the song when the music is complete.
FlxG.sound.music.onComplete = function() {
  endSong(skipEndingTransition);
};
// A negative instrumental offset means the song skips the first few milliseconds of the track.
// This just gets added into the startTimestamp behavior so we don't need to do anything extra.
FlxG.sound.music.play(true, Math.max(0, startTimestamp - Conductor.instance.combinedOffset));
FlxG.sound.music.pitch = playbackRate;

// Prevent the volume from being wrong.
FlxG.sound.music.volume = 1.0;
// IF fadetween is not null we cancel it
if (FlxG.sound.music.fadeTween != null) FlxG.sound.music.fadeTween.cancel();

// Play the vocals
trace('Playing vocals...');
// Add the vocals
add(vocals);
// Play the vocals for real this time lol
vocals.play();
// Set the vocals volume
vocals.volume = 1.0;
// Set the vocals pitch
vocals.pitch = playbackRate;
// Set the vocals time to the music time
vocals.time = FlxG.sound.music.time;
// trace('${FlxG.sound.music.time}');
// trace('${vocals.time}');
// functionThatWasntHereBeforeThisPRorSomethingIdKLOL();
/* testsprite = new FlxSprite(0, 0);
testsprite.loadGraphic(Paths.image('test'));
testsprite.screenCenter();
add(testsprite); */

// Me too [GitHub username] I hate this function it gave me pain and suffering - Girlfriend
resyncVocals();
```

```haxe
#if FEATURE_DEBUG_FUNCTIONS
// PAGEUP: who knows what this does
// SHIFT+PAGEUP: There will be dire consequences.
if (FlxG.keys.justPressed.PAGEUP) changeSection(FlxG.keys.pressed.SHIFT ? 20 : 2);
// PAGEUP: who knows what this does
// SHIFT+PAGEUP: There will be dire consequences.
if (FlxG.keys.justPressed.PAGEDOWN) changeSection(FlxG.keys.pressed.SHIFT ? -20 : -2);
#end
```

#### DO:
Below are examples on what you SHOULD do when writing code comments.
```haxe
/**
  * Jumps forward or backward a number of sections in the song.
  * Accounts for BPM changes, does not prevent death from skipped notes.
  * @param sections The number of sections to jump, negative to go backwards.
  */
function changeSection(sections:Int):Void
{
  var targetTimeSteps:Float = Conductor.instance.currentStepTime + (Conductor.instance.stepsPerMeasure * sections);
  var targetTimeMs:Float = Conductor.instance.getStepTimeInMs(targetTimeSteps);

  // Don't go back in time to before the song started.
  targetTimeMs = Math.max(0, targetTimeMs);

  if (FlxG.sound.music != null)
  {
    FlxG.sound.music.time = targetTimeMs;
  }

  handleSkippedNotes();
  SongEventRegistry.handleSkippedEvents(songEvents, Conductor.instance.songPosition);

  Conductor.instance.update(FlxG.sound?.music?.time ?? 0.0);

  resyncVocals();
}
```

```haxe
FlxG.sound.music.onComplete = function() {
  endSong(skipEndingTransition);
};
// A negative instrumental offset means the song skips the first few milliseconds of the track.
// This just gets added into the startTimestamp behavior so we don't need to do anything extra.
FlxG.sound.music.play(true, Math.max(0, startTimestamp - Conductor.instance.combinedOffset));
FlxG.sound.music.pitch = playbackRate;

// Prevent the volume from being wrong.
FlxG.sound.music.volume = 1.0;
if (FlxG.sound.music.fadeTween != null) FlxG.sound.music.fadeTween.cancel();

trace('Playing vocals...');
add(vocals);
vocals.play();
vocals.volume = 1.0;
vocals.pitch = playbackRate;
vocals.time = FlxG.sound.music.time;
resyncVocals();
```

```haxe
#if FEATURE_DEBUG_FUNCTIONS
// PAGEUP: Skip forward two sections.
// SHIFT+PAGEUP: Skip forward twenty sections.
if (FlxG.keys.justPressed.PAGEUP) changeSection(FlxG.keys.pressed.SHIFT ? 20 : 2);
// PAGEDOWN: Skip backward two section. Doesn't replace notes.
// SHIFT+PAGEDOWN: Skip backward twenty sections.
if (FlxG.keys.justPressed.PAGEDOWN) changeSection(FlxG.keys.pressed.SHIFT ? -20 : -2);
#end
```

## Documentation PRs
Documentation-based PRs make changes such as **fixing typos** or **adding new information** in documentation files.

This involves modifying one or several of the repository’s `.md` files, found throughout the repository.

Make sure your changes are easy to understand and formatted consistently to maximize clarity and readability.

> [!CAUTION]
> DO NOT TOUCH THE `LICENSE.md` FILE, EVEN TO MAKE SMALL CHANGES!

### Example Documentation PR
#### DO NOT:
```
// The original documentation
- `F2`: ***OVERLAY***: Enables the Flixel debug overlay, which has partial support for scripting.
- `F3`: ***SCREENSHOT***: Takes a screenshot of the game and saves it to the local `screenshots` directory. Works outside of debug builds too!
- `F4`: ***EJECT***: Forcibly switch state to the Main Menu (with no extra transition). Useful if you're stuck in a level and you need to get out!
- `F5`: ***HOT RELOAD***: Forcibly reload the game's scripts and data files, then restart the current state. If any files in the `assets` folder have been modified, the game should process the changes for you! NOTE: Known bug, this does not reset song charts or song scripts, but it should reset everything else (such as stage layout data and character animation data).
- `CTRL-SHIFT-L`: ***FORCE CRASH***: Immediately crash the game with a detailed crash log and a stack trace.

// The new PR additions
- `ctrl alt shift e`: No idea what this does
- `alt-f4`: closes the game
```

#### DO:
```
// The original documentation
- `F2`: ***OVERLAY***: Enables the Flixel debug overlay, which has partial support for scripting.
- `F3`: ***SCREENSHOT***: Takes a screenshot of the game and saves it to the local `screenshots` directory. Works outside of debug builds too!
- `F4`: ***EJECT***: Forcibly switch state to the Main Menu (with no extra transition). Useful if you're stuck in a level and you need to get out!
- `F5`: ***HOT RELOAD***: Forcibly reload the game's scripts and data files, then restart the current state. If any files in the `assets` folder have been modified, the game should process the changes for you! NOTE: Known bug, this does not reset song charts or song scripts, but it should reset everything else (such as stage layout data and character animation data).
- `CTRL-SHIFT-L`: ***FORCE CRASH***: Immediately crash the game with a detailed crash log and a stack trace.

// The new PR additions
- `CTRL-ALT-SHIFT-E`: ***DUMP SAVE DATA***: Prompts the user to save their save data as a JSON file, so its contents can be viewed. Only available on debug builds.
- `ALT-F4`: ***CLOSE GAME***: Closes the game forcibly on Windows.
```

## GitHub PRs
GitHub-related PRs make changes such as **tweaking Issue Templates** or **updating the repository’s workflows**.

This involves modifying one or several of the repository’s `.yml` files, or any other file in the `.github` folder.

Please test these changes on your fork’s main branch to avoid breaking anything in this repository (e.g. GitHub Actions, issue templates, etc.)!
