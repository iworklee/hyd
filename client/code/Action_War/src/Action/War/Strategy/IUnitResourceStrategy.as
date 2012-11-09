package Action.War.Strategy
{
	import Action.War.Resource.BattleUnitResource;
	
	import flash.display.BitmapData;
	import flash.geom.Point;

	public interface IUnitResourceStrategy
	{
		function getBitmaps(resource:BattleUnitResource):Array;
		function loadBitmaps(resource:BattleUnitResource, sourceBmp:BitmapData):void;
		function getRequestUrl(resource:BattleUnitResource):String;
		//function getBitmapSize():Point;
	}
}