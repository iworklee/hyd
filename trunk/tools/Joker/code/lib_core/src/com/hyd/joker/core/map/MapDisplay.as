package com.hyd.joker.core.map
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IDisplay;
	import com.hyd.joker.core.facade.IMap;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class MapDisplay extends UIComponent implements IDisplay
	{		
		private var _cursor:Class;
		private var _cursorId:int = -1;
		
		public function MapDisplay()
		{
			super();			
			_canvas.mouseEnabled = false;
			this.addEventListener(KeyboardEvent.KEY_DOWN, Joker.context.keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, Joker.context.keyUp);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			this.addEventListener(MouseEvent.MOUSE_DOWN, Joker.context.mouseDown);
			this.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			this.addEventListener(MouseEvent.MOUSE_UP, Joker.context.mouseUp);
			this.addEventListener(MouseEvent.DOUBLE_CLICK, Joker.context.mouseDoubleClick);
			this.addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		protected function mouseOver(e:MouseEvent):void
		{
			_cursorId = cursorManager.setCursor(_cursor);
		}
		
		protected function mouseOut(e:MouseEvent):void
		{
			if(_cursorId != -1)
				cursorManager.removeCursor(_cursorId);
		}
		
		private function mouseMove(e:MouseEvent):void
		{
			var scrPoint:Point = Joker.context.screenPoint;
			var mapPoint:Point = Joker.context.mapPoint;
			var map:IMap = Joker.context.map;
			mapPoint.x = map.toMapSize(scrPoint.x = e.localX);
			mapPoint.y = map.toMapSize(scrPoint.y = e.localY);
			Joker.context.statusbar.refresh();
			Joker.context.mouseMove(e);
		}
		
		private function enterFrame(e:Event):void
		{
			Joker.context.outputText = new Date().toString();
		}
		
		public function get source():Object
		{
			return null;
		}
		
		public function set source(value:Object):void
		{
		}	
		
		protected var _canvas:Sprite = new Sprite();
		public function get canvas():Sprite
		{
			return _canvas;
		}		
		
		public function setCursor(cursor:Class):void
		{
			_cursor = cursor;
		}
	}
}