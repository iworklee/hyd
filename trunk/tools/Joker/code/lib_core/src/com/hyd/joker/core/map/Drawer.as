package com.hyd.joker.core.map
{
	import com.hyd.joker.core.facade.IShape;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import mx.core.UIComponent;

	public class Drawer
	{
		private var _shapes:Array = new Array();
		private var _maxId:int = -1;
		
		public function Drawer()
		{
		}
		
		public function update(id:int, shape:IShape):void
		{
			_shapes[id] = shape;
		}
		
		public function add(shape:IShape):int
		{
			update(++_maxId, shape);
			return _maxId;
		}
		
		public function remove(id:int):void
		{
			if(_shapes[id] != null)
				delete _shapes[id];
		}
		
		public function clear():void
		{
			_shapes = [];
		}
		
		public function draw(graphics:Graphics):void
		{
			graphics.clear();
			for each(var shape:IShape in _shapes)
				shape.draw(graphics);
		}
	}
}