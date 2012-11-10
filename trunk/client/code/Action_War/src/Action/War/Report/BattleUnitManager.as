package Action.War.Report
{
	import Action.Core.Flow.IActivity;
	import Action.Model.BattleUnit;
	import Action.Resource.CommonResource;
	import Action.Resource.HeroResource;
	import Action.War.BattleDefs;
	import Action.War.BattleResourceEnum;
	import Action.War.Flow.LoadBattleUnitResourceActivity;
	import Action.War.Resource.BattleUnitResource;
	
	import Util.NumberWrapper;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import mx.controls.Image;
	import mx.controls.Label;

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
		
		public function get heroId():int
		{
			return _battleUnit.id;
		}

		public function get resId():int
		{
			return _battleUnit.id;	
		}
		
		public function get isHero():Boolean
		{
			return heroId < 100;
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
		
		public function get heroResource():HeroResource
		{
			return HeroResource.getInstance(heroId);
		}
		
		public function get unitResource():BattleUnitResource
		{
			return BattleUnitResource.getInstance(resId);
		}
		
		public function getHeadBitmap():BitmapData
		{
			return heroResource.headBitmap;
		}
		
		public function getAttackBitmap(idx:int):BitmapData
		{
			return unitResource.attackBitmaps[direction * 4 + idx];
		}
		
		public function getDefendBitmap():BitmapData
		{
			return unitResource.defendBitmaps[direction];
		}
		
		public function getMoveBitmap(idx:int):BitmapData
		{
			return unitResource.moveBitmaps[direction * 2 + idx];
		}
		
		public function getWaitBitmap():BitmapData
		{
			return unitResource.waitBitmaps[direction];
		}
		
		public function getHurtBitmap(idx:int):BitmapData
		{
			return unitResource.hurtBitmaps[idx];
		}
		
		public function BattleUnitManager(bu:BattleUnit)
		{
			_battleUnit = bu;
		}
	}
}