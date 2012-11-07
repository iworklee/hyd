package Action.War.Report
{
	import Action.Core.Flow.IActivity;
	import Action.Model.BattleUnit;
	import Action.Resource.ResourceManager;
	import Action.War.BattleDefs;
	import Action.War.BattleResourceEnum;
	import Action.War.Flow.LoadBattleUnitActivity;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	import mx.controls.Image;
	import mx.controls.Label;
	import Action.War.Resource.BattleUnitResource;

	public class BattleUnitManager
	{
		private var _battleUnit:BattleUnit;		
		public function get battleUnit():BattleUnit
		{
			return _battleUnit;
		}
		
		public function get SID():int
		{
			return _battleUnit.sID;
		}

		public function get resId():int
		{
			return _battleUnit.id;	
		}
		
		public function get alive():Boolean
		{
			return _battleUnit.hP > 0;
		}
		
		//public var image:Image;
		public var paintPoint:Point;
		public var direction:int;
		public var speed:int;
		
		public function getInitOffset():int
		{
			return _battleUnit.sID < BattleDefs.SPLIT_POS ? -BattleDefs.INIT_POS_OFFSET : BattleDefs.INIT_POS_OFFSET;
		}
		
		public function get resourceManager():BattleUnitResource
		{
			return BattleUnitResource.getInstance(resId);
		}
		
		public function getAttackBitmap(idx:int):Bitmap
		{
			return resourceManager.attackBitmaps[direction * 4 + idx];
		}
		
		public function getDefendBitmap():Bitmap
		{
			return resourceManager.defendBitmaps[direction];
		}
		
		public function getMoveBitmap(idx:int):Bitmap
		{
			return resourceManager.moveBitmaps[direction * 2 + idx];
		}
		
		public function getWaitBitmap():Bitmap
		{
			return resourceManager.waitBitmaps[direction];
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