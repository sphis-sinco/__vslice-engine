package funkin.modding.events.callbacks;

/**
 * `CallbackEventData` data generator for different classes
 */
class CallbackEventDataGenerator
{
  /**
   * Generates event data for `funkin.ui.freeplay.FreeplayState`
   * @param freeplay `funkin.ui.freeplay.FreeplayState` class
   * @return Dynamic
   */
  public static function generateFreeplayData(freeplay:funkin.ui.freeplay.FreeplayState):Dynamic
  {
    @:privateAccess {
      return {
        subState: freeplay,

        songs: freeplay.songs,

        curSelected: freeplay.curSelected,
        currentDifficulty: freeplay.currentDifficulty,
        currentVariation: freeplay.currentVariation,
        currentCapsule: freeplay.currentCapsule,

        grpCapsules: freeplay.grpCapsules,

        dj: freeplay.dj,

        ostName: freeplay.ostName,
        albumRoll: freeplay.albumRoll,
        charSelectHint: freeplay.charSelectHint,

        currentCharacter: freeplay.currentCharacter,

        backingCard: freeplay.backingCard,
        backingImage: freeplay.backingImage,

        fromResultsParams: freeplay.fromResultsParams,
      }
    }
  }

  /**
   * Generates event data for `funkin.ui.MusicBeatState`
   * @param musicBeatState `funkin.ui.MusicBeatState` class
   * @return Dynamic
   */
  public static function generateMusicbeatStateData(musicBeatState:funkin.ui.MusicBeatState):Dynamic
  {
    return {
      state: musicBeatState,
      leftWatermarkText: musicBeatState.leftWatermarkText,
      rightWatermarkText: musicBeatState.rightWatermarkText
    }
  }

  /**
   * Generates event data for `funkin.ui.MusicBeatSubState`
   * @param musicBeatSubState `funkin.ui.MusicBeatSubState` class
   * @return Dynamic
   */
  public static function generateMusicbeatSubStateData(musicBeatSubState:funkin.ui.MusicBeatSubState):Dynamic
  {
    return {
      subState: musicBeatSubState,
      leftWatermarkText: musicBeatSubState.leftWatermarkText,
      rightWatermarkText: musicBeatSubState.rightWatermarkText
    }
  }
}
