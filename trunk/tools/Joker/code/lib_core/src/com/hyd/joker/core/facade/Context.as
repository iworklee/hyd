package com.hyd.joker.core.facade
{
	import com.hyd.joker.core.factory.CommandFactory;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import flashx.textLayout.debug.assert;
	
	import mx.controls.Alert;

	public class Context
	{
		public var enabled:Boolean;
		public var toolbar:IToolbar;
		public var catalog:ICatalog;
		public var map:IMap;
		public var navigator:INavigator;
		public var propertyGrid:IPropertyGrid;
		public var statusbar:IStatusbar;
		public var outputText:String;
		
		private var _currentTool:ITool;
		public function get currentTool():ITool
		{
			return _currentTool;
		}
		public function set currentTool(value:ITool):void
		{
			if (_currentTool != value)
			{
				if (_currentTool != null)
				{
					_currentTool.dispose();
					map.display.setCursor(null);
				}
				_currentTool = value;
				if (_currentTool != null)
				{
					_currentTool.active();
					map.display.setCursor(_currentTool.cursor);
				}
				toolbar.refresh();
			}
		}
		
		private var _scrPoint:Point = new Point();
		public function get screenPoint():Point
		{
			return _scrPoint;
		}
		
		private var _mapPoint:Point = new Point();
		public function get mapPoint():Point
		{
			return _mapPoint;
		}
		
		public function useDefaultTool():void
		{
			currentTool = CommandFactory.getCommand("MapPanTool") as ITool;
		}
		
		public function showProcess(message:String, waiting:Boolean=true):void
		{
			
		}
		
		public function handleError(e:Object):void
		{
			Alert.show(e.toString());
		}
		
		public function keyDown(e:KeyboardEvent):void
		{
			if(_currentTool != null)
				_currentTool.keyDown(e);
		}
		
		public function keyUp(e:KeyboardEvent):void
		{
			if(_currentTool != null)
				_currentTool.keyUp(e);
		}
		
		public function mouseOver(e:MouseEvent):void
		{
			if(_currentTool != null)
				_currentTool.mouseOver(e);
		}
		
		public function mouseOut(e:MouseEvent):void
		{
			if(_currentTool != null)
				_currentTool.mouseOut(e);
		}
		
		public function mouseDown(e:MouseEvent):void
		{
			if(_currentTool != null)
				_currentTool.mouseDown(e);
		}
		
		public function mouseMove(e:MouseEvent):void
		{
			if(_currentTool != null)
				_currentTool.mouseMove(e);
		}
		
		public function mouseUp(e:MouseEvent):void
		{
			if(_currentTool != null)
				_currentTool.mouseUp(e);
		}
		
		public function mouseDoubleClick(e:MouseEvent):void
		{
			if(_currentTool != null)
				_currentTool.mouseDoubleClick(e);
		}
	}
}