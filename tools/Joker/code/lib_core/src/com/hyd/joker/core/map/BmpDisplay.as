package com.hyd.joker.core.map
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IDisplay;
	import com.hyd.joker.core.facade.ITool;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.Image;
	
	public class BmpDisplay extends MapDisplay implements IDisplay
	{
		public function BmpDisplay()
		{
			super();
			this.addChild(_image);
			this.addChild(_canvas);
		}
		
		private var _image:Image = new Image();
		public override function get source():Object
		{
			return _image.source;
		}				
		public override function set source(value:Object):void
		{
			_image.source = value;
			_image.width = _image.source.width;
			_image.height = _image.source.height;
		}
		
		public override function get width():Number
		{
			return _image.width;
		}
		public override function set width(value:Number):void
		{
			_image.width = value;
		}
		
		public override function get height():Number
		{
			return _image.height;
		}
		public override function set height(value:Number):void
		{
			_image.height = value;
		}
	}
}