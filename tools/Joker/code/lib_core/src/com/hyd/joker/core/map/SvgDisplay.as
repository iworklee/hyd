package com.hyd.joker.core.map
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IDisplay;
	import com.svg.SvgSprite;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	
	import mx.core.DesignLayer;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.geom.TransformOffsets;
	
	public class SvgDisplay extends MapDisplay implements IDisplay
	{
		public function SvgDisplay()
		{
			super();
		}
		
		private var _source:SvgSprite;
		public override function get source():Object
		{
			return _source;
		}		
		public override function set source(value:Object):void
		{
			if(value is SvgSprite)
			{
				this.removeChildren();
				this.addChild(_source = SvgSprite(value));
				this.addChild(_canvas);
			}
			else
				throw new Error("value must be instance of SvgSprite.");
		}
		
		public override function get width():Number
		{
			return _source.width;
		}
		public override function set width(value:Number):void
		{
			_source.width = value;
		}
		
		public override function get height():Number
		{
			return _source.height;
		}
		public override function set height(value:Number):void
		{
			_source.height = value;
		}
	}
}