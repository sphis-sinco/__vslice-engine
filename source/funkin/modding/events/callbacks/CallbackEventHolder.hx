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
   * and also prevents dupe events
   * @param event The callback event you wanna add
   */
  public function addCallbackEvent(event:CallbackEvent):Void
  {
    var proceed = true;

    for (callbackEvent in callbackEvents)
      if (event.id == callbackEvent.id && proceed) proceed = false;

    if (!proceed) return;

    callbackEvents.push(event);

    if (event.onInit != null)
    {
      event.onInit();
      ModuleHandler.callEvent(new CallbackScriptEvent(0, event));
    }
  }

  /**
   * Calls `onCreate` for all CE's
   * @param data custom data for onCreate
   */
  public function onCreate(data:Dynamic):Void
  {
    for (event in callbackEvents)
    {
      if (event.onCreate != null)
      {
        event.onCreate(data);
        ModuleHandler.callEvent(new CallbackScriptEvent(1, event));
      }
    }
  }

  /**
   * Calls `onUpdate` for all CE's
   * @param data custom data for onUpdate
   */
  public function onUpdate(data:Dynamic):Void
  {
    for (event in callbackEvents)
    {
      if (event.onUpdate != null)
      {
        event.onUpdate(data);
        ModuleHandler.callEvent(new CallbackScriptEvent(2, event));
      }
    }
  }

  /**
   * Calls `onCall` for all CE's
   * @param id custom callback id
   * @param data custom data for onCall
   */
  public function onCall(id:String, data:Dynamic):Void
  {
    for (event in callbackEvents)
    {
      if (event.onCall != null)
      {
        event.onCall(id, data);
        ModuleHandler.callEvent(new CallbackScriptEvent(4, event));
      }
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
