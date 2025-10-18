package funkin.ui.objects.pixelated_icon;

import funkin.data.animation.AnimationData;

/**
 * Additional data for PixelatedIcon
 */
typedef PixelatedIconData =
{
  /**
   * This is to change the origin.x and origin.y values,
   * most likely for bigger icons
   */
  @:optional
  @:default([100.0, 0.0])
  var origin:Null<Array<Float>>;

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
