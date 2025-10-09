package;

#if macro
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
#end
#if (linux && !macro)
#if cpp
import hxgamemode.GamemodeClient;
#end

@:image('art/icons/iconOG.png')
class ApplicationIcon extends lime.graphics.Image {}
#end

@:access(lime.app.Application)
@:access(lime.system.System)
@:access(openfl.display.Stage)
@:access(openfl.events.UncaughtErrorEvents)
@:dox(hide)
class ApplicationMain
{
  #if !macro
  public static function main()
  {
    lime.system.System.__registerEntryPoint("::APP_FILE::", create);

    #if (js && html5)
    #if (munit || (utest && openfl_enable_utest_legacy_mode))
    lime.system.System.embed("::APP_FILE::", null,::WIN_WIDTH::,::WIN_HEIGHT:: );
    #end
    #else
    create(null);
    #end
  }

  public static function create(config):Void
  {
    final appMeta:Map<String, String> = [];

    appMeta.set("build", "::meta.buildNumber::");
    appMeta.set("company", "::meta.company::");
    appMeta.set("file", "::APP_FILE::");
    appMeta.set("name", "::meta.title::");
    appMeta.set("packageName", "::meta.packageName::");
    appMeta.set("version", "::meta.version::");

    ::
    if (config.hxtelemetry != null)
    ::#if hxtelemetry appMeta.set("hxtelemetry-allocations", "::config.hxtelemetry.allocations::");
    appMeta.set("hxtelemetry-host", "::config.hxtelemetry.host::"); #end::
    end::var app = new openfl.display.Application(appMeta);

    #if linux
    app.onCreateWindow.add(function(window:lime.ui.Window):Void {
      window.setIcon(new ApplicationIcon());
    });
    #if cpp
    GamemodeClient.request_start();
    #end
    #end

    #if !disable_preloader_assets
    ManifestResources.init(config);
    #end

    #if !flash
    ::foreach windows::var attributes:lime.ui.WindowAttributes =
      {
        allowHighDPI:::allowHighDPI::,
        alwaysOnTop:::alwaysOnTop::,
        borderless:::borderless::,
        // display: ::display::,
        element: null,
        frameRate:::fps::,
        #if !web
        fullscreen:::fullscreen::,
        #end
        height:::height::,
        hidden: #if munit true #else ::hidden:: #end,
        maximized:::maximized::,
        minimized:::minimized::,
        parameters:::parameters::,
        resizable:::resizable::,
        title: "::title::",
        width:::width::,
        x:::x::,
        y:::y::,
      };

    attributes.context =
      {
        antialiasing:::antialiasing::,
        background:::background::,
        colorDepth:::colorDepth::,
        depth:::depthBuffer::,
        hardware:::hardware::,
        stencil:::stencilBuffer::,
        type: null,
        vsync:::vsync::
      };

    if (app.window == null)
    {
      if (config != null)
      {
        for (field in Reflect.fields(config))
        {
          if (Reflect.hasField(attributes, field))
          {
            Reflect.setField(attributes, field, Reflect.field(config, field));
          }
          else if (Reflect.hasField(attributes.context, field))
          {
            Reflect.setField(attributes.context, field, Reflect.field(config, field));
          }
        }
      }

      #if sys
      lime.system.System.__parseArguments(attributes);
      #end
    }

    app.createWindow(attributes);
    ::end::
    #elseif air
    app.window.title = "::meta.title::";
    #else
    app.window.context.attributes.background =::WIN_BACKGROUND::;
    app.window.frameRate =::WIN_FPS::;
    #end

    #if (windows && cpp)
    // Disable the Windows "ghosting" effect that dims unresponsive windows.
    funkin.external.windows.WinAPI.disableWindowsGhosting();

    // Disable Windows error reporting (avoids sending bug reports to Microsoft).
    funkin.external.windows.WinAPI.disableErrorReporting();

    // Enable dark mode if the system theme is set to dark.
    if (funkin.external.windows.WinAPI.isSystemDarkMode())
    {
      funkin.external.windows.WinAPI.setDarkMode(true);
    }
    #end

    var preloader = getPreloader();
    app.preloader.onProgress.add(function(loaded, total) {
      @:privateAccess preloader.update(loaded, total);
    });
    app.preloader.onComplete.add(function() {
      @:privateAccess preloader.start();
    });

    preloader.onComplete.add(start.bind((cast app.window : openfl.display.Window).stage));

    #if !disable_preloader_assets
    for (library in ManifestResources.preloadLibraries)
    {
      app.preloader.addLibrary(library);
    }

    for (name in ManifestResources.preloadLibraryNames)
    {
      app.preloader.addLibraryName(name);
    }
    #end

    app.preloader.load();

    var result = app.exec();

    #if (sys && !ios && !nodejs && !emscripten)
    lime.system.System.exit(result);
    #end

    #if (linux && cpp)
    GamemodeClient.request_end();
    #end
  }
