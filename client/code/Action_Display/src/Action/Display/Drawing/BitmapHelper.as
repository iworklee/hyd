package Action.Display.Drawing
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class BitmapHelper
	{
		public function BitmapHelper()
		{
			
		}
		
		public static function cutBitmapData(source:BitmapData, x:int, y:int, width:int, height:int):BitmapData
		{
			var rect:Rectangle = new Rectangle(x, y, width, height);
			var target:BitmapData = new BitmapData(width, height);
			target.copyPixels(source, rect, new Point(0, 0));
			return target;
		}
		
		public static function cutBitmap(source:Bitmap, x:int, y:int, width:int, height:int):Bitmap
		{
			return new Bitmap(cutBitmapData(source.bitmapData, x, y, width, height));
		}
		
		public static function reverseBitmapData(source:BitmapData):BitmapData
		{
			var target:BitmapData = new BitmapData(source.width, source.height);
			for (var y:int=0; y<source.height; y++)
			{
				for (var x:int=0; x<source.width; x++) 
				{
					target.setPixel32(source.width - x -1, y, source.getPixel32(x, y));
				}
			}
			return target;
		}
		
		public static function reverseBitmap(source:Bitmap):Bitmap
		{
			return new Bitmap(reverseBitmapData(source.bitmapData));
		}
	}
}