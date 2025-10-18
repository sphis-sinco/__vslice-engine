package funkin.modding.events.callbacks;

/**
 * `CallbackEventData` data generator for different classes
 */
class CallbackEventDataGenerator
{
  /**
   * Generates event data for `funkin.ui.MusicBeatState`
   * @param musicBeatState `funkin.ui.MusicBeatState` class
   * @return Dynamic
   */
  public static function generateMusicbeatStateData(musicBeatState:MusicBeatState):Dynamic
  {
    return {
      leftWatermarkText: musicBeatState.leftWatermarkText,
      rightWatermarkText: musicBeatState.rightWatermarkText,
    }
  }

  /**
   * Generates event data for `funkin.ui.MusicBeatSubState`
   * @param musicBeatSubState `funkin.ui.MusicBeatSubState` class
   * @return Dynamic
   */
  public static function generateMusicbeatSubStateData(musicBeatSubState:MusicBeatSubState):Dynamic
  {
    return {
      leftWatermarkText: musicBeatSubState.leftWatermarkText,
      rightWatermarkText: musicBeatSubState.rightWatermarkText,
    }
  }
}
