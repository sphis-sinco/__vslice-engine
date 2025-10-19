package funkin.modding.events.callbacks;

/**
 * `CallbackEventData` data generator for different classes
 */
class CallbackEventDataGenerator
{
  /**
   * Generates event data for `funkin.play.PauseSubState`
   * @param pauseSubState `funkin.play.PauseSubState` class
   * @return Dynamic
   */
  public static function generatePauseData(pauseSubState:funkin.play.PauseSubState):Dynamic
  {
    return {
      pauseSubState: pauseSubState,

      PAUSE_MENU_ENTRIES_STANDARD: pauseSubState.PAUSE_MENU_ENTRIES_STANDARD,
      PAUSE_MENU_ENTRIES_CHARTING: pauseSubState.PAUSE_MENU_ENTRIES_CHARTING,
      PAUSE_MENU_ENTRIES_DIFFICULTY: pauseSubState.PAUSE_MENU_ENTRIES_DIFFICULTY,
      PAUSE_MENU_ENTRIES_VIDEO_CUTSCENE: pauseSubState.PAUSE_MENU_ENTRIES_VIDEO_CUTSCENE,
      PAUSE_MENU_ENTRIES_CONVERSATION: pauseSubState.PAUSE_MENU_ENTRIES_CONVERSATION,

      currentMenuEntries: pauseSubState.currentMenuEntries,
      currentEntry: pauseSubState.currentEntry,
      currentMode: pauseSubState.currentMode,

      background: pauseSubState.background,

      metadata: pauseSubState.metadata,
      metadataPractice: pauseSubState.metadataPractice,
      metadataDeaths: pauseSubState.metadataDeaths,
      metadataArtist: pauseSubState.metadata,

      offsetText: pauseSubState.offsetText,
      offsetTextInfo: pauseSubState.offsetTextInfo,

      menuEntryText: pauseSubState.menuEntryText,
    }
  }

  /**
   * Generates event data for `funkin.play.ResultState`
   * @param resultState `funkin.play.ResultState` class
   * @return Dynamic
   */
  public static function generateResultsData(resultState:funkin.play.ResultState):Dynamic
  {
    return {
      resultState: resultState,

      params: resultState.params,
      rank: resultState.rank,
      songName: resultState.songName,

      characterAtlasAnimations: resultState.characterAtlasAnimations,
      characterSparrowAnimations: resultState.characterSparrowAnimations,

      playerCharacterId: resultState.playerCharacterId,
      playerCharacter: resultState.playerCharacter,

      introMusicAudio: resultState.introMusicAudio,
    }
  }

  /**
   * Generates event data for `funkin.ui.credits.CreditsState`
   * @param credits `funkin.ui.credits.CreditsState` class
   * @return Dynamic
   */
  public static function generateCreditsStateData(credits:funkin.ui.credits.CreditsState):Dynamic
  {
    return {
      credits: credits,

      leftWatermarkText: credits.leftWatermarkText,
      rightWatermarkText: credits.rightWatermarkText,

      curBeat: credits.conductorInUse.currentBeat,
      curStep: credits.conductorInUse.currentStep,

      entriesToBuild: credits.entriesToBuild,

      scrollPaused: credits.scrollPaused,
    }
  }

  /**
   * Generates event data for `funkin.ui.freeplay.FreeplayState`
   * @param freeplay `funkin.ui.freeplay.FreeplayState` class
   * @return Dynamic
   */
  public static function generateFreeplayData(freeplay:funkin.ui.freeplay.FreeplayState):Dynamic
  {
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
      styleData: freeplay.styleData
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
      rightWatermarkText: musicBeatState.rightWatermarkText,

      curBeat: musicBeatState.conductorInUse.currentBeat,
      curStep: musicBeatState.conductorInUse.currentStep,
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
      rightWatermarkText: musicBeatSubState.rightWatermarkText,

      curBeat: musicBeatSubState.conductorInUse.currentBeat,
      curStep: musicBeatSubState.conductorInUse.currentStep,
    }
  }
}
