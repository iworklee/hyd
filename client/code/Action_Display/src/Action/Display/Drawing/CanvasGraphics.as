package Action.Display.Drawing
{
	import Action.Core.GamePlugins;
	
	import flash.display.Bitmap;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.controls.Alert;
	import mx.controls.Image;
	
	import spark.components.BorderContainer;

	public class CanvasGraphics
	{
		private var _container:ICanvasContainer;
		
		private var _canvas:BorderContainer;
		public function get canvas():BorderContainer
		{
			return _canvas;
		}
		
		public function CanvasGraphics(canvasContainer:ICanvasContainer)
		{
			_container = canvasContainer;
			_canvas = _container.getCanvas();
			_container.bindGraphics(this);	
		}
		
		public function draw2(bitmap:Bitmap, point:Point, image:Image=null):Image
		{
			if(image != null)
				_canvas.removeElement(image);
			image = new Image();			
			image.move(point.x, point.y);
			image.source = bitmap;				
			_canvas.addElement(image);
			return image;
		}
		
		public function contains(point:Point):Boolean
		{
			return point.x >=0 && point.x <= _canvas.width - 50 && point.y >= 0 && point.y <= _canvas.height - 50;
		}
		
		public function draw(bitmap:Bitmap, point:Point):void
		{
			var rect:Rectangle = new Rectangle(point.x, point.y, bitmap.bitmapData.width, bitmap.bitmapData.height);
			_canvas.graphics.beginBitmapFill(bitmap.bitmapData, new Matrix(1,0,0,1,rect.x, rect.y), false);
			//_canvas.graphics.lineStyle(3, 0xff0000);
			_canvas.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
			_canvas.graphics.endFill();
			//GamePlugins.console.writeLine("fill");
		}
		
		public function clear():void
		{
			_canvas.graphics.clear();
			//GamePlugins.console.writeLine("clear");
		}
		
		public function alert(text:String):void
		{
			Alert.show(text);
		}
		
		public function getPaintPoint(pos:int):Point
		{				
			return new Point((int((pos+100) / 5)-20) * 50, (pos + 100) % 5 * 50);
		}
	}
}