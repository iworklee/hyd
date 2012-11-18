package Action.Display.Drawing
{
	import Action.Core.GamePlugins;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.controls.Label;
	
	import spark.components.BorderContainer;

	public class CanvasGraphics
	{
		private var _container:ICanvasContainer;
		public function get container():ICanvasContainer
		{
			return _container;
		}
		
		private var _canvas:BorderContainer;
		public function getCanvas():BorderContainer
		{
			return _canvas;
		}
		
		private var _effectLayer:BorderContainer;
		public function getEffectLayer():BorderContainer
		{
			return _effectLayer;
		}
		
		private var _textLayer:BorderContainer;
		public function getTextLayer():BorderContainer
		{
			return _textLayer;
		}
		
		public function CanvasGraphics(canvasContainer:ICanvasContainer)
		{
			_container = canvasContainer;
			_canvas = _container.getCanvas();
			_effectLayer = _canvas.getElementAt(0) as BorderContainer;
			_textLayer = _effectLayer.getElementAt(0) as BorderContainer;
		}
		
		public function drawImage(bitmap:Bitmap, point:Point, image:Image=null):Image
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
		
		public function drawBitmap(bitmap:BitmapData, point:Point, layer:BorderContainer=null, fx:int=0, fy:int=0, scale:Number=1):void
		{
			if(layer == null)
				layer = _canvas;
			point = new Point(point.x + fx, point.y + fy);
			var rect:Rectangle = new Rectangle(point.x, point.y, bitmap.width, bitmap.height);
			layer.graphics.beginBitmapFill(bitmap, new Matrix(scale,0,0,scale,rect.x, rect.y), false);
			layer.graphics.drawRect(rect.x, rect.y, rect.width * scale, rect.height * scale);
			layer.graphics.endFill();
		}
		
		public function drawText(text:String, point:Point, color:int=0xff0000, size:int=10, bold:Boolean=false, font:String="Arial"):void
		{
			/*var label:Label = new Label();
			label.x = point.x;
			label.y = point.y;
			label.text = text;
			label.setStyle("color", color);
			label.setStyle("fontSize", fontSize);
			label.setStyle("fontWeight", bold ? "bold" : "");
			label.setStyle("fontFamily", fontFamily);
			//_canvas.addElement(label);
			//GamePlugins.console.writeLine(text);*/
			
			var label:TextField = new TextField();
			label.text = text;
			var format:TextFormat = new TextFormat();
			format.color = color;
			format.size = 10;
			format.bold = bold;
			format.font = font;
			label.setTextFormat(format);
			
			var bitmap:BitmapData = new BitmapData(label.textWidth + 1000, label.textHeight + 100, true, 0x00000000);
			var matrix:Matrix = new Matrix();
			matrix.scale(size / 10, size /10);
			matrix.translate(-size / 5, -size / 5);
			bitmap.draw(label, matrix);
			drawBitmap(bitmap, point, _textLayer);
		}
		
		public function clear():void
		{			
			_textLayer.graphics.clear();
			_effectLayer.graphics.clear();
			_canvas.graphics.clear();
			//GamePlugins.console.writeLine("clear");
		}
		
		public function alert(text:String):void
		{
			Alert.show(text);
		}
	}
}