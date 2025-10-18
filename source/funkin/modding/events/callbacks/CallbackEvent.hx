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
  public var onCreate:(eventdata:CallbackEventData) -> Void;

  /**
   * Called when `update` is done (For the state)
   */
  public var onUpdate:(eventdata:CallbackEventData) -> Void;

  /**
   * Custom callback that scripts can make
   */
  public var onCall:(id:String, eventdata:CallbackEventData) -> Void;

  public function new(id:String)
  {
    this.id = id;
  }

  public function toString():String
  {
    var functions = [];

    if (onInit != null) functions.push('onInit');
    if (onCreate != null) functions.push('onCreate(eventdata.id=${onCreate.eventdata.id})');
    if (onUpdate != null) functions.push('onUpdate(eventdata.id=${onUpdate.eventdata.id})');
    if (onCall != null) functions.push('onCall(id=${onCall.id}, eventdata.id=${onCall.eventdata.id})');

    return 'CallbackEvent(id=${this.id}, functions=${functions})';
  }
}
