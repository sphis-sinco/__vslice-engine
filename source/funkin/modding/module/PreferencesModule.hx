package funkin.modding.module;

import funkin.ui.options.PreferencesMenu;

/**
 * A simple class to make the process of adding preferences easier via
 * a class that already does the base functions
 */
class PreferencesModule extends Module
{
  public var addedNewPreferences:Bool = false;

  override public function onUpdate(event:UpdateScriptEvent):Void
  {
    if (!PreferencesMenu.isCurrentOptionsPage() && addedNewPreferences)
    {
      addedNewPreferences = false;
      resetPreferencesValue();
    }

    if (PreferencesMenu.isCurrentOptionsPage() && !addedNewPreferences)
    {
      addedNewPreferences = true;
      addPreferences();
    }
  }

  /**
   * This is where the scripts should reset values that are only important with `addPreferences`
   */
  public function resetPreferencesValue():Void {}

  /**
   * This is where the scripts should add their preferences
   */
  public function addPreferences():Void {}
}
