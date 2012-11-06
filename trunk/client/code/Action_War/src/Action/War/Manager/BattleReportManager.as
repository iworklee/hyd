package Action.War.Manager
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.Movie;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;
	import Action.War.BattleDefs;
	import Action.War.Flow.LoadBattleUnitActivity;
	import Action.War.Movie.BattleReportInitRenderer;
	import Action.War.Movie.BattleReportOverRenderer;

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
		
		private var _playSpeed:int = 1;
		public function get playSpeed():int
		{
			return _playSpeed;
		}
		public function set playSpeed(spd:int):void
		{
			_playSpeed = spd;
		}
		
		public function BattleReportManager(report:BattleReport)
		{
			_battleReport = report;
			for each(var bu:BattleUnit in _battleReport.units)
				_buManagers[bu.sID] = new BattleUnitManager(bu);
		}
		
		public function createLoadingActivities():Array
		{
			var acts:Array = new Array();
			for each(var bum:BattleUnitManager in _buManagers)
			{
				if(BattleResourceManager.getInstance(bum.resId) == null)
				{
					BattleResourceManager.createInstance(bum.resId);
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
			var movie:Movie = new Movie();
			movie.setFrameRenderer(BattleDefs.FRAME_INIT, new BattleReportInitRenderer(this));
			movie.setFrameRenderer(BattleDefs.FRAME_BOUNTS, new BattleReportOverRenderer(this));
			return movie;
		}
		
		public function dispose():void
		{
			_buManagers = new Array();
		}
	}
}