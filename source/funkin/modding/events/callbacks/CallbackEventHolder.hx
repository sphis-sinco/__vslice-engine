package funkin.modding.events.callbacks;

import funkin.modding.module.ModuleHandler;
import flixel.FlxState;
import flixel.util.FlxDestroyUtil.IFlxDestroyable;

/**
 * A simple manager for `CallbackEvent` so each state won't require a unique one
 */
class CallbackEventHolder implements IFlxDestroyable
{
  public function new()
  {
    callbackEvents = [];

    ModuleHandler.callEvent(new CallbackScriptEvent(3, null));
  }

  /**
   * A container with all the callback events
   */
  public var callbackEvents:Array<CallbackEvent>;

  /**
   * Easy function to add callback events
   * without having to worry about referencing the Array
   * @param event The callback event you wanna add
   */
  public function addCallbackEvent(event:CallbackEvent):Void
  {
    callbackEvents.push(event);

    event.onInit();
    ModuleHandler.callEvent(new CallbackScriptEvent(0, event));
  }

  /**
   * Calls `onCreate` for all CE's
   * @param data custom data for onCreate
   */
  public function onCreate(data:Dynamic = {}):Void
  {
    for (event in callbackEvents)
    {
      event.onCreate(data);
      ModuleHandler.callEvent(new CallbackScriptEvent(1, event));
    }
  }

  /**
   * Calls `onUpdate` for all CE's
   * @param data custom data for onUpdate
   * @param elapsed elapsed cause it's the update loop
   */
  public function onUpdate(data:Dynamic = {}):Void
  {
    for (event in callbackEvents)
    {
      event.onUpdate(data);
      ModuleHandler.callEvent(new CallbackScriptEvent(2, event));
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
