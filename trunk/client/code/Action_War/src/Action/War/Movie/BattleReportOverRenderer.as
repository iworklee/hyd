package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.War.BattleDefs;
	import Action.War.Manager.BattleReportManager;
	import Action.War.Manager.BattleUnitManager;
	
	public class BattleReportOverRenderer implements IMovieFrameRenderer
	{
		private var _reportMgr:BattleReportManager;
		
		public function BattleReportOverRenderer(reportMgr:BattleReportManager)
		{
			_reportMgr = reportMgr;
		}
		
		public function renderOnEnter(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			for each(var unitMgr:BattleUnitManager in _reportMgr.getBattleUnitManagers())
			{
				var i:int;
				if(unitMgr.battleUnit.sID < BattleDefs.SPLIT_POS)
				{
					i = 3;
				}
				else
				{
					i = 2;
				}
				unitMgr.paintPoint = graphics.getPaintPoint(unitMgr.battleUnit.pos);
				graphics.draw(unitMgr.getWaitBitmap(i),	unitMgr.paintPoint);
			}
			//graphics.alert("战斗结束");
		}
		
		public function renderOnTick(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			
		}
	}
}