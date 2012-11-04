package Action.War
{
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;

	public class BattleReportFactory
	{
		private static var _current:BattleReportFactory = null;
		public static function get current():BattleReportFactory
		{
			if(_current == null)
				_current = new BattleReportFactory();
			return _current;
		}
		
		public function BattleReportFactory()
		{
		}
		
		public function createTestReport():BattleReport
		{
			var unit:BattleUnit = new BattleUnit();
			unit.id = 1;
			unit.pos = 5;
			unit.hP = 357;
			unit.mP = 50;			
			
			var report:BattleReport = new BattleReport();
			report.units.push(unit);
			return report;
		}
	}
}