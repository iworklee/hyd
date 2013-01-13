package battle.map
{
	import battle.view.BattleMapViewVO;
	import battle.vo.BattleReportVO;
	
	import res.data.ConfigDataManager;
	import res.data.map.BattleMapConfig;

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
		
		private var _battleReport:BattleReportVO;
		public function get battleReport():BattleReportVO
		{
			return this._battleReport;
		}
		
		private var _mapConfig:BattleMapConfig;
		public function get mapConfig():BattleMapConfig
		{
			return this._mapConfig;
		}
		
		public function BattleMap()
		{
		}
		
		public function initBattleMap(battleReport:BattleReportVO):void
		{
			this._battleReport = battleReport;
			this._mapConfig = ConfigDataManager.getInstance().getBattleMapConfigById(this._battleReport.battleMapID);
		}
	}
}