package Action.War.Manager
{
	import Action.Core.Flow.IActivity;
	import Action.Model.BattleUnit;
	import Action.Resource.ResourceManager;
	import Action.War.BattleResourceEnum;
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

		public function get resId():int
		{
			return _battleUnit.id;	
		}
		
		public function get resourceManager():BattleResourceManager
		{
			return BattleResourceManager.getInstance(resId);
		}
		
		public function getAttackBitmap(idx:int):Bitmap
		{
			return resourceManager.attackBitmaps[idx];
		}
		
		public function getDefendBitmap(idx:int):Bitmap
		{
			return resourceManager.defendBitmaps[idx];
		}
		
		public function getMoveBitmap(idx:int):Bitmap
		{
			return resourceManager.moveBitmaps[idx];
		}
		
		public function getWaitBitmap(idx:int):Bitmap
		{
			return resourceManager.waitBitmaps[idx];
		}
		
		public function getHurtBitmap(idx:int):Bitmap
		{
			return resourceManager.hurtBitmaps[idx];
		}
		
		public function BattleUnitManager(bu:BattleUnit)
		{
			_battleUnit = bu;
		}
	}
}