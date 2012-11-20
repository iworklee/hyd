package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Resource.BattleUnitResource;
	
	import flash.display.BitmapData;
	
	public class UnitWallResourceStrategy implements IUnitResourceStrategy
	{
		public function UnitWallResourceStrategy()
		{
		}
		
		public function getBitmaps(resource:BattleUnitResource):Array
		{
			return resource.otherBitmaps;
		}
		
		public function loadBitmaps(resource:BattleUnitResource, sourceBmp:BitmapData):void
		{			
			for(var i:int=0; i<3; i++)
			{
				var targetBmp:BitmapData = BitmapHelper.cutBitmap(sourceBmp, 0, i * 48, 48, 48);
				resource.otherBitmaps.push(targetBmp);
			}
		}
		
		public function getRequestUrl(resource:BattleUnitResource):String
		{
			return "BU/wall.png";
		}
	}
}