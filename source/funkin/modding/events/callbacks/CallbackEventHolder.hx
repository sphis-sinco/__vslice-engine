package funkin.modding.events.callbacks;

/**
 * A simple manager for `CallbackEvent` so each state won't require a unique one
 */
class CallbackEventManager<T>
{
  public function new()
  {
    callbackEvents = [];
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
