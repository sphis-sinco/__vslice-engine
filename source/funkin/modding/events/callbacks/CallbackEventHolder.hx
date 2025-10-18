package funkin.modding.events.callbacks;

import funkin.modding.module.ModuleHandler;
import flixel.util.FlxDestroyUtil.IFlxDestroyable;

/**
 * A simple manager for `CallbackEvent` so each state won't require a unique one
 */
class CallbackEventHolder<T> implements IFlxDestroyable
{
  public function new()
  {
    callbackEvents = [];

    ModuleHandler.callEvent(new CallbackScriptEvent<T>(3, null));
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

    event.onInit();
    ModuleHandler.callEvent(new CallbackScriptEvent<T>(0, event));
  }

  /**
   * Calls `onCreate` for all CE's
   * @param state current state
   */
  public function onCreate(state:T):Void
  {
    for (event in callbackEvents)
    {
      event.onCreate(state);
      ModuleHandler.callEvent(new CallbackScriptEvent<T>(1, event));
    }
  }

  /**
   * Calls `onUpdate` for all CE's
   * @param state current state
   * @param elapsed elapsed cause it's the update loop
   */
  public function onUpdate(state:T, elapsed:Float):Void
  {
    for (event in callbackEvents)
    {
      event.onUpdate(state, elapsed);
      ModuleHandler.callEvent(new CallbackScriptEvent<T>(2, event));
    }
  }

  /**
   *  Kill it.
   */
  public function destroy():Void
  {
    callbackEvents = [];
  }
}
