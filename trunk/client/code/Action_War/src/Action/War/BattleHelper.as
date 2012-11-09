package Action.War
{
	import flash.display.BitmapData;
	import flash.geom.Point;

	public class BattleHelper
	{
		public function BattleHelper()
		{
		}		
		
		public static function getSkillNamePoint():Point
		{
			return new Point(250, 20);
		}
		
		public static function getPaintPoint(pos:int):Point
		{				
			return new Point((int((pos+100) / 5)-20) * 50, (pos + 100) % 5 * 50);
		}
		
		public static function getBitmapOffset(bitmap:BitmapData):Point
		{
			return new Point((48 - bitmap.width) / 2, (48 - bitmap.height) / 2);
		}
	}
}