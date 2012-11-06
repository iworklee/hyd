package Action.War
{
	import flash.geom.Point;

	public class BattleHelper
	{
		public function BattleHelper()
		{
		}
		
		public static function getPaintPoint(pos:int):Point
		{				
			return new Point((int((pos+100) / 5)-20) * 50, (pos + 100) % 5 * 50);
		}
	}
}