package com.hyd.joker.core.map
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IMap;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	import mx.controls.Alert;

	public class BmpDoc extends BaseDoc
	{		
		public function BmpDoc(path:String)
		{
			super(path, new BmpDisplay());
		}
		
		public override function load(map:IMap):void
		{
			super.load(map);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadSucceed);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadFailed);
			loader.load(_request);
		}		
		
		private function onLoadSucceed(e:Event):void
		{
			_map.display.source = e.currentTarget.content;
			_map.onload();
		}
		
		private function onLoadFailed(e:IOErrorEvent):void
		{
			Joker.context.handleError(e);
		}
	}
}