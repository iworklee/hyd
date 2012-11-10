package Action.War.Skill
{
	import Action.Core.GamePlugins;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Model.BattleAction;
	import Action.Model.BattleEffect;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Report.BattleEffectWrapper;
	import Action.War.Report.BattleUnitManager;
	
	import Util.NumberWrapper;
	
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import flashx.textLayout.factory.TruncationOptions;
	
	public class SpecialSkillRenderer extends SkillRendererBase implements ISkillRenderer
	{
		private var _type:int;
		
		public function SpecialSkillRenderer(tp:int)
		{
			super();
			_type = tp;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function render(graphics:CanvasGraphics, index:int, frameRenderer:BattleBoutSkillRenderer):void
		{
			var action:BattleAction = frameRenderer.action;
			var attacker:BattleUnitManager = frameRenderer.attacker;
			
			var exception:Array = new Array();			
			exception[attacker.SID] = attacker;
			
			//draw effect
			if(index >= 0)
				drawEffect(BattleDefs.SKILL_PHASE_PREVIOUS, graphics, index, frameRenderer);
			if(index >= 6)
				drawEffect(BattleDefs.SKILL_PHASE_CURRENT, graphics, index-6, frameRenderer);
			if(index >= 9)
				drawEffect(BattleDefs.SKILL_PHASE_POST, graphics, index-9, frameRenderer);
			
			if(index < 6)
			{
				graphics.drawBitmap2(attacker.getAttackBitmap(0), attacker.paintPoint);
				graphics.drawText(_skill.name, BattleHelper.getSkillNamePoint(), 0xffff00, 64, true, "华文楷体");
				graphics.drawBitmap(attacker.getHeadBitmap(), BattleHelper.getHeadBitmapPoint(attacker.SID), graphics.getEffectLayer());
			}
			else
			{
				index -= 6;
				if(_type == 1)
					graphics.drawBitmap2(attacker.getAttackBitmap(index < 4 ? index : 3), attacker.paintPoint);
				else
					graphics.drawBitmap2(attacker.getAttackBitmap(0), attacker.paintPoint);
				if(index >= 3)
				{
					for each(var effect:BattleEffect in action.effects)
					{
						var bum:BattleUnitManager = frameRenderer.battleReportManager.getBattleUnitManager(effect.unitSID);
						exception[bum.SID] = bum;
						if(effect.type < 2)
							graphics.drawBitmap(bum.getDefendBitmap(), bum.paintPoint);
						else
							graphics.drawBitmap(bum.getHurtBitmap(effect.type < 4 ? 0 : 1), bum.paintPoint);
						
						var wrapper:BattleEffectWrapper = BattleEffectWrapper.wrap(effect);
						
						//print effect.type
						var lblPnt:Point = new Point(bum.paintPoint.x + 10, bum.paintPoint.y + 20 - index * wrapper.getTypeUpSpeed());
						graphics.drawText(wrapper.getTypeDesc(), lblPnt, wrapper.getTypeColor(), 15, true);
						
						//print effect.plusHP
						lblPnt = new Point(bum.paintPoint.x + 10, bum.paintPoint.y + 50 - index * 5);
						graphics.drawText(wrapper.getPlusHpDesc(), lblPnt, 0xffff00, 15, true);
					}
				}
			}
			frameRenderer.drawWaitBitmaps(graphics, exception);
		}
		
		public function getFrameLength():int
		{
			return 18;
		}
		
		private function drawEffect(phase:int, graphics:CanvasGraphics, index:int, frameRenderer:BattleBoutSkillRenderer):void
		{			
			var effectBmp:BitmapData = _skill.getBitmap(phase, index);
			if(effectBmp != null)
			{
				var offsetPoint:Point = BattleHelper.getBitmapOffset(effectBmp);
				for each(var effect:BattleEffect in frameRenderer.action.effects)
				{
					var bum:BattleUnitManager = frameRenderer.battleReportManager.getBattleUnitManager(effect.unitSID);
					graphics.drawBitmap2(effectBmp, bum.paintPoint, offsetPoint.x, offsetPoint.y, graphics.getEffectLayer());				
				}
				//GamePlugins.console.writeLine(index);
				GamePlugins.console.drawBitmap(effectBmp);
			}
		}
	}
}