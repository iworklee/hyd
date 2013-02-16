package com.hyd.joker.plugin.tool
{
	import com.hyd.joker.core.Joker;
	
	import flash.events.MouseEvent;
	import flash.ui.MouseCursor;

	public class MapPanTool extends BaseTool
	{
		public function MapPanTool()
		{
			super();
		}
		
		private var _mouseDown:Boolean = false;
		private var _startX:Number;
		private var _startY:Number;
		
		public override function mouseOut(e:MouseEvent):void
		{
			_mouseDown = false;
		}
		
		public override function mouseDown(e:MouseEvent):void
		{
			_mouseDown = true;
			_startX = e.localX;
			_startY = e.localY;
		}
		
		public override function mouseMove(e:MouseEvent):void
		{
			if(_mouseDown)
				Joker.context.map.pan(e.localX - _startX, e.localY - _startY);
		}
		
		public override function mouseUp(e:MouseEvent):void
		{
			_mouseDown = false;
		}
	}
}