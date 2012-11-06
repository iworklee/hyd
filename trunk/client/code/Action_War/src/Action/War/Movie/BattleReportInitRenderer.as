package Action.War.Movie
{
	import Action.Core.GamePlugins;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.Manager.BattleReportManager;
	import Action.War.Manager.BattleUnitManager;
	
	import flash.geom.Point;
	
	public class BattleReportInitRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{		
		public function BattleReportInitRenderer(reportMgr:BattleReportManager)
		{
			super(reportMgr);
			for each(var unitMgr:BattleUnitManager in _battleReportManager.getBattleUnitManagers())
			{
				var offset:int = unitMgr.getInitOffset();
				unitMgr.paintPoint =  BattleHelper.getPaintPoint(unitMgr.battleUnit.pos + offset);
				//graphics.draw(unitMgr.getWaitBitmap(i),	unitMgr.paintPoint);
			}
		}
		
		public function get name():String
		{
			return "ReportInit";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			for each(var unitMgr:BattleUnitManager in _battleReportManager.getBattleUnitManagers())
			{
				var idx:int = player.currentFrame % 2;
				unitMgr.paintPoint = new Point(unitMgr.paintPoint.x + unitMgr.speed, unitMgr.paintPoint.y);
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