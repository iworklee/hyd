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
				else if(i < 20 || i > 49)
					unit.id = 104;
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
				
				if(action.unitSID == 32)
				{
					action.param = int(Random.select([101, 106]));
					if(action.param == 101)
					{
						for(var j:int = 0; j<3; j++)
							addEffect(action, 36 + j);
					}
					else
					{
						for(j=0; j<3; j++)
							addEffect(action, 26 + j, 4);
						for(j=0; j<3; j++)
							addEffect(action, 31 + j, 4);
					}
				}
				else
					addEffect(action, 35 + i);
				
				action = new BattleAction();
				action.unitSID = 35 + i;
				action.type = BattleActionType.Cast;
				action.param = 0;
				bout.actions.push(action);
				
				if(action.unitSID == 37)
				{
					action.param = int(Random.select([1, 2]))
					if(action.param == 1)
					{
						for(j = 0; j<3; j++)
							addEffect(action, 22 + j * 5);
					}
					else
					{
						for(j = 0; j<3; j++)
							addEffect(action, 31 + j);
					}
				}
				else
					addEffect(action, 30 + i);
			}
			
			return bout;
		}
		
		private function addEffect(action:BattleAction, unitSID:int, type:int=-1):void
		{
			var effect:BattleEffect = new BattleEffect();
			effect.unitSID = unitSID;
			effect.type = type < 0 ? Random.generate(0, 3) : type;
			effect.plusHP = effect.type > 0 ?  -Random.generate(1, 200) : 0;
			effect.plusMP = 0;
			effect.buffId = 0;
			action.effects.push(effect);
		}
		
		private function createBout2():BattleBout
		{
			return new BattleBout();
		}
	}
}