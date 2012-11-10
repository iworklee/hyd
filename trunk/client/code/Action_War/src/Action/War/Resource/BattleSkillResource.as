package Action.War.Resource
{
	public class BattleSkillResource
	{
		private static var _resources:Array = new Array();
		
		public static function createInstance(rid:int):void
		{
			_resources[rid] = new BattleSkillResource(rid);
		}
		
		public static function getInstance(rid:int):BattleSkillResource
		{
			return _resources[rid];
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
		
		public var bitmaps:Array = new Array();
		
	}
}