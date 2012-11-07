package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Resource.BattleUnitResource;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	public class AttackResourceStrategy implements IBattleResourceStrategy
	{
		public function AttackResourceStrategy()
		{
		}
		
		public function getBitmaps(resourceManager:BattleUnitResource):Array
		{
			return resourceManager.attackBitmaps;
		}
		
		public function loadBitmaps(resourceManager:BattleUnitResource,sourceBmp:Bitmap):void
		{
			var attackBmps:Array = resourceManager.attackBitmaps;
			var targetBmp:Bitmap = null;
			
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
		
		public function getRequestUrl(resourceManager:BattleUnitResource):String
		{
			return "BU/a" + NumberWrapper.wrap(resourceManager.resId).toText(3) + ".png";
		}
		
		public function getBitmapSize():Point
		{
			return new Point(64, 768);
		}
	}
}