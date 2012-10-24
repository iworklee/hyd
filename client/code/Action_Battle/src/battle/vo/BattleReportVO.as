package battle.vo
{
	public class BattleReportVO
	{
		private var _battleMapID:int;
		public function get battleMapID():int
		{
			return this._battleMapID;
		}
		
		public function BattleReportVO()
		{
		}
		
		public function initBattleReport(mapId:int):void
		{
			this._battleMapID = mapId;
		}
	}
}