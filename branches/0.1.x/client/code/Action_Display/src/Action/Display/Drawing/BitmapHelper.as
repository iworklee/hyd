package Action.Display.Drawing
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class BitmapHelper
	{
		public function BitmapHelper()
		{
			
		}
		
		public static function cutBitmap(source:BitmapData, x:int, y:int, width:int, height:int):BitmapData
		{
			var rect:Rectangle = new Rectangle(x, y, width, height);
			var target:BitmapData = new BitmapData(width, height);
			target.copyPixels(source, rect, new Point(0, 0));
			return target;
		}
		
		public static function reverseBitmap(source:BitmapData):BitmapData
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
		
		public static function reverseBitmapColor(source:BitmapData):BitmapData
		{
			var target:BitmapData = new BitmapData(source.width, source.height);
			for (var y:int=0; y<source.height; y++)
			{
				for (var x:int=0; x<source.width; x++) 
				{
					var color:uint = source.getPixel32(x, y);
					if(color > 0xC30000 && color < 0xFFFFFF)
					{
						color = source.getPixel(x, y);
						target.setPixel(x, y, 0x0000ff);
					}
					else
						target.setPixel32(x, y, color);	
				}
			}
			return target;
		}
		
		public static function createBlackWhiteBitmap(source:BitmapData):BitmapData
		{
			var target:BitmapData = new BitmapData(source.width, source.height);
			for (var y:int=0; y<source.height; y++)
			{
				for (var x:int=0; x<source.width; x++) 
				{
					var color:uint = source.getPixel(x, y);
					var r:uint = (color>>16) & (0xff); 
					var gray:uint = r + (r<<8)+(r<<16); 
					target.setPixel(x, y, gray);
				}
			}
			return target;
		}
		
		public static function drawBitmap(graphics:Graphics, bitmap:BitmapData, point:Point, scale:int=1):void
		{
			var rect:Rectangle = new Rectangle(point.x, point.y, bitmap.width, bitmap.height);
			graphics.beginBitmapFill(bitmap, new Matrix(scale,0,0,scale,rect.x, rect.y), false);
			graphics.drawRect(rect.x, rect.y, rect.width * scale, rect.height * scale);
			graphics.endFill();
		}
		
	}
}