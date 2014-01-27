package 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class Mandelbrot extends Fractal
	{
		public function Mandelbrot(){}
		public override function getCycles( r:Number , i:Number ):uint
		{
			var zr:Number = 0;
			var zi:Number = 0;
			var cr:Number = r;
			var ci:Number = i;
			var ozr:Number = 0;
			var ozi:Number = 0;
			var zrsq:Number = 0;
			var zisq:Number = 0;

			for (var a:int = 0; a < CYCLES; a++)
			{
				zi = ozr * ozi * 2 + ci;
				zr = zrsq - zisq + cr;
				zrsq = zr * zr;
				zisq = zi * zi;
				ozr = zr;
				ozi = zi;
				if ( ( zrsq + zisq ) > 4 )
				{
					break;
				}
			}
			return a;
		}
	}
}