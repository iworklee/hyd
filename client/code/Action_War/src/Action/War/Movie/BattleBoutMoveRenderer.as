package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleAction;
	import Action.War.BattleDefs;
	import Action.War.Report.BattleReportManager;
	
	public class BattleBoutMoveRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{
		private var _action:BattleAction;
		
		public function BattleBoutMoveRenderer(reportMgr:BattleReportManager, action:BattleAction)
		{
			super(reportMgr);
			_action = action;
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
			return 50 / BattleDefs.MOVE_POS_OFFSET;
		}
	}
}