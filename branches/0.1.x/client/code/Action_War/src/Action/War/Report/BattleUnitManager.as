package Action.War.Report
{
	import Action.Core.Flow.IActivity;
	import Action.Core.GamePlugins;
	import Action.Core.Util.NumberWrapper;
	import Action.Model.BattleUnit;
	import Action.Resource.CommonResource;
	import Action.Resource.HeroFaceResource;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.Config.BattleConfigFactory;
	import Action.War.Config.BattleHero;
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
		
		public function BattleUnitManager(brm:BattleReportManager, bu:BattleUnit)
		{
			_battleReportManager = brm;
			_battleUnit = bu;
			HP = bu.hP;
			MP = bu.mP;
			POS = bu.pos;
			BUFF = 0;
			
			_hero = BattleConfigFactory.getHero(bu.id);
		}
		
		private var _battleReportManager:BattleReportManager;
		private var _battleUnit:BattleUnit;
		
		private var _hero:BattleHero;
		public function get hero():BattleHero
		{
			return _hero;
		}
		
		public function get SID():int
		{
			return _battleUnit.sID;
		}
		
		public function get isWall():Boolean
		{
			return _hero.id == 0;
		}
		
		public function get isDead():Boolean
		{
			return HP <= 0;
		}
		
		public function get isWinner():Boolean
		{
			return _battleUnit.sID < BattleDefs.SPLIT_SID ? _battleReportManager.win : !_battleReportManager.win;
		}
		
		//public var image:Image;
		public var tempPoint:Point;
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
		
		public function turnTo(pos:int):void
		{
			if(pos == POS)
				return;
			if(int(pos / 5) == int(POS / 5))
			{
				if(pos < POS)
					direction = BattleDefs.DIR_UP;
				else
					direction = BattleDefs.DIR_DOWN;
			}
			else
				resetDir();
		}
		
		public function get unitResId():int
		{
			if(_hero.id == 0)
				return 0;
			var rid:int = _hero.unit;
			if(_hero.id >= BattleDefs.SPLIT_HERO_ID && _battleUnit.sID >= BattleDefs.SPLIT_SID)
				rid += 100;
			return rid;
		}
		
		public function get unitResource():BattleUnitResource
		{
			return BattleUnitResource.getInstance(unitResId);
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
			return unitResource.otherBitmaps[0];
		}
		
		public function getCureBitmap():BitmapData
		{
			return unitResource.otherBitmaps[1];
		}
		
		public function getDeadBitmap(idx:int):BitmapData
		{
			return unitResource.otherBitmaps[idx + 2];
		}
		
		public function getOtherBitmap(idx:int):BitmapData
		{
			return unitResource.otherBitmaps[idx];
		}
	}
}