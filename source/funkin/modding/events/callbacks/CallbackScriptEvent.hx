package funkin.modding.events.callbacks;

/**
 * A class extending `funkin.modding.events.ScriptEvent` for Callback Event script events
 */
class CallbackScriptEvent extends ScriptEvent
{
  /**
   * A variable to represent the event calling the script event
   */
  public var callbackEvent:CallbackEvent;

  override public function new(typeID:Int = 0, callbackEvent:CallbackEvent)
  {
    var type:ScriptEventType = switch (typeID)
    {
      case 1:
        CALLBACKSCRIPTEVENT_CREATE;

      case 2:
        CALLBACKSCRIPTEVENT_UPDATE;

      case 3:
        CALLBACKSCRIPTHOLDER_NEW;

      case 4:
        CALLBACKSCRIPTEVENT_CUSTOM;

      default:
        CALLBACKSCRIPTEVENT_INIT;
    };

    this.callbackEvent = callbackEvent;

    super(type, false);
  }

  override public function toString():String
    return 'CallbackScriptEvent(type=${this.type}, cancelable=${this.cancelable}, event=${this.callbackEvent})';
}
