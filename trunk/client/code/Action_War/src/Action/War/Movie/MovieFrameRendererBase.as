package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
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
			for each(var unitMgr:BattleUnitManager in _battleReportManager.getBattleUnitManagers())
			{
				if(exceptions == null ||  exceptions[unitMgr.battleUnit.sID] == null)
				{
					unitMgr.paintPoint = BattleHelper.getPaintPoint(unitMgr.battleUnit.pos);
					graphics.drawBitmap(unitMgr.getWaitBitmap(),	unitMgr.paintPoint);
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
	}
}