package com.hyd.joker.core.facade
{
	import com.hyd.joker.core.map.Drawer;
	
	import flash.geom.Point;

	public interface IMap extends IControl
	{
		function get doc():IDoc;
		function get display():IDisplay;
		function get isEmpty():Boolean
		function get contentWidth():Number;
		function get contentHeight():Number;		
		function get scale():int;
		function set scale(value:int):void;
		function get sketch():Drawer;
		function load(doc:IDoc):void;
		function onload():void;
		function zoom(scale:int):void;
		function zoomTo(mapPoint:Point):void;
		function toScreenSize(size:Number):Number;
		function toMapSize(size:Number):Number;
		function toScreenPoint(point:Point):Point;
		function toMapPoint(point:Point):Point;
		function pan(x:Number, y:Number):void;
		function panTo(x:Number, y:Number):void;
		function getScreenCenter():Point;
		function getMapCenter():Point;
	}
}