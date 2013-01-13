package Action.Resource
{
	import flash.display.BitmapData;

	public class HeroBodyResource
	{
		private static var _resources:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_resources[rid] = new HeroBodyResource(rid);
		}
		
		public static function getInstance(rid:int):HeroBodyResource
		{
			return _resources[rid];
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return _resId;
		}
		
		public function HeroBodyResource(rid:int)
		{
			_resId = rid;
		}
		
		public var bitmaps:Array = new Array();
	}
}