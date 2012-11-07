package Action.War.Resource
{
	public class BattleSkillResource
	{
		private static var _managers:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_managers[rid] = new BattleUnitResource(rid);
		}
		
		public static function getInstance(rid:int):BattleSkillResource
		{
			return _managers[rid];
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return _resId;
		}
		
		public function BattleSkillResource(rid:int)
		{
			_resId = rid;
		}
		
		public var effectBitmaps:Array = new Array();
		
	}
}