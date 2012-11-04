package Action.War.Strategy
{
	import Action.War.Manager.BattleResourceManager;
	
	import flash.display.Bitmap;
	import flash.geom.Point;

	public interface IBattleResourceStrategy
	{
		function getBitmaps(resourceManager:BattleResourceManager):Array;
		function loadBitmaps(resourceManager:BattleResourceManager, sourceBmp:Bitmap):void;
		function getRequestUrl(resourceManager:BattleResourceManager):String;
		function getBitmapSize():Point;
	}
}