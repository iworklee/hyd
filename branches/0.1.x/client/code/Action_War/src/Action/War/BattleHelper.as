package Action.War
{
	import Action.War.Config.BattleHero;
	import Action.War.Resource.BattleSkillResource;
	
	import flash.display.BitmapData;
	import flash.geom.Point;

	public class BattleHelper
	{
		public function BattleHelper()
		{
		}		
		
		private static var _skillNamePoint:Point = new Point(250, -50);
		public static function getSkillNamePoint():Point
		{
			return _skillNamePoint;
		}
		
		private static var _boutNamePoint:Point = new Point(250, 50);
		public static function getBoutNamePoint():Point
		{
			return _boutNamePoint;
		}
		
		private static var _resultPoint:Point = new Point(100, -50);
		public static function getResultPoint():Point
		{
			return _resultPoint;
		}
		
		private static var _heroDescPoints:Array = [new Point(80, 410), new Point(522, 410)];
		public static function getHeroDescPoint(sid:int):Point
		{
			return _heroDescPoints[int(sid / BattleDefs.SPLIT_SID)] as Point;
		}
		
		private static var _headBitmapPoints:Array = [new Point(50, -50), new Point(522, -50)];
		public static function getHeadBitmapPoint(sid:int):Point
		{
			return _headBitmapPoints[int(sid / BattleDefs.SPLIT_SID)] as Point;
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
		
		public static function getWallOffsetX(sid:int):int
		{
			return sid < BattleDefs.SPLIT_SID ? 7 : 0;
		}
		
		public static function getPowerfullBitmap(hero:BattleHero, idx:int):BitmapData
		{
			var srid:int = hero.job != 6 ? BattleDefs.STATE_POWERFULL_1 : BattleDefs.STATE_POWERFULL_2;
			return BattleSkillResource.getInstance(srid).bitmaps[idx];
		}
	}
}