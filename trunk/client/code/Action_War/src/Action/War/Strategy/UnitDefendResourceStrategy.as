package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Resource.BattleUnitResource;
	
	import Util.NumberWrapper;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class UnitDefendResourceStrategy implements IUnitResourceStrategy
	{
		public function UnitDefendResourceStrategy()
		{
		}
		
		public function getBitmaps(resource:BattleUnitResource):Array
		{
			return resource.defendBitmaps;
		}
		
		public function loadBitmaps(resource:BattleUnitResource,sourceBmp:BitmapData):void
		{
			var defendBmps:Array = resource.defendBitmaps;
			var hurtBmps:Array = resource.hurtBitmaps;
			var targetBmp:BitmapData = null;
			
			for(var y:int = 0; y < 3; y++)
			{
				targetBmp = BitmapHelper.cutBitmap(sourceBmp, 0, y * 48, 48, 48);
				defendBmps.push(targetBmp);
			}
			
			targetBmp = BitmapHelper.reverseBitmap(defendBmps[2]);
			defendBmps.push(targetBmp);
			
			for(y = 3; y < 5; y++)
			{
				targetBmp = BitmapHelper.cutBitmap(sourceBmp, 0, y * 48, 48, 48);
				hurtBmps.push(targetBmp);
			}
		}
		
		public function getRequestUrl(resourceManager:BattleUnitResource):String
		{
			return "BU/d" + NumberWrapper.wrap(resourceManager.resId).toText(3) + ".png";
		}
		
		public function getBitmapSize():Point
		{
			return new Point(48, 240);
		}
	}
}