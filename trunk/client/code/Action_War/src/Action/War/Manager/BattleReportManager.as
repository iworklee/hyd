package Action.War.Manager
{
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;
	import Action.War.Flow.LoadBattleUnitActivity;

	public class BattleReportManager
	{
		private static var _instances:Array = new Array();
		public static function getInstance(buid:String, report:BattleReport = null):BattleReportManager
		{
			if(_instances[buid] == null)
				_instances[buid] = new BattleReportManager(report);
			return _instances[buid];
		}
		
		private var _battleReport:BattleReport;
		public function get battleReport():BattleReport
		{
			return _battleReport;
		}
		
		private var _buManagers:Array = new Array();
		public function getBattleUnitManager(sid:int):BattleUnitManager
		{
			return _buManagers[sid];
		}
		
		public function BattleReportManager(report:BattleReport)
		{
			_battleReport = report;
			for each(var bu:BattleUnit in _battleReport.units)
				_buManagers[bu.sID] = new BattleUnitManager(bu);
		}
		
		public function createLoadingActivities():Array
		{
			var acts:Array = new Array();
			for each(var bum:BattleUnitManager in _buManagers)
			{
				for(var i:int = 0; i<3; i++)
					acts.push(new LoadBattleUnitActivity(bum.resId, i));
			}
			return acts;
		}
		
		public function dispose():void
		{
			_buManagers = new Array();
		}
	}
}