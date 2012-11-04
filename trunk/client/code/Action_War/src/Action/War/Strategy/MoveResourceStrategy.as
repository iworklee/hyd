package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Manager.BattleResourceManager;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	public class MoveResourceStrategy implements IBattleResourceStrategy
	{
		public function MoveResourceStrategy()
		{
		}
		
		public function getBitmaps(resourceManager:BattleResourceManager):Array
		{
			return resourceManager.moveBitmaps;
		}
		
		public function loadBitmaps(resourceManager:BattleResourceManager,sourceBmp:Bitmap):void
		{
			var moveBmps:Array = resourceManager.moveBitmaps;
			var waitBmps:Array = resourceManager.waitBitmaps;
			var hurtBmps:Array = resourceManager.hurtBitmaps;
			var targetBmp:Bitmap = null;
			
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
		
		public function getRequestUrl(resourceManager:BattleResourceManager):String
		{
			return "BU/m" + NumberWrapper.wrap(resourceManager.resId).toText(3) + ".png";
		}
		
		public function getBitmapSize():Point
		{
			return new Point(48, 528);
		}
	}
}