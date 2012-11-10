package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleHelper;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;

	public class MovieFrameRendererBase
	{
		protected var _battleReportManager:BattleReportManager;
		public function get battleReportManager():BattleReportManager
		{
			return _battleReportManager;
		}
		
		protected var _initialFrame:int;
		
		public function drawWaitBitmaps(graphics:CanvasGraphics, exceptions:Array=null):void
		{
			for each(var bum:BattleUnitManager in _battleReportManager.getBUMS())
			{
				if(exceptions == null ||  exceptions[bum.SID] == null)
				{
					bum.paintPoint = BattleHelper.getPaintPoint(bum.battleUnit.pos);
					graphics.drawBitmap(bum.getWaitBitmap(), bum.paintPoint);
				}
			}
		}
		
		public function MovieFrameRendererBase(brManager:BattleReportManager)
		{
			_battleReportManager = brManager;
		}
		
		public function initialize(frame:int):void
		{
			_initialFrame = frame;
		}
		
		public function enter(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			
		}
		
		public function leave(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			
		}
	}
}