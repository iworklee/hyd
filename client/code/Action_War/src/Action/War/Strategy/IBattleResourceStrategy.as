package Action.War.Strategy
{
	import Action.War.Resource.BattleUnitResource;
	
	import flash.display.Bitmap;
	import flash.geom.Point;

	public interface IBattleResourceStrategy
	{
		function getBitmaps(resourceManager:BattleUnitResource):Array;
		function loadBitmaps(resourceManager:BattleUnitResource, sourceBmp:Bitmap):void;
		function getRequestUrl(resourceManager:BattleUnitResource):String;
		function getBitmapSize():Point;
	}
}