package Action.War.Skill
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Model.BattleAction;
	import Action.Model.BattleEffect;
	import Action.War.BattleDefs;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Report.BattleUnitManager;
	
	import Util.NumberWrapper;
	
	import flash.display.Graphics;
	import flash.geom.Point;
	
	public class CommonSkillRenderer extends SkillRendererBase implements ISkillRenderer
	{
		public function CommonSkillRenderer()
		{
			super();
		}
		
		public function get type():int
		{
			return 0;
		}
		
		public function render(graphics:CanvasGraphics, index:int, frameRenderer:BattleBoutSkillRenderer):void
		{
			var action:BattleAction = frameRenderer.action;
			var attacker:BattleUnitManager = frameRenderer.attacker;
			
			var exception:Array = new Array();			
			exception[attacker.SID] = attacker;
			graphics.drawBitmap2(attacker.getAttackBitmap(index < 4 ? index : 3), attacker.paintPoint);
			if(index >= 3)
			{
				for each(var effect:BattleEffect in action.effects)
				{
					var bum:BattleUnitManager = frameRenderer.battleReportManager.getBattleUnitManager(effect.unitSID);
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
			frameRenderer.drawWaitBitmaps(graphics, exception);
		}
		
		public function getFrameLength():int
		{
			return 8;
		}
	}
}