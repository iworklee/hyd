package Action.War
{
	import Action.Model.BattleEffect;
	
	import Action.Core.Util.NumberWrapper;
	
	import flash.geom.Point;

	public class BattleDefs
	{
		public function BattleDefs()
		{
		}
		
		public static const SPLIT_SID:int = 35;
		public static const INIT_POS_OFFSET:int = 25;
		public static const MOVE_POS_OFFSET:int = 10;
		
		public static const DIR_DOWN:int = 0;
		public static const DIR_UP:int = 1;
		public static const DIR_LEFT:int = 2;
		public static const DIR_RIGHT:int = 3;
		
		public static const SKILL_PHASE_PREVIOUS:int = 0;
		public static const SKILL_PHASE_CURRENT:int = 1;
		public static const SKILL_PHASE_POST:int = 2;
	}
}