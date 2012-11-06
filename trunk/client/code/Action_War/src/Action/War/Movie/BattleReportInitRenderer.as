package Action.War.Movie
{
	import Action.Core.GamePlugins;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleDefs;
	import Action.War.Manager.BattleReportManager;
	import Action.War.Manager.BattleUnitManager;
	
	import flash.geom.Point;
	
	public class BattleReportInitRenderer implements IMovieFrameRenderer
	{
		private var _reportMgr:BattleReportManager;
		
		public function BattleReportInitRenderer(reportMgr:BattleReportManager)
		{
			_reportMgr = reportMgr;
		}
		
		public function renderOnEnter(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			for each(var unitMgr:BattleUnitManager in _reportMgr.getBattleUnitManagers())
			{
				var i:int;
				var j:int;
				if(unitMgr.battleUnit.sID < BattleDefs.SPLIT_POS)
				{
					i = 3;
					j = -BattleDefs.INIT_POS_OFFSET
				}
				else
				{
					i = 2;
					j = BattleDefs.INIT_POS_OFFSET;
				}
				unitMgr.paintPoint =  graphics.getPaintPoint(unitMgr.battleUnit.pos + j);
				//graphics.draw(unitMgr.getWaitBitmap(i),	unitMgr.paintPoint);
			}
		}
		
		public function renderOnTick(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			for each(var unitMgr:BattleUnitManager in _reportMgr.getBattleUnitManagers())
			{
				var i:int;
				var j:int;
				if(unitMgr.battleUnit.sID < BattleDefs.SPLIT_POS)
				{
					i = 6 + player.currentFrame % 2;
					j = BattleDefs.MOVE_POS_OFFSET;
				}
				else
				{
					i = 4 + player.currentFrame % 2;
					j = -BattleDefs.MOVE_POS_OFFSET;
				}
				unitMgr.paintPoint = new Point(unitMgr.paintPoint.x + j, unitMgr.paintPoint.y);
				if(graphics.contains(unitMgr.paintPoint))
					graphics.draw(unitMgr.getMoveBitmap(i), unitMgr.paintPoint);
			}
		}
	}
}