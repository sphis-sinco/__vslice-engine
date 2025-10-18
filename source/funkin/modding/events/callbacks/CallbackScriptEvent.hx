package funkin.modding.events.callbacks;

class CallbackScriptEvent extends ScriptEvent
{
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

      default:
        CALLBACKSCRIPTEVENT_INIT;
    };

    this.callbackEvent = callbackEvent;

    super(type, false);
  }
}
