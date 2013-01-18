package com.hyd.joker.core.map
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IMap;
	import com.svg.SvgSprite;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	
	import mx.controls.Alert;
	
	import spark.components.BorderContainer;

	public class SvgDoc extends BaseDoc
	{
		public function SvgDoc(path:String)
		{
			super(path, new SvgDisplay());
		}
		
		public override function load(map:IMap):void
		{
			super.load(map);
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onLoadSucceed);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadFailed);
			loader.load(_request);
		}		
		
		private function onLoadSucceed(e:Event):void
		{
			_map.display.source = new SvgSprite(new XML(e.currentTarget.data));
			_map.onload();
		}
		
		private function onLoadFailed(e:IOErrorEvent):void
		{
			Joker.context.handleError(e);
		}
	}
}