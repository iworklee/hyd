package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	import mx.states.OverrideBase;
	
	public class BattleBoutDeadRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{		
		private var _deadBUMS:Array
		
		public function BattleBoutDeadRenderer(brManager:BattleReportManager)
		{
			super(brManager);
		}
		
		public function get name():String
		{
			return "BoutDead";
		}
		
		public override function enter(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			_deadBUMS = _battleReportManager.getDeadBUMS();
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			if(_deadBUMS.length == 0)
			{
				player.goto(player.currentFrame + getFrameLength());
				return;
			}
			var index:int = player.currentFrame - _initialFrame;
			var exceptions:Array = new Array();
			for each(var bum:BattleUnitManager in _deadBUMS)
			{
				exceptions[bum.SID] = bum;
				if(index % 4 < 2)
					graphics.drawBitmap(bum.getDeadBitmap(), bum.paintPoint);
			}
			super.drawWaitBitmaps(graphics, exceptions);
		}
		
		public override function leave(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			for each(var bum:BattleUnitManager in _deadBUMS)
				_battleReportManager.delBUM(bum.SID);
		}
		
		public function getFrameLength():int
		{
			return 12;
		}
	}
}