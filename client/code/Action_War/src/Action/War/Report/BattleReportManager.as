package Action.War.Report
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.Movie;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleAction;
	import Action.Model.BattleActionType;
	import Action.Model.BattleBout;
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;
	import Action.Resource.Flow.LoadHeroResourceActivity;
	import Action.Resource.HeroResource;
	import Action.War.BattleDefs;
	import Action.War.Flow.LoadBattleSkillResourceActivity;
	import Action.War.Flow.LoadBattleUnitResourceActivity;
	import Action.War.Movie.BattleBoutBeginRenderer;
	import Action.War.Movie.BattleBoutDeadRenderer;
	import Action.War.Movie.BattleBoutMoveRenderer;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Movie.BattleReportInitRenderer;
	import Action.War.Movie.BattleReportOverRenderer;
	import Action.War.Resource.BattleSkillResource;
	import Action.War.Resource.BattleUnitResource;
	import Action.War.Skill.BattleSkill;
	import Action.War.WarPlugins;

	public class BattleReportManager
	{
		/*private static var _instances:Array = new Array();
		public static function getInstance(buid:String, report:BattleReport = null):BattleReportManager
		{
			if(_instances[buid] == null)
				_instances[buid] = new BattleReportManager(report);
			return _instances[buid];
		}*/
		
		private var _moviePlayer:MoviePlayer;
		public function get moviePlayer():MoviePlayer
		{
			return _moviePlayer;
		}
		
		private var _battleReport:BattleReport;
		public function get battleReport():BattleReport
		{
			return _battleReport;
		}
		
		private var _buManagers:Array = new Array();
		
		public function getBUMS():Array
		{
			return _buManagers;
		}
		
		public function getDeadBUMS():Array
		{
			var bums:Array = new Array();
			for each(var bum:BattleUnitManager in _buManagers)
			{
				if(bum.isDead)
					bums.push(bum);
			}
			return bums;
		}
		
		public function getBUM(sid:int):BattleUnitManager
		{
			return _buManagers[sid];
		}
		
		public function getBUMbyPos(pos:int):BattleUnitManager
		{
			for each(var bum:BattleUnitManager in _buManagers)
			{
				if(bum.POS == pos)
					return bum;
			}
			return null;
		}
		
		public function delBUM(sid:int):void
		{
			delete _buManagers[sid];
		}
		
		public function getBattleActions():Array
		{
			var actions:Array = new Array();
			for each(var bout:BattleBout in _battleReport.bouts)
			{
				for each(var action:BattleAction in bout.actions)
					actions.push(action);
			}
			return actions;
		}
		
		public function BattleReportManager(report:BattleReport)
		{
			_battleReport = report;
			reset();
		}
		
		public function reset():void
		{
			for each(var bu:BattleUnit in _battleReport.units)
			{
				var bum:BattleUnitManager = new BattleUnitManager(bu);
				if(bu.sID < 35)
				{
					bum.direction = BattleDefs.DIR_RIGHT;
					bum.speed = BattleDefs.MOVE_POS_OFFSET;
				}
				else
				{
					bum.direction = BattleDefs.DIR_LEFT;
					bum.speed = -BattleDefs.MOVE_POS_OFFSET;
				}					
				_buManagers[bu.sID] = bum;
			}
		}
		
		public function createLoadingActivities():Array
		{
			var acts:Array = new Array();
			
			//loading BattleUnitResource and HeroResource
			for each(var bum:BattleUnitManager in _buManagers)
			{
				if(BattleUnitResource.getInstance(bum.resId) == null)
				{
					BattleUnitResource.createInstance(bum.resId);
					for(var i:int = 0; i<3; i++)
						acts.push(new LoadBattleUnitResourceActivity(bum.resId, i));
				}
				if(bum.isHero && HeroResource.getInstance(bum.heroId) == null)
				{
					HeroResource.createInstance(bum.heroId);
					acts.push(new LoadHeroResourceActivity(bum.heroId));
				}
			}
			
			//loading BattleSkillResource
			for each(var action:BattleAction in getBattleActions())
			{
				var skill:BattleSkill = BattleSkill.getInstance(action.param);
				if(skill != null)
				{
					for each(var rid:int in skill.resources)
					{
						if(BattleSkillResource.getInstance(rid) == null)
						{
							BattleSkillResource.createInstance(rid);
							acts.push(new LoadBattleSkillResourceActivity(rid));
						}
					}
				}
			}
			
			return acts;
		}
		
		public function play(graphics:CanvasGraphics):void
		{
			if(_moviePlayer != null)
				_moviePlayer.stop();
			_moviePlayer = new MoviePlayer(graphics);
			_moviePlayer.load(buildMovie());
			_moviePlayer.start();
			
			/*for each(var bum:BattleUnitManager in _buManagers)
				graphics.drawBitmap(bum.getWaitBitmap(3), bum.getPaintPoint());	*/		
		}
		
		private function buildMovie():Movie
		{
			//绘制初始移动
			var movie:Movie = new Movie();
			movie.appendFrameRenderer(new BattleReportInitRenderer(this));
			
			//绘制每回合的行为
			for each(var bout:BattleBout in _battleReport.bouts)
			{
				movie.appendFrameRenderer(new BattleBoutBeginRenderer(this, bout));				
				for each(var action:BattleAction in bout.actions)
				{
					switch(action.type)
					{
						case BattleActionType.Cast:
							movie.appendFrameRenderer(new BattleBoutSkillRenderer(this, action));
							movie.appendFrameRenderer(new BattleBoutDeadRenderer(this));
							break;
						case BattleActionType.Move:
							movie.appendFrameRenderer(new BattleBoutMoveRenderer(this, action));
							break;
					}
				}
			}
			
			//绘制战斗结果
			movie.appendFrameRenderer(new BattleReportOverRenderer(this));
			return movie;
		}
		
		public function dispose():void
		{
			_buManagers = new Array();
		}
	}
}