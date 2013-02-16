package com.hyd.joker.plugin.tool
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IMap;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class MapZoomOutTool extends BaseTool
	{
		public function MapZoomOutTool()
		{
			super();
		}
		
		public override function mouseUp(e:MouseEvent):void
		{
			var map:IMap = Joker.context.map;
			map.zoom(map.scale + 1);
			map.match(Joker.context.mapPoint, new Point(map.width / 2, map.height / 2));
		}
	}
}