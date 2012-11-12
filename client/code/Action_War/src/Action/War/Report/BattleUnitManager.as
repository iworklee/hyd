package Action.War.Report
{
	import Action.Core.Flow.IActivity;
	import Action.Core.Util.NumberWrapper;
	import Action.Model.BattleUnit;
	import Action.Resource.CommonResource;
	import Action.Resource.HeroResource;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.BattleResourceEnum;
	import Action.War.Flow.LoadBattleUnitResourceActivity;
	import Action.War.Resource.BattleUnitResource;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import mx.controls.Image;
	import mx.controls.Label;

	public class BattleUnitManager
	{		
		public var HP:int;
		public var MP:int;
		public var POS:int;
		public var BUFF:int;
		
		public function get maxHP():int
		{
			return _battleUnit.hP;
		}
		
		public function get maxMP():int
		{
			return 100;
		}
		
		public function BattleUnitManager(bu:BattleUnit)
		{
			_battleUnit = bu;
			HP = bu.hP;
			MP = bu.mP;
			POS = bu.pos;
			BUFF = 0;
		}
		
		private var _battleUnit:BattleUnit;
		
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
		
		public function get isWall():Boolean
		{
			return heroId == 0;
		}
		
		public function get isHero():Boolean
		{
			return  heroId > 0 && heroId < 100;
		}
		
		public function get isDead():Boolean
		{
			return HP <= 0;
		}
		
		//public var image:Image;
		public var paintPoint:Point;
		public var direction:int;
		public var speed:int;
		
		public function get realPoint():Point
		{
			return BattleHelper.getPaintPoint(POS);
		}
		
		public function getInitOffset():int
		{
			return _battleUnit.sID < BattleDefs.SPLIT_SID ? -BattleDefs.INIT_POS_OFFSET : BattleDefs.INIT_POS_OFFSET;
		}
		
		public function resetDir():void
		{
			if(SID < BattleDefs.SPLIT_SID)
			{
				direction = BattleDefs.DIR_RIGHT;
				speed = BattleDefs.MOVE_POS_OFFSET;
			}
			else
			{
				direction = BattleDefs.DIR_LEFT;
				speed = -BattleDefs.MOVE_POS_OFFSET;
			}	
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
		
		public function getHurtBitmap():BitmapData
		{
			return unitResource.hurtBitmaps[0];
		}
		
		public function getBuffBitmap():BitmapData
		{
			return unitResource.hurtBitmaps[1];
		}
		
		public function getDeadBitmap():BitmapData
		{
			return unitResource.hurtBitmaps[2];
		}
	}
}