package Action.Resource
{
	import flash.display.BitmapData;

	public class HeroResource
	{
		private static var _resources:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_resources[rid] = new HeroResource(rid);
		}
		
		public static function getInstance(rid:int):HeroResource
		{
			return _resources[rid];
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return _resId;
		}
		
		public function HeroResource(rid:int)
		{
			_resId = rid;
		}
		
		public var headBitmap:BitmapData;
		public var bodyBitmaps:Array = new Array();
	}
}