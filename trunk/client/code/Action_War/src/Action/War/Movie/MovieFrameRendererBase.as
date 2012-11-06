package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.War.BattleHelper;
	import Action.War.Manager.BattleReportManager;
	import Action.War.Manager.BattleUnitManager;

	public class MovieFrameRendererBase
	{
		protected var _battleReportManager:BattleReportManager;
		protected var _initialFrame:int;
		
		protected function drawWaitBitmaps(graphics:CanvasGraphics, exceptions:Array=null):void
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