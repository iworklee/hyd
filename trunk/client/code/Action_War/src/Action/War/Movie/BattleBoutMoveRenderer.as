package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleAction;
	import Action.Resource.HeroFaceResource;
	import Action.War.BattleDefs;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	
	import flash.geom.Point;
	
	public class BattleBoutMoveRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{
		private var _action:BattleAction;
		private var _moveBUM:BattleUnitManager;
		
		public function BattleBoutMoveRenderer(reportMgr:BattleReportManager, action:BattleAction)
		{
			super(reportMgr);
			_action = action;
			_moveBUM = _battleReportManager.getBUM(_action.unitSID);
		}
		
		public function get description():String
		{
			return descBUM(_moveBUM) + "开始移动";
		}
		
		public override function enter(graphics:CanvasGraphics, player:MoviePlayer):void
		{			
			_moveBUM.resetDir();
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			var exceptions:Array = new Array();
			exceptions[_moveBUM.SID] = _moveBUM;
			_moveBUM.tempPoint.x += _moveBUM.speed;
			graphics.drawBitmap(_moveBUM.getMoveBitmap(player.currentFrame % 2), _moveBUM.tempPoint);
			super.drawWaitBitmaps(graphics, exceptions);
		}
		
		public override function leave(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			_moveBUM.POS = _action.param;
		}
		
		public function getFrameLength():int
		{
			return 50 / BattleDefs.MOVE_POS_OFFSET;
		}
	}
}