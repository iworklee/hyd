package com.hyd.joker.core.facade
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import mx.core.IVisualElement;

	public interface IDisplay extends IVisualElement
	{
		function get source():Object;
		function set source(value:Object):void;
		function get canvas():Sprite;		
		function setCursor(cursor:Class):void;
	}
}