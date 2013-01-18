package com.hyd.joker.plugin.command
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IMap;

	public class MapZoomOutCommand extends BaseCommand
	{
		public function MapZoomOutCommand()
		{
			super();
		}
		
		public override function click():void
		{
			var map:IMap = Joker.context.map;
			map.zoom(map.scale + 1);
		}
	}
}