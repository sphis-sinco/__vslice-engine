package funkin.ui.objects.pixelated_icon;

import funkin.data.animation.AnimationData;

/**
 * Additional data for PixelatedIcon
 */
typedef PixelatedIconData =
{
  /**
   * This is to change the image folder where the pixelated icon is found
   */
  @:optional
  @:default('freeplay/icons/')
  var iconPathPrefix:Null<String>;

  /**
   * This is to change the pixelated icon suffix,
   * probably to remove the `pixel` part at the end
   */
  @:optional
  @:default('pixel')
  var iconPathSuffix:Null<String>;

  /**
   * This is the new controller for if a pixelated icon is animated,
   * rather then looking for an xml
   */
  @:optional
  @:default(false)
  var animated:Null<Bool>;

  /**
   * This is to change the origin.x value,
   * most likely for bigger icons
   */
  @:optional
  @:default(100.0)
  var originX:Null<Float>;

  /**
   * This is to change the origin.y value,
   * most likely for bigger icons
   */
  @:optional
  @:default(100.0)
  var originY:Null<Float>;

  /**
   * This is to change the icon scale for VERY big icons
   */
  @:optional
  @:default(2.0)
  var scale:Null<Float>;

  /**
   * Additional animations to add ontop of the base animations
   */
  @:optional
  @:default([])
  var additionalAnimations:Array<AnimationData>;
}
