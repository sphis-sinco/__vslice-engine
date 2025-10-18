package funkin.modding.events.callbacks;

class CallbackScriptEvent extends ScriptEvent
{
  public var callbackEventHolder:CallbackEventHolder<Any>;

  override public function new(typeID:Int = 0, callbackEventHolder:CallbackEventHolder<Any>)
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

    this.callbackEventHolder = callbackEventHolder;

    super(type, false);
  }
}
