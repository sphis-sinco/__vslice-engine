package funkin.modding.events.callbacks;

/**
 * A holder of data for `CallbackEvent` functions
 */
class CallbackEventData
{
  /**
   * A unique id to difference Callback Event Data Classes
   */
  public var id:String;

  /**
   * A container of custom data depending on the event
   */
  public var data:Dynamic;

  public function new(id:String, data:Dynamic)
  {
    this.id = id;
    this.data = data;
  }
}
