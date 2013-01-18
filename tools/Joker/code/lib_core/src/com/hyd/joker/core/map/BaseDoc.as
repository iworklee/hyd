package com.hyd.joker.core.map
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.IDisplay;
	import com.hyd.joker.core.facade.IDoc;
	import com.hyd.joker.core.facade.IMap;
	
	import flash.net.URLRequest;
	
	public class BaseDoc implements IDoc
	{
		protected var _map:IMap;
		protected var _request:URLRequest;
		
		public function BaseDoc(path:String, display:IDisplay)
		{
			_path = path;
			_display = display;
			_request = new URLRequest();
			_request.url = Joker.parseUrl(_path);
		}
		
		private var _path:String;
		public function get path():String
		{
			return _path;
		}
		
		private var _display:IDisplay;
		public function get display():IDisplay
		{
			return _display;
		}
		
		public function load(map:IMap):void
		{
			_map = map;
		}
	}
}