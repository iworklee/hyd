package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Resource.BattleUnitResource;
	
	import Action.Core.Util.NumberWrapper;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class UnitAttackResourceStrategy implements IUnitResourceStrategy
	{
		public function UnitAttackResourceStrategy()
		{
		}
		
		public function getBitmaps(resource:BattleUnitResource):Array
		{
			return resource.attackBitmaps;
		}
		
		public function loadBitmaps(resource:BattleUnitResource,sourceBmp:BitmapData):void
		{
			var attackBmps:Array = resource.attackBitmaps;
			var targetBmp:BitmapData = null;
			
			for(var y:int=0; y<12; y++)
			{
				targetBmp = BitmapHelper.cutBitmap(sourceBmp, 0, y * 64, 64, 64);
				attackBmps.push(targetBmp);
			}
			
			for(var i:int=8; i<12; i++)
			{
				targetBmp = BitmapHelper.reverseBitmap(attackBmps[i]);
				attackBmps.push(targetBmp);
			}
		}
		
		public function getRequestUrl(resource:BattleUnitResource):String
		{
			return "BU/a" + NumberWrapper.wrap(resource.resId).toText(3) + ".png";
		}
		
		public function getBitmapSize():Point
		{
			return new Point(64, 768);
		}
	}
}