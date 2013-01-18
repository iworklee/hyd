package com.hyd.joker.core
{
	import adobe.utils.CustomActions;
	
	import com.hyd.joker.core.facade.Context;
	
	import flash.external.ExternalInterface;
	
	import mx.controls.Alert;

	public class Joker
	{
		public function Joker()
		{
			throw new Error("Static");
		}
		
		private static var _config:Config = new Config();
		public static function get config():Config
		{
			return _config;
		}
		
		private static var _context:Context = new Context();
		public static function get context():Context
		{
			return _context;
		}

		public static var commands:Array;
		
		public static function alert(obj:Object, title:String=""):void
		{
			var text:String = obj != null ? obj.toString() : "";
			Alert.show(text, title);
		}
		
		public static function parseUrl(url:String):String
		{
			return ExternalInterface.call("config.getValue", "resRoot") + url;
		}
	}
}