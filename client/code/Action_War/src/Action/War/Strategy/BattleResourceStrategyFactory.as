package Action.War.Strategy
{
	import Action.War.WarPlugins;

	public class BattleResourceStrategyFactory
	{
		private static var _unitStrategies:Array = 
			[
				new UnitAttackResourceStrategy(),
				new UnitDefendResourceStrategy(),
				new UnitMoveResourceStrategy()
			];
		
		private static var _skillStrategies:Array = 
			[
				new SkillNormalResourceStrategy()
			];
		
		private static function initialize():void
		{
			
		}
		
		public static function getUnitStrategy(idx:int):IUnitResourceStrategy
		{
			return _unitStrategies[idx];
		}
		
		public static function getSkillStrategy(srid:int):ISkillResourceStrategy
		{
			return _skillStrategies[0];
		}
		
		initialize();
		
		public function BattleResourceStrategyFactory()
		{
		}
	}
}