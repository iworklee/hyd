package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleReport;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	public class BattleReportOverRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{		
		public function BattleReportOverRenderer(reportMgr:BattleReportManager)
		{
			super(reportMgr);
		}
		
		public function get description():String
		{
			return "战斗结束";
		}
		
		public function render(graphics:CanvasGraphics):void
		{
			var index:int = _moviePlayer.currentFrame - _initialFrame;
			var exceptions:Array = new Array();
			for each(var bum:BattleUnitManager in _battleReportManager.getBUMS())
			{
				if(!bum.isWall)
				{
					exceptions[bum.SID] = bum;
					bum.direction = BattleDefs.DIR_DOWN;
					if(bum.isWinner)
						graphics.drawBitmap(index % 8 < 2 ? bum.getCureBitmap() : bum.getWaitBitmap(), bum.realPoint);
					else
						graphics.drawBitmap(bum.getDeadBitmap(int(index % 8 / 4)), bum.realPoint);
				}
			}
			super.drawWaitBitmaps(graphics, exceptions);
		}
		
		public override function leave(graphics:CanvasGraphics):void
		{			
			graphics.container.showMessage(_battleReportManager.getResult());
		}
		
		public function getFrameLength():int
		{
			return 24;
		}
	}
}