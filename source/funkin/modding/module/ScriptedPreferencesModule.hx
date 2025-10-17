package funkin.modding.module;

import polymod.hscript.HScriptedClass;

/**
 * A script that can be tied to a PreferencesModule, which persists across states.
 * Create a scripted class that extends PreferencesModule to use this.
 */
@:hscriptClass
class ScriptedPreferencesModule extends PreferencesModule implements HScriptedClass {}
