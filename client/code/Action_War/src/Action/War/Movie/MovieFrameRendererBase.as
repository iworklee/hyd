package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleHelper;
	import Action.War.Hero.BattleHero;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	import mx.utils.Base64Decoder;

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
				if(bum.isWall)
					continue;
				if(exceptions == null ||  exceptions[bum.SID] == null)
				{
					bum.paintPoint = bum.realPoint;
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
		
		protected function descBUM(bum:BattleUnitManager):String
		{
			return "[" + BattleHero.getInstance(bum.heroId).name + "(" + bum.SID + ")] ";
		}
	}
}