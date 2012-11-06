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
			var report:BattleReport = new BattleReport();
			report.uID = "qwerty123";			
				
			for(var i:int=10; i<60;i++)
			{
				var unit:BattleUnit = new BattleUnit();
				unit.sID = i;
				if(i == 32 || i == 37)
					unit.id = 1;
				else if(int(i / 10) == 3)
					unit.id = 103;
				else
					unit.id = 102;
				unit.pos = i;
				unit.hP = 357;
				unit.mP = 50;
				report.units.push(unit);
			}
			
			return report;
		}
	}
}