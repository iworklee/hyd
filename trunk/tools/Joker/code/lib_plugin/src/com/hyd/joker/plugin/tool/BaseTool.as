package com.hyd.joker.plugin.tool
{
	import com.hyd.joker.core.facade.ITool;
	import com.hyd.joker.plugin.command.BaseCommand;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.MouseCursor;
	
	public class BaseTool extends BaseCommand implements ITool
	{
		public function BaseTool()
		{
		}
		
		public function get cursor():Class
		{
			return icon;
		}
		
		public function active():void
		{
		}
		
		public function dispose():void
		{
		}
		
		public function keyDown(e:KeyboardEvent):void
		{
		}
		
		public function keyUp(e:KeyboardEvent):void
		{
		}
		
		public function mouseDown(e:MouseEvent):void
		{
		}
		
		public function mouseMove(e:MouseEvent):void
		{
		}
		
		public function mouseUp(e:MouseEvent):void
		{
		}
		
		public function mouseDoubleClick(e:MouseEvent):void
		{
		}
	}
}