package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Resource.BattleUnitResource;
	
	import Action.Core.Util.NumberWrapper;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	public class UnitMoveResourceStrategy implements IUnitResourceStrategy
	{
		public function UnitMoveResourceStrategy()
		{
		}
		
		public function getBitmaps(resource:BattleUnitResource):Array
		{
			return resource.moveBitmaps;
		}
		
		public function loadBitmaps(resource:BattleUnitResource,sourceBmp:BitmapData):void
		{
			var moveBmps:Array = resource.moveBitmaps;
			var waitBmps:Array = resource.waitBitmaps;
			var hurtBmps:Array = resource.hurtBitmaps;
			var targetBmp:BitmapData = null;
			
			for(var y:int = 0; y < 6; y++)
			{
				targetBmp = BitmapHelper.cutBitmap(sourceBmp, 0, y * 48, 48, 48);
				moveBmps.push(targetBmp);
			}
			
			for(y = 4; y < 6; y++)
			{
				targetBmp = BitmapHelper.reverseBitmap(moveBmps[y]);
				moveBmps.push(targetBmp);
			}
			
			for(y = 6; y < 9; y++)
			{
				targetBmp = BitmapHelper.cutBitmap(sourceBmp, 0, y * 48, 48, 48);
				waitBmps.push(targetBmp);
			}
			
			targetBmp = BitmapHelper.reverseBitmap(waitBmps[2]);
			waitBmps.push(targetBmp);
			
			for(y = 9; y < 11; y++)
			{
				targetBmp = BitmapHelper.cutBitmap(sourceBmp, 0, y * 48, 48, 48);
				hurtBmps.push(targetBmp);
			}
		}
		
		public function getRequestUrl(resourceManager:BattleUnitResource):String
		{
			return "BU/m" + NumberWrapper.wrap(resourceManager.resId).toText(3) + ".png";
		}
		
		public function getBitmapSize():Point
		{
			return new Point(48, 528);
		}
	}
}