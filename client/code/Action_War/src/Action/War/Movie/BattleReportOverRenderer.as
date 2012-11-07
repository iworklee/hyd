package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleDefs;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	public class BattleReportOverRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{		
		public function BattleReportOverRenderer(reportMgr:BattleReportManager)
		{
			super(reportMgr);
		}
		
		public function get name():String
		{
			return "ReportOver";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{			
			super.drawWaitBitmaps(graphics);
			//graphics.alert("战斗结束");
		}
		
		public function getFrameLength():int
		{
			return 1;
		}
	}
}