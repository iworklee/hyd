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
	import Action.War.BattleDefs;
	import Action.War.Flow.LoadBattleUnitActivity;
	import Action.War.Movie.BattleBoutFightRenderer;
	import Action.War.Movie.BattleBoutMoveRenderer;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Movie.BattleReportInitRenderer;
	import Action.War.Movie.BattleReportOverRenderer;
	import Action.War.Resource.BattleUnitResource;

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
		
		private var _battleReport:BattleReport;
		public function get battleReport():BattleReport
		{
			return _battleReport;
		}
		
		private var _buManagers:Array = new Array();
		
		public function getBattleUnitManagers():Array
		{
			return _buManagers;
		}
		
		public function getBattleUnitManager(sid:int):BattleUnitManager
		{
			return _buManagers[sid];
		}
		
		public function BattleReportManager(report:BattleReport)
		{
			_battleReport = report;
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
			for each(var bum:BattleUnitManager in _buManagers)
			{
				if(BattleUnitResource.getInstance(bum.resId) == null)
				{
					BattleUnitResource.createInstance(bum.resId);
					for(var i:int = 0; i<3; i++)
						acts.push(new LoadBattleUnitActivity(bum.resId, i));
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
				var moveActions:Array = new Array();
				if(true)
				{
					for each(var action:BattleAction in bout.actions)
					{
						if(action.type == BattleActionType.Cast)
							movie.appendFrameRenderer(new BattleBoutSkillRenderer(this, action));
						else
							moveActions.push(action);
					}
				}
				else
				{
					var fightActions:Array = new Array();
					for each(action in bout.actions)
					{
						if(action.type == BattleActionType.Cast)
							fightActions.push(action);
						else
							moveActions.push(action);
					}
					movie.appendFrameRenderer(new BattleBoutFightRenderer(this, fightActions));					
				}
				if(moveActions.length > 0)
					movie.appendFrameRenderer(new BattleBoutMoveRenderer(this, moveActions));
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