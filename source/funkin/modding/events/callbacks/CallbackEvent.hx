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

  public function toString():String
  {
    var functions = [];

    if (onInit != null) functions.push('onInit');
    if (onCreate != null) functions.push('onCreate');
    if (onUpdate != null) functions.push('onUpdate');

    return 'CallbackEvent(id=${this.id}, functions=${functions})';
  }
}
