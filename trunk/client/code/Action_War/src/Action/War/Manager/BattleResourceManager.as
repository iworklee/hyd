package Action.War.Manager
{
	public class BattleResourceManager
	{
		private static var _managers:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_managers[rid] = new BattleResourceManager(rid);
		}
		
		public static function getInstance(rid:int):BattleResourceManager
		{
			return _managers[rid];
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return _resId;
		}
		
		public function BattleResourceManager(id:int)
		{
			_resId = id;
		}
		
		public var attackBitmaps:Array = new Array();
		public var defendBitmaps:Array = new Array();
		public var moveBitmaps:Array = new Array();
		public var waitBitmaps:Array = new Array();
		public var hurtBitmaps:Array = new Array();
	}
}