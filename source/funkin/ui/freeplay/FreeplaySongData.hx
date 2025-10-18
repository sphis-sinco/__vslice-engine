package funkin.ui.freeplay;

import funkin.save.Save;
import funkin.ui.story.Level;
import funkin.play.scoring.Scoring.ScoringRank;
import funkin.play.song.Song;
import funkin.data.song.SongRegistry;

/**
 * Data about a specific song in the freeplay menu.
 */
@:nullSafety
class FreeplaySongData
{
  /**
   * We used to have a billion fields, but this SongMetadata variable should be all we need
   * to be able to get most information about an available song.
   * For example, you can get the artist via `data.songArtist`
   *
   * You can usually get various other particulars of a specific difficulty/variation by
   * using data.getDifficulty(), and inputting specifics on your difficulty, variations, etc.
   * See the getters here for songCharacter, fullSongName, and songStartingBpm for examples.
   *
   * @see Song
   */
  public var data(get, never):Song;

  function get_data():Song
  {
    // This looks jank but the haxe compiler is on crack or something so 2 `privateAccess` lines are needed for some reason
    @:privateAccess
    var song:Null<Song> = SongRegistry.instance.fetchEntry(songId, {variation: curVariation});
    @:privateAccess
    if (song == null) throw 'Song entry not found for id: $songId with variation: ${curVariation}';

    return song;
  }

  /**
   * The current variation to use in various property functions.
   */
  var curVariation(get, never):String;

  /**
   * The level id of the song, useful for sorting from week1 -> week 7 + weekend1
   * and for properly loading PlayStatePlaylist for preloading on web
   */
  public var levelId(get, never):Null<String>;

  function get_levelId():Null<String>
  {
    return _levelId;
  }

  var _levelId:String;

  final songId:String;

  /**
   * Whether or not the song has been favorited.
   */
  public var isFav(get, never):Bool;

  /**
   * Whether the player has seen/played this song before within freeplay
   */
  public var isNew(get, never):Bool;

  /**
   * The default opponent for the song.
   * Does the getter stuff for you depending on your current (or rather, rememberd) variation and difficulty.
   */
  public var songCharacter(get, never):String;

  /**
   * The full song name, dynamically generated depending on your current (or rather, rememberd) variation and difficulty.
   */
  public var fullSongName(get, never):String;

  /**
   * The song's id and variation, combined with a colon. Dynamically generated depending on your current (or rather, rememberd) variation and difficulty.
   */
  public var idAndVariation(get, never):String;

  /**
   * The starting BPM of the song, dynamically generated depending on your current (or rather, rememberd) variation and difficulty.
   */
  public var songStartingBpm(get, never):Float;

  public var difficultyRating(get, never):Int;

  public var scoringRank(get, never):Null<ScoringRank>;

  public var instance:FreeplayState;

  public function new(songId:String, levelData:Level, instance:FreeplayState)
  {
    this.songId = songId;
    _levelId = levelData.id;
    this.instance = instance;
  }

  /**
   * Toggle whether or not the song is favorited, then flush to save data.
   * @return Whether or not the song is now favorited.
   */
  public function toggleFavorite():Bool
  {
    if (isFav)
    {
      Save.instance.unfavoriteSong(idAndVariation);
    }
    else
    {
      Save.instance.favoriteSong(idAndVariation);
    }
    return isFav;
  }

  function updateValues(variations:Array<String>):Void
  {
    // this.isNew = song.isSongNew(suffixedDifficulty);
  }

  function get_idAndVariation()
  {
    return '${data.id}:${curVariation}';
  }

  function get_isFav():Bool
  {
    return Save.instance.isSongFavorited(idAndVariation);
  }

  public function isDifficultyNew(difficulty:String):Bool
  {
    // grabs a specific difficulty's new status. used for the difficulty dots.

    return data.isSongNew(difficulty, curVariation);
  }

  function get_isNew():Bool
  {
    // We use a slightly different manner to get the new status of a song than the other getters here
    // `isSongNew()` only takes a single variation, and it's data that isn't accessible via the Song data/metadata
    // it's stored in the song .hxc script in a function that overrides `isSongNew()`
    // and is only accessible with the correct valid variation inputs

    return data.isSongNew(FreeplayState.rememberedDifficulty, curVariation);
  }

  function get_songCharacter():String
  {
    var variations:Array<String> = data.getVariationsByCharacterId(FreeplayState.rememberedCharacterId);
    return data.getDifficulty(FreeplayState.rememberedDifficulty, null, variations)?.characters.opponent ?? '';
  }

  function get_fullSongName():String
  {
    var variations:Array<String> = data.getVariationsByCharacterId(FreeplayState.rememberedCharacterId);

    return data.getDifficulty(FreeplayState.rememberedDifficulty, null, variations)?.songName ?? data.songName;
  }

  function get_songStartingBpm():Float
  {
    var variations:Array<String> = data.getVariationsByCharacterId(FreeplayState.rememberedCharacterId);

    return data.getDifficulty(FreeplayState.rememberedDifficulty, null, variations)?.getStartingBPM() ?? 0;
  }

  function get_difficultyRating():Int
  {
    var variations:Array<String> = data.getVariationsByCharacterId(FreeplayState.rememberedCharacterId);
    return data.getDifficulty(FreeplayState.rememberedDifficulty, null, variations)?.difficultyRating ?? 0;
  }

  function get_scoringRank():Null<ScoringRank>
  {
    return Save.instance.getSongRank(data.id, FreeplayState.rememberedDifficulty, curVariation);
  }

  function get_curVariation():String
  {
    // Temporarily fetch the song to check for the first valid variation of it.
    // For example if the current character is bf, for songs such as darnell we want to use the 'bf' variation instead of 'normal'.
    var song:Null<Song> = SongRegistry.instance.fetchEntry(songId);
    if (song == null) throw 'Song entry not found for id: $songId';

    var variations:Array<String> = song.getVariationsByCharacterId(FreeplayState.rememberedCharacterId);
    var variation:Null<String> = song.getFirstValidVariation(FreeplayState.rememberedDifficulty, null, variations);
    if (variation == null) variation = Constants.DEFAULT_VARIATION;

    return variation;
  }
}
