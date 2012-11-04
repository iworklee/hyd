package Action.Resource
{
	public class ResourceManager
	{
		private static const _root:String = "http://hyd.googlecode.com/svn/trunk/client/raw/Action/";
		
		public static function parseUrl(url:String):String
		{
			if(url.indexOf("/") == 0)
				url = url.substr(1);
			return _root + url;
		}
		
		private static var _imageSection:ResourceManager = new ResourceManager();
		public static function get imageSection():ResourceManager
		{
			return _imageSection;
		}
		
		/*private static var _bumSection:ResourceManager = new ResourceManager();
		public static function get BUMSection():ResourceManager
		{
			return _bumSection;
		}*/
		
		public function ResourceManager()
		{
		}
		
		private var _items:Array = new Array();
		
		public function get(key:String):Object
		{
			return _items[key.toLowerCase()];
		}
		
		public function set(key:String,value:Object):void
		{
			_items[key.toLowerCase()] = value;
		}
	}
}