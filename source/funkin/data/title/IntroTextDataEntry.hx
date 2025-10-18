package funkin.data.title;

/**
 * A typedef for json intro text entries
 */
typedef IntroTextDataEntry =
{
  /**
   * First entry of the intro text
   */
  public var firstText:String;

  /**
   * Second entry of the intro text
   */
  public var secondText:String;

  /**
   * Depending on the value it controls if the entry will be included
   */
  @:optional
  @:default('both')
  public var filter:String;
}
