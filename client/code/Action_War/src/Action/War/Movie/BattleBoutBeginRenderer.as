package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleBout;
	import Action.Model.BattleReport;
	import Action.War.BattleHelper;
	import Action.War.Report.BattleReportManager;
	
	import flashx.textLayout.factory.TruncationOptions;
	
	public class BattleBoutBeginRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{		
		private var _bout:BattleBout;
		
		public function BattleBoutBeginRenderer(reportMgr:BattleReportManager, bout:BattleBout)
		{
			super(reportMgr);
			_bout = bout;
		}
		
		public function get description():String
		{
			return "进入第" + _bout.sID + "回合";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			var text:String = "第" + _bout.sID + "回合";
			graphics.drawText(text, BattleHelper.getBoutNamePoint(), 0xffff00, 64, true, "微软雅黑");
			super.drawWaitBitmaps(graphics);
		}
		
		public function getFrameLength():int
		{
			return 10;
		}
	}
}