package funkin.modding.events.callbacks;

class CallbackScriptEvent<T> extends ScriptEvent
{
  public var callbackEventHolder:CallbackEventHolder<T>;

  override public function new(typeID:Int = 0, callbackEventHolder:CallbackEventHolder<T>)
  {
    var type:ScriptEventType = switch (typeID)
    {
      case 1:
        CALLBACKSCRIPTEVENT_CREATE

      case 2:
        CALLBACKSCRIPTEVENT_UPDATE

      case 3:
        CALLBACKSCRIPTHOLDER_NEW

      default:
        CALLBACKSCRIPTEVENT_INIT
    };

    this.callbackEventHolder = callbackEventHolder;

    super(type, false);
  }
}
