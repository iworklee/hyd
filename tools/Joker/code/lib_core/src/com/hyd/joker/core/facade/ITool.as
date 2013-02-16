package com.hyd.joker.core.facade
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.MouseCursor;
	
	import mx.managers.CursorManager;

	public interface ITool extends ICommand
	{
		function get cursor():Class;
		function active():void;
		function dispose():void;
		function keyDown(e:KeyboardEvent):void;
		function keyUp(e:KeyboardEvent):void;
		function mouseOver(e:MouseEvent):void;
		function mouseOut(e:MouseEvent):void;
		function mouseDown(e:MouseEvent):void;
		function mouseMove(e:MouseEvent):void;
		function mouseUp(e:MouseEvent):void;
		function mouseDoubleClick(e:MouseEvent):void;
	}
}