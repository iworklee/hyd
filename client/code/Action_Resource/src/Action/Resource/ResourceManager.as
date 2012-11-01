package Action.Resource
{
	public class ResourceManager
	{
		public function ResourceManager()
		{
		}
		
		private static var _items:Array = new Array();
		private static const _root:String = "http://hyd.googlecode.com/svn/trunk/client/raw/Action/";
		
		public static function parseUrl(url:String):String
		{
			if(url.indexOf("/") == 0)
				url = url.substr(1);
			return _root + url;
		}
		
		public static function get(key:String):Object
		{
			return _items[key.toLowerCase()];
		}
		
		public static function set(key:String,value:Object):void
		{
			_items[key.toLowerCase()] = value;
		}
	}
}