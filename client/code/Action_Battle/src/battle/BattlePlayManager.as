package battle
{
	import battle.map.BattleMap;
	import battle.vo.BattleReportVO;

	public class BattlePlayManager
	{
		private static var _instance:BattlePlayManager;
		public static function getInstance():BattlePlayManager
		{
			if(!_instance)
			{
				_instance = new BattlePlayManager();
			}
			
			return _instance;
		}
		
		private var _battleMap:BattleMap;
		public function get battleMap():BattleMap
		{
			return this._battleMap;
		}
		
		public function BattlePlayManager()
		{
		}
		
		public function playOneBattle(battleReport:BattleReportVO):void
		{
			
		}
	}
}