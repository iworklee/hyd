package com.hyd.joker.plugin.tool
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IMap;
	import com.hyd.joker.core.shape.Line;
	import com.hyd.joker.core.util.MathEx;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class DistanceTool extends BaseTool
	{
		private var _line:Line = new Line(new Point(), new Point());
		private var _doing:Boolean = false;
		private var _map:IMap;
		
		public function DistanceTool()
		{
			super();
		}
		
		public override function active():void
		{
			_map = Joker.context.map;
		}
		
		public override function mouseMove(e:MouseEvent):void
		{
			if(_doing)
			{
				_line.point2.x = _map.toMapSize(e.localX);
				_line.point2.y = _map.toMapSize(e.localY);
				_map.sketch.update(0, _line);
				_map.refresh();
			}
		}
		
		public override function mouseUp(e:MouseEvent):void
		{
			if(!_doing)
			{
				_line.point1.x = _map.toMapSize(e.localX);
				_line.point1.y = _map.toMapSize(e.localY);
			}
			else
			{
				_line.point2.x = _map.toMapSize(e.localX);
				_line.point2.y = _map.toMapSize(e.localY);
				_map.sketch.clear();
				_map.refresh();
				Joker.alert(MathEx.distance(_line.point1.x, _line.point1.y, _line.point2.x, _line.point2.y));
			}
			_doing = !_doing;
		}
	}
}