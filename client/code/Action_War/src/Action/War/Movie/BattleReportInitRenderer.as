package Action.War.Movie
{
	import Action.Core.GamePlugins;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	import flash.geom.Point;
	
	public class BattleReportInitRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{		
		public function BattleReportInitRenderer(reportMgr:BattleReportManager)
		{
			super(reportMgr);
			for each(var unitMgr:BattleUnitManager in _battleReportManager.getBUMS())
			{
				var offset:int = unitMgr.getInitOffset();
				unitMgr.paintPoint =  BattleHelper.getPaintPoint(unitMgr.POS + offset);
				//graphics.draw(unitMgr.getWaitBitmap(i),	unitMgr.paintPoint);
			}
		}
		
		public function get description():String
		{
			return "战斗开始";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			for each(var unitMgr:BattleUnitManager in _battleReportManager.getBUMS())
			{
				var idx:int = player.currentFrame % 2;
				unitMgr.paintPoint.x += unitMgr.speed;
				if(graphics.contains(unitMgr.paintPoint))
					graphics.drawBitmap(unitMgr.getMoveBitmap(idx), unitMgr.paintPoint);
			}
		}
		
		public function getFrameLength():int
		{
			return BattleDefs.INIT_POS_OFFSET * 10 / BattleDefs.MOVE_POS_OFFSET;
		}
	}
}