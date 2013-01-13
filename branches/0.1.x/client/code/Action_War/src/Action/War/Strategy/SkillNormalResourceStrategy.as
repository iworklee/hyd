package Action.War.Strategy
{
	import Action.Display.Drawing.BitmapHelper;
	import Action.War.Resource.BattleSkillResource;
	
	import flash.display.BitmapData;

	public class SkillNormalResourceStrategy implements ISkillResourceStrategy
	{
		public function SkillNormalResourceStrategy()
		{
		}
		
		public function loadBitmaps(resource:BattleSkillResource, sourceBmp:BitmapData):void
		{
			var size:int = sourceBmp.width;
			var count:int = int(sourceBmp.height / sourceBmp.width);
			for(var i:int=0; i<count; i++)
			{
				var targetBmp:BitmapData = BitmapHelper.cutBitmap(sourceBmp, 0, i * size, size, size);
				resource.bitmaps.push(targetBmp);
			}
		}
	}
}