package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.Report.BattleReportManager;
	
	public class BattleBoutMoveRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{
		private var _moveActions:Array;
		
		public function BattleBoutMoveRenderer(reportMgr:BattleReportManager, actions:Array)
		{
			super(reportMgr);
			_moveActions = actions;
		}
		
		public function get name():String
		{
			return "BoutMove";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
		}
		
		public function getFrameLength():int
		{
			return 0;
		}
	}
}