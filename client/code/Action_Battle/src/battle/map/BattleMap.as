package battle.map
{
	import battle.view.BattleMapViewVO;

	public class BattleMap
	{
		private var _mapViewVO:BattleMapViewVO;
		public function get mapViewVO():BattleMapViewVO
		{
			return this._mapViewVO;
		}
		
		private var _formation:BattleFormation;
		public function get formation():BattleFormation
		{
			return this._formation;
		}
		
		public function BattleMap()
		{
		}
		
		public function initBattleMap():void
		{
			
		}
	}
}