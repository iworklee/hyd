package Action.War.Skill
{
	import Action.Core.GamePlugins;
	import Action.Core.Util.NumberWrapper;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Model.BattleAction;
	import Action.Model.BattleEffect;
	import Action.War.BattleDefs;
	import Action.War.BattleHelper;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Report.BattleEffectWrapper;
	import Action.War.Report.BattleUnitManager;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import flashx.textLayout.factory.TruncationOptions;
	import Action.War.Config.BattleSkill;
	
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
			//GamePlugins.console.writeLine(_skill.id + "," + _skill.name);
			
			var action:BattleAction = frameRenderer.action;
			var attacker:BattleUnitManager = frameRenderer.attacker;
			
			var exceptions:Array = new Array();			
			exceptions[attacker.SID] = attacker;
			
			//draw effect
			if(index >= 0)
				drawEffect(BattleDefs.SKILL_PHASE_PREVIOUS, graphics, index, frameRenderer);
			if(index >= 6)
				drawEffect(BattleDefs.SKILL_PHASE_CURRENT, graphics, index-6, frameRenderer);
			if(index >= 9)
				drawEffect(BattleDefs.SKILL_PHASE_POST, graphics, index-9, frameRenderer);
			
			if(_type == 3)
			{		
				if(index >= 8 && index < 11)
				drawEffectBitmap(graphics, attacker.getAttackBitmap(index-7), frameRenderer);
			}
		
			if(index < 6)
			{
				graphics.drawBitmap(attacker.getAttackBitmap(0), attacker.tempPoint, null, -8, -8);
				graphics.drawText(_skill.name, BattleHelper.getSkillNamePoint(), 0xffff00, 64, true, "华文楷体");
				graphics.drawBitmap(attacker.hero.getFaceBitmap(), BattleHelper.getHeadBitmapPoint(attacker.SID),
					graphics.getEffectLayer(), 0, 0, 2);
			}
			else
			{
				index -= 6;
				if(_type % 2 == 1)
					graphics.drawBitmap(attacker.getAttackBitmap(index < 4 ? index : 3), attacker.tempPoint, null, -8, -8);
				else
					graphics.drawBitmap(attacker.getAttackBitmap(0), attacker.tempPoint, null, -8, -8);
				if(index >= 3)
				{
					for each(var effect:BattleEffect in action.effects)
					{
						var bum:BattleUnitManager = frameRenderer.battleReportManager.getBUM(effect.unitSID);
						if(bum != null)
						{
							if(bum.SID != attacker.SID)
							{
								exceptions[bum.SID] = bum;
								if(!bum.isWall)
								{
									if(effect.type < 2)
										graphics.drawBitmap(bum.getDefendBitmap(), bum.tempPoint);
									else
										graphics.drawBitmap(effect.type < 4 ? bum.getHurtBitmap() : bum.getBuffBitmap(), bum.tempPoint);
								}
							}
							var wrapper:BattleEffectWrapper = BattleEffectWrapper.wrap(effect);
							
							//print effect.type
							var lblPnt:Point = new Point(bum.realPoint.x + 10, bum.realPoint.y + 20 - index * wrapper.getTypeUpSpeed());
							graphics.drawText(wrapper.getTypeDesc(), lblPnt, wrapper.getTypeColor(), 15, true);
							
							//print effect.plusHP
							lblPnt = new Point(bum.realPoint.x + 10, bum.realPoint.y + 50 - index * 5);
							graphics.drawText(wrapper.getPlusHpDesc(), lblPnt, 0xffff00, 15, true);
						}
					}
				}
			}
			frameRenderer.drawWaitBitmaps(graphics, exceptions);
		}
		
		public function getFrameLength():int
		{
			return 18;
		}
		
		private function drawEffect(phase:int, graphics:CanvasGraphics, index:int, frameRenderer:BattleBoutSkillRenderer):void
		{			
			/*var effectBmp:BitmapData = _skill.getBitmap(phase, index);
			if(effectBmp != null)
			{
				var offsetPoint:Point = BattleHelper.getBitmapOffset(effectBmp);
				for each(var effect:BattleEffect in frameRenderer.action.effects)
				{
					var bum:BattleUnitManager = frameRenderer.battleReportManager.getBUM(effect.unitSID);
					graphics.drawBitmap2(effectBmp, bum.paintPoint, offsetPoint.x, offsetPoint.y, graphics.getEffectLayer());				
				}
				//GamePlugins.console.writeLine(index);
				GamePlugins.console.drawBitmap(effectBmp);
			}*/
			drawEffectBitmap(graphics, _skill.getBitmap(phase, index), frameRenderer);
		}
		
		private function drawEffectBitmap(graphics:CanvasGraphics, effectBmp:BitmapData, frameRenderer:BattleBoutSkillRenderer):void
		{
			if(effectBmp != null)
			{
				var offsetPoint:Point = BattleHelper.getBitmapOffset(effectBmp);
				for each(var effect:BattleEffect in frameRenderer.action.effects)
				{
					var bum:BattleUnitManager = frameRenderer.battleReportManager.getBUM(effect.unitSID);
					if(bum != null && !bum.isWall)
						graphics.drawBitmap(effectBmp, bum.tempPoint, graphics.getEffectLayer(), offsetPoint.x, offsetPoint.y);				
				}
				//GamePlugins.console.writeLine(index);
				//GamePlugins.console.drawBitmap(effectBmp);
			}
		}
		
		public function create(skill:BattleSkill):ISkillRenderer
		{
			var renderer:SpecialSkillRenderer = new SpecialSkillRenderer(_type);
			renderer._skill = skill;
			return renderer;
		}
		
		public function get description():String
		{
			var desc:String = _type % 2 == 0 ? "施放策略 [" : "发动战法 [";
			desc += _skill.name + "]";
			return desc;
		}
	}
}