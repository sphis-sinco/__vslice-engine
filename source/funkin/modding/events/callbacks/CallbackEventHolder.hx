package funkin.modding.events.callbacks;

/**
 * A simple manager for `CallbackEvent` so each state won't require a unique one
 */
class CallbackEventManager<T>
{
  public function new()
  {
    callbackEvents = [];

    var scriptedCENames:Array<String> = ScriptedCallbackEvent.listScriptClasses();
    trace('  Instantiating ${scriptedCENames.length} callback events...');
    for (scriptedCE in scriptedCENames)
    {
      var newEvent = ScriptedCallbackEvent.init(scriptedCE, scriptedCE);

      if (newEvent != null)
      {
        trace('    Loaded callback event: ${scriptedCE}');

        addCallbackEvent(newEvent);
      }
      else
      {
        trace('    Failed to instantiate callback event: ${scriptedCE}');
      }
    }
  }

  /**
   * A container with all the callback events
   */
  public var callbackEvents:Array<CallbackEvent<T>>;

  /**
   * Easy function to add callback events
   * without having to worry about referencing the Array
   * @param event The callback event you wanna add
   */
  public function addCallbackEvent(event:CallbackEvent<T>):Void
  {
    callbackEvents.push(event);
  }
}
