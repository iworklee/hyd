package Action.War.Strategy
{
	public class BattleResourceStrategyFactory
	{
		public static var strategies:Array = 
			[
				new AttackResourceStrategy(),
				new DefendResourceStrategy(),
				new MoveResourceStrategy()
			];
		
		public function BattleResourceStrategyFactory()
		{
		}
	}
}