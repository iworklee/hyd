package Action.Resource
{
	import Action.Core.GameConfig;

	public class CommonResource
	{
		private static var _root:String;
		
		public static function parseUrl(url:String):String
		{
			if(url.indexOf("/") == 0)
				url = url.substr(1);
			return _root + url;
		}
		
		private static var _imageSection:CommonResource = new CommonResource();
		public static function get imageSection():CommonResource
		{
			return _imageSection;
		}
		
		/*private static var _bumSection:ResourceManager = new ResourceManager();
		public static function get BUMSection():ResourceManager
		{
			return _bumSection;
		}*/
		
		private static function initialize():void
		{
			var objRoot:Object = GameConfig.getValue("resRoot");
			_root = objRoot != null ? objRoot.toString() : "http://hyd.googlecode.com/svn/trunk/client/raw/Action/";
		}
		initialize();
		
		public function CommonResource()
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