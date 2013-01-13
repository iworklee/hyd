package Action.Resource
{
	import flash.display.BitmapData;

	public class HeroFaceResource
	{
		private static var _resources:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_resources[rid] = new HeroFaceResource(rid);
		}
		
		public static function getInstance(rid:int):HeroFaceResource
		{
			return _resources[rid];
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return _resId;
		}
		
		public function HeroFaceResource(rid:int)
		{
			_resId = rid;
		}
		
		public var bitmap:BitmapData;
	}
}