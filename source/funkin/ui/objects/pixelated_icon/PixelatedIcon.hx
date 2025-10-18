package funkin.ui.objects.pixelated_icon;

import funkin.graphics.FlxFilteredSprite;

/**
 * The icon that gets used for Freeplay capsules and char select
 * NOT to be confused with the CharIcon class, which is for the in-game icons
 */
@:nullSafety
class PixelatedIcon extends FlxFilteredSprite
{
  public function new(x:Float, y:Float)
  {
    super(x, y);
    this.makeGraphic(32, 32, 0x00000000);
    this.antialiasing = false;
    this.active = false;
  }

  /**
   * This will change the icon displayed
   * @param char the character ID you are searching for
   */
  public function setCharacter(char:String):Void
  {
    final PID:PixelatedIconData = cast Json.parse(Assets.getText(Paths.json('ui/pixelated_icons/' + char)));

    var charPath:String = PID?.iconPathPrefix ?? 'freeplay/icons/';

    final charIDParts:Array<String> = char.split("-");
    var iconName:String = "";
    var lastValidIconName:String = "";
    for (i in 0...charIDParts.length)
    {
      iconName += charIDParts[i];

      if (Assets.exists(Paths.image(charPath + '${iconName}${PID?.iconPathSuffix ?? 'pixel'}')))
      {
        lastValidIconName = iconName;
      }

      if (i < charIDParts.length - 1) iconName += '-';
    }

    charPath += '${lastValidIconName}${PID?.iconPathSuffix ?? 'pixel'}';

    if (!Assets.exists(Paths.image(charPath)))
    {
      trace('[WARN] Character ${char} has no freeplay icon.');
      this.visible = false;
      return;
    }
    else
    {
      this.visible = true;
    }

    var isAnimated = PID?.animated ?? false;

    if (isAnimated) this.frames = Paths.getSparrowAtlas(charPath);
    else
      this.loadGraphic(Paths.image(charPath));

    this.scale.x = this.scale.y = PID?.scale ?? 2;

    this.origin.x = PID?.origin[0] ?? 100;
    this.origin.y = PID?.origin[1] ?? 0;
  }

  if (isAnimated)
  {
    this.active = true;
    this.animation.addByPrefix('idle', 'idle0', 10, true);
    this.animation.addByPrefix('confirm', 'confirm0', 10, false);
    this.animation.addByPrefix('confirm-hold', 'confirm-hold0', 10, true);
    for (anim in PID?.additionalAnimations ?? [])
    {
      if (anim.assetPath == null) this.animation.addByPrefix(anim.name, anim.prefix, anim?.fps ?? 10, anim?.looped ?? false);
      else
        trace('PixelatedIcon does not support Multi-sparrow, you will have to merge animation: ${anim.name} into ${char}\'s icon')
    }
    this.animation.onFinish.add(function(name:String):Void {
      trace('Finish pixel animation: ${name}');
      if (this.animation._animations.contains(name + '-hold')) this.animation.play(name + '-hold');
    });
    this.animation.play('idle');
  }
}
