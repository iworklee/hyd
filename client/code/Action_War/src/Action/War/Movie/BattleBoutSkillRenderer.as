package Action.War.Movie
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleAction;
	import Action.Model.BattleEffect;
	import Action.Model.BattleEffectType;
	import Action.War.BattleDefs;
	import Action.War.Manager.BattleReportManager;
	import Action.War.Manager.BattleUnitManager;
	
	import Util.NumberWrapper;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class BattleBoutSkillRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{
		private var _action:BattleAction;
		private var _attacker:BattleUnitManager;
		
		public function BattleBoutSkillRenderer(reportMgr:BattleReportManager, action:BattleAction)
		{
			super(reportMgr);
			_action = action;
			_attacker = _battleReportManager.getBattleUnitManager(_action.unitSID);
		}
		
		public function get name():String
		{
			return "BoutSkill";
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{			
			var index:int = player.currentFrame - _initialFrame;
			var exception:Array = new Array();			
			exception[_attacker.SID] = _attacker;
			graphics.drawBitmap2(_attacker.getAttackBitmap(index < 4 ? index : 3), _attacker.paintPoint);
			if(index >= 3)
			{
				for each(var effect:BattleEffect in _action.effects)
				{
					var bum:BattleUnitManager = _battleReportManager.getBattleUnitManager(effect.unitSID);
					exception[bum.SID] = bum;
					if(effect.type < 2)
						graphics.drawBitmap(bum.getDefendBitmap(), bum.paintPoint);
					else
						graphics.drawBitmap(bum.getHurtBitmap(0), bum.paintPoint);
					
					var lblPnt:Point = new Point(bum.paintPoint.x + 10, bum.paintPoint.y + 50 - index * 10);						
					var text:String = BattleDefs.getBattleEffectTypeDesc(effect.type)
						+ NumberWrapper.wrap(effect.plusHP).toText2();
					graphics.drawText(text, lblPnt, 0x00ff00);
				}
			}
			super.drawWaitBitmaps(graphics, exception);
		}
		
		public function getFrameLength():int
		{
			return 8;
		}
	}
}