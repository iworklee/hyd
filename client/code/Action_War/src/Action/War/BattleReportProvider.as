package Action.War
{
	import Action.Model.BattleAction;
	import Action.Model.BattleActionType;
	import Action.Model.BattleBout;
	import Action.Model.BattleEffect;
	import Action.Model.BattleEffectType;
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;
	
	import Util.Random;

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
				if(i == 32)
					unit.id = 1;
				else if(i == 37)
					unit.id = 2;
				else if(int(i / 10) == 3)
					unit.id = 103;
				else
					unit.id = 102;
				unit.pos = i;
				unit.hP = 357;
				unit.mP = 50;
				report.units.push(unit);
			}
			
			report.bouts.push(createBout1());
			report.bouts.push(createBout2());
			
			return report;
		}
		
		private function createBout1():BattleBout
		{
			var bout:BattleBout = new BattleBout();
			bout.sID = 1;
			
			for(var i:int = 0; i<5; i++)
			{
				var action:BattleAction = new BattleAction();
				action.unitSID = 30 + i;
				action.type = BattleActionType.Cast;
				action.param = 0;
				bout.actions.push(action);
				
				var effect:BattleEffect = new BattleEffect();
				effect.unitSID = 35 + i;
				effect.type = Random.generate(0, 3);
				effect.plusHP = effect.type > 0 ?  -Random.generate(1, 200) : 0;
				effect.plusMP = 0;
				effect.buffId = 0;
				action.effects.push(effect);
				
				action = new BattleAction();
				action.unitSID = 35 + i;
				action.type = BattleActionType.Cast;
				action.param = 0;
				bout.actions.push(action);
				
				effect = new BattleEffect();
				effect.unitSID = 30 + i;
				effect.type = Random.generate(0, 3);
				effect.plusHP = effect.type > 0 ?  -Random.generate(1, 200) : 0;
				effect.plusMP = 0;
				effect.buffId = 0;
				action.effects.push(effect);
			}
			
			return bout;
		}
		
		private function createBout2():BattleBout
		{
			return new BattleBout();
		}
	}
}