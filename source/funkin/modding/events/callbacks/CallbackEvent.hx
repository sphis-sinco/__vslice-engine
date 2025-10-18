package funkin.modding.events.callbacks;

import flixel.FlxState;

/**
 * Callback event to allow scripts to do things in other states without requiring instances
 */
class CallbackEvent
{
  /**
   * Unique ID for this Callback Event that also will be used in `CallbackEventHolder` to prevent dupe events
   */
  public var id:String;

  /**
   * Called when added to a `CallbackEventHolder`
   */
  public var onInit:Void->Void;

  /**
   * Called when `create` is done (For the state)
   */
  public var onCreate:(data:Dynamic) -> Void;

  /**
   * Called when `update` is done (For the state)
   */
  public var onUpdate:(data:Dynamic) -> Void;

  public function new(id:String)
  {
    this.id = id;
  }
}
