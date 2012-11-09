package Action.War.Strategy
{
	import Action.War.Resource.BattleSkillResource;
	
	import flash.display.BitmapData;

	public interface ISkillResourceStrategy
	{
		function loadBitmaps(resource:BattleSkillResource, sourceBmp:BitmapData):void;
	}
}