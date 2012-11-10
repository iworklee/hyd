package Action.War.Resource
{
	public class BattleUnitResource
	{
		private static var _resources:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_resources[rid] = new BattleUnitResource(rid);
		}
		
		public static function getInstance(rid:int):BattleUnitResource
		{
			return _resources[rid];
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return _resId;
		}
		
		public function BattleUnitResource(rid:int)
		{
			_resId = rid;
		}
		
		public var attackBitmaps:Array = new Array();
		public var defendBitmaps:Array = new Array();
		public var moveBitmaps:Array = new Array();
		public var waitBitmaps:Array = new Array();
		public var hurtBitmaps:Array = new Array();
	}
}