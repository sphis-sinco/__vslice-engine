package funkin.modding.events.callbacks;

import polymod.hscript.HScriptedClass;

/**
 * A script that can be tied to a CallbackEvent, which persists across states.
 * Create a scripted class that extends CallbackEvent to use this.
 */
@:hscriptClass
class ScriptedCallbackEvent<T> extends CallbackEvent<T> implements HScriptedClass {}
