package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	import mx.states.OverrideBase;
	
	public class BattleBoutDeadRenderer extends BattleFrameRendererBase implements IMovieFrameRenderer
	{		
		private var _deadBUMS:Array
		
		public function BattleBoutDeadRenderer(brManager:BattleReportManager)
		{
			super(brManager);
		}
		
		public function get description():String
		{
			return _deadBUMS.length + "支部队败退";
		}
		
		public override function enter(graphics:CanvasGraphics):void
		{
			_deadBUMS = _battleReportManager.getDeadBUMS();
		}
		
		public function render(graphics:CanvasGraphics):void
		{
			if(_deadBUMS.length == 0)
			{
				_moviePlayer.goto(_moviePlayer.currentFrame + getFrameLength());
				return;
			}
			var index:int = _moviePlayer.currentFrame - _initialFrame;
			var exceptions:Array = new Array();
			for each(var bum:BattleUnitManager in _deadBUMS)
			{
				if(bum.isWall)
					continue;
				exceptions[bum.SID] = bum;
				if(index % 4 < 2)
					graphics.drawBitmap(bum.getDeadBitmap(0), bum.tempPoint);
			}
			super.drawWaitBitmaps(graphics, exceptions);
		}
		
		public override function leave(graphics:CanvasGraphics):void
		{
			for each(var bum:BattleUnitManager in _deadBUMS)
			{
				if(bum.isWall)
					continue;
				_battleReportManager.delBUM(bum.SID);
			}
		}
		
		public function getFrameLength():int
		{
			return 12;
		}
	}
}