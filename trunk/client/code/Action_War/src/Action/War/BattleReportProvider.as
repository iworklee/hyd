package Action.War
{
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;

	public class BattleReportProvider
	{
		private static var _current:BattleReportProvider = null;
		public static function get current():BattleReportProvider
		{
			if(_current == null)
				_current = new BattleReportProvider();
			return _current;
		}
		
		public function BattleReportProvider()
		{
		}
		
		public function createTestReport():BattleReport
		{
			var unit:BattleUnit = new BattleUnit();
			unit.sID = 0;
			unit.id = 1;
			unit.pos = 5;
			unit.hP = 357;
			unit.mP = 50;			
			
			var report:BattleReport = new BattleReport();
			report.uID = "qwerty123";
			report.units.push(unit);
			return report;
		}
	}
}