package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	
	import BurningShip;
	import Mandelbrot;
	import Chaosbrot;

	public class FractalGenerator extends MovieClip
	{		
		var xmin:Number = -2;
		var xmax:Number = 2;
		var ymin:Number = -2;
		var ymax:Number = 2;
		var cycles:Number = 128;		
		var mandelbrot; //fractal
		
		public function FractalGenerator()
		{
			//initialize correct fractal type
			var fractalType:String = root.loaderInfo.parameters.type as String;
			
			switch(fractalType){
				case 'BurningShip': mandelbrot = new BurningShip(); break;
				case 'Chaosbrot': mandelbrot = new Chaosbrot(); break;
				case 'Mandelbrot':
				default: mandelbrot = new Mandelbrot(); break;
			}			
			
			mandelbrot.init(cycles, xmin, xmax, ymin, ymax);
			content_mc.addChild(mandelbrot);
			
			content_mc.addEventListener(MouseEvent.CLICK,zoomClick);
			draw_b.addEventListener(MouseEvent.CLICK,drawFractal);
			zoom_b.addEventListener(MouseEvent.CLICK,drawFractalZoom);
		}
		function zoomClick(e:MouseEvent):void
		{			
			var rStep:Number = ( xmax - xmin ) / 700;
			var iStep:Number = ( ymax - ymin ) / 600;
			var r = xmin + mouseX * rStep;
			var i = ymin + mouseY * iStep;

			xmin += ( r - xmin ) / 8;
			xmax += ( r - xmax ) / 8;
			ymin += ( i - ymin ) / 8;
			ymax += ( i - ymax ) / 8;

			setInterfaceFields();
			mandelbrot.init(cycles, xmin, xmax, ymin, ymax);
		}
		
		function drawFractal(e:MouseEvent):void
		{
			getInterfaceValues();
			mandelbrot.init(cycles, xmin, xmax, ymin, ymax);
		}

		function drawFractalZoom(e:MouseEvent):void
		{			
			xmin += ( 0 - xmin ) / 64;
			xmax += ( 0 - xmax ) / 64;
			ymin += ( 1 - ymin ) / 64;
			ymax += ( 1.3 - ymax ) / 64;

			setInterfaceFields();
			mandelbrot.init(cycles, xmin, xmax, ymin, ymax);
		}
		function setInterfaceFields(){
			stanga_t.text = String(xmin);
			dreapta_t.text = String(xmax);
			jos_t.text = String(ymin);
			sus_t.text = String(ymax);
			iteratii.text = String(cycles);
		}
		function getInterfaceValues(){
			xmin = Number(stanga_t.text);
			xmax = Number(dreapta_t.text);
			ymin = Number(jos_t.text);
			ymax = Number(sus_t.text);
			cycles = int(iteratii.text);
		}
	}
}