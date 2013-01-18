package com.hyd.joker.core.shape
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IMap;
	import com.hyd.joker.core.facade.IShape;
	
	import flash.display.Graphics;
	import flash.geom.Point;
	
	public class Line implements IShape
	{		
		public var point1:Point;
		public var point2:Point;
		
		public function Line(point1:Point=null, point2:Point=null)
		{
			this.point1 = point1;
			this.point2 = point2;
		}
		
		public function draw(graphics:Graphics):void
		{
			var map:IMap = Joker.context.map;
			var scrPnt1:Point = map.toScreenPoint(point1);
			var scrPnt2:Point = map.toScreenPoint(point2);
			graphics.lineStyle(1, Joker.config.sketchColor);
			graphics.moveTo(scrPnt1.x, scrPnt1.y);
			graphics.lineTo(scrPnt2.x, scrPnt2.y);
		}
	}
}