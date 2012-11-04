package Action.War
{
	import Action.Core.Flow.IActivity;
	import Action.Model.BattleUnit;
	import Action.Resource.ResourceManager;
	import Action.War.Flow.LoadBattleUnitActivity;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;

	public class BattleUnitManager
	{
		private var _battleUnit:BattleUnit;		
		public function get battleUnit():BattleUnit
		{
			return _battleUnit;
		}
		
		public var image:Bitmap;
		
		public function BattleUnitManager(bu:BattleUnit)
		{
			_battleUnit = bu;
		}
		
		public function getImageUrl():String
		{
			return ResourceManager.parseUrl("BU/" + _battleUnit.id.toString() + ".png");
		}
		
		public function createLoadingActivitiy():IActivity
		{
			return new LoadBattleUnitActivity(_battleUnit.id);
		}
	}
}