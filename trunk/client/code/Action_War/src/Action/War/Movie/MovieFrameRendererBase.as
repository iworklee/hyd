package Action.War.Movie
{
	import Action.Core.GamePlugins;
	import Action.Display.Drawing.BitmapHelper;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleHelper;
	import Action.War.Config.BattleHero;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	import flash.display.BitmapData;
	
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
				{
					var hpPct:Number = bum.HP / bum.maxHP;
					var bitmap:BitmapData = null;
					if(hpPct == 0)
						bitmap = bum.getOtherBitmap(2);
					else if(hpPct < 0.5)
						bitmap = bum.getOtherBitmap(1);
					else if(hpPct < 1)
						bitmap = bum.getOtherBitmap(0);
					if(bitmap != null)
					{
						graphics.drawBitmap(bitmap, bum.realPoint, null, BattleHelper.getWallOffsetX(bum.SID));
						//GamePlugins.console.drawBitmap(bitmap);
					}
				}
				else if(exceptions == null ||  exceptions[bum.SID] == null)
				{
					bum.tempPoint = bum.realPoint;
					graphics.drawBitmap(bum.getWaitBitmap(), bum.tempPoint);
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
			return "[" + bum.hero.name + "(" + bum.SID + ")] ";
		}
	}
}