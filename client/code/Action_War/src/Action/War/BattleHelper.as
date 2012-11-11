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
			return new Point(250, -50);
		}
		
		public static function getBoutNamePoint():Point
		{
			return new Point(250, 50);
		}
		
		public static function getHeadBitmapPoint(sid:int):Point
		{
			return sid < BattleDefs.SPLIT_SID ? new Point(50, -50) : new Point(586, -50);
		}
		
		public static function getPaintPoint(pos:int):Point
		{				
			return new Point((int((pos+100) / 5)-20) * 50, (pos + 100) % 5 * 50);
		}
		
		public static function getBattlePos(point:Point):int
		{
			return int(point.x / 50) * 5 + int(point.y / 50);
		}
		
		public static function getBitmapOffset(bitmap:BitmapData):Point
		{
			return new Point((48 - bitmap.width) / 2, (48 - bitmap.height) / 2);
		}
	}
}