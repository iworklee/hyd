package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleReport;
	import Action.War.Manager.BattleReportManager;
	
	public class BattleBoutFightRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{
		private var _fightActions:Array;
		
		public function BattleBoutFightRenderer(reportMgr:BattleReportManager, actions:Array)
		{
			super(reportMgr);
			_fightActions = actions;
		}
		
		public function get name():String
		{
			return "BoutFight";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			super.drawWaitBitmaps(graphics);
		}
		
		public function getFrameLength():int
		{
			return 1;
		}
	}
}