package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Manager.BattleResourceManager;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	public class DefendResourceStrategy implements IBattleResourceStrategy
	{
		public function DefendResourceStrategy()
		{
		}
		
		public function getBitmaps(resourceManager:BattleResourceManager):Array
		{
			return resourceManager.defendBitmaps;
		}
		
		public function loadBitmaps(resourceManager:BattleResourceManager,sourceBmp:Bitmap):void
		{
			var defendBmps:Array = resourceManager.defendBitmaps;
			var hurtBmps:Array = resourceManager.hurtBitmaps;
			var targetBmp:Bitmap = null;
			
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
		
		public function getRequestUrl(resourceManager:BattleResourceManager):String
		{
			return "BU/d" + NumberWrapper.wrap(resourceManager.resId).toText(3) + ".png";
		}
		
		public function getBitmapSize():Point
		{
			return new Point(48, 240);
		}
	}
}