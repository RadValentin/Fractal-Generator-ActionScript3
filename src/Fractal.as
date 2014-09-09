package
{
  import flash.display.Sprite;
  import flash.display.Bitmap;
  import flash.display.BitmapData;

  public class Fractal extends Sprite
  {
    protected static var DWTH:Number = 705;
    protected static var DHTH:Number = 610;
    protected static var CYCLES:Number = 128;
    protected var bitmapData:BitmapData;

    public function Fractal(){}
    public function init(cyc:Number, xmin:Number, xmax:Number, ymin:Number, ymax:Number):void
    {
      CYCLES = cyc;
      var setBitmap:Bitmap = new Bitmap( );
      bitmapData = new BitmapData(DWTH,DHTH,false,0x000000);
      setBitmap.bitmapData = bitmapData;
      addChild( setBitmap );
      drawSet( xmin , xmax , ymin , ymax );
    }
    public function drawSet(rmin:Number, rmax:Number, imin:Number, imax:Number ):void
    {
      var rStep:Number = ( rmax - rmin ) / DWTH;
      var iStep:Number = ( imax - imin ) / DHTH;
      var r:Number;
      var i:Number;
      for (var px:int = 0; px < DWTH; px++)
      {
        r = rmin + px * rStep;
        for (var py:int = 0; py < DHTH; py++)
        {
          i = imin + py * iStep;
          var color:uint;
          var cycles:int = getCycles(r,i);
          if ( cycles == CYCLES )
          {
            color = 0x000000;
          }
          else
          {
            color = cycles << 12 | ( cycles + 128 ) << 8 | cycles << 4;
          }
          bitmapData.setPixel( px , py , color );
        }
      }
    }
    public function getCycles( r:Number , i:Number ):uint
    {
      return 0;
    }
  }
}
