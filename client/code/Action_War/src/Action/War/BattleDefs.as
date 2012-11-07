package Action.War
{
	import flash.geom.Point;

	public class BattleDefs
	{
		public function BattleDefs()
		{
		}
		
		public static const SPLIT_POS:int = 35;
		public static const INIT_POS_OFFSET:int = 25;
		public static const MOVE_POS_OFFSET:int = 10;
		
		public static const DIR_DOWN:int = 0;
		public static const DIR_UP:int = 1;
		public static const DIR_LEFT:int = 2;
		public static const DIR_RIGHT:int = 3;
		
		private static var _battleEffectTypeDescs:Array = ["闪避", "格挡", "", "暴击"];		
		public static function getBattleEffectTypeDesc(type:int):String
		{
			if(type < 0 || type >= _battleEffectTypeDescs.length)
				return "";
			return _battleEffectTypeDescs[type];
		}
		
		public static function getSkillNamePoint():Point
		{
			return new Point(250, 20);
		}
	}
}