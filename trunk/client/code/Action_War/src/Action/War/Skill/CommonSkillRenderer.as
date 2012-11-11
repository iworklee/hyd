package Action.War.Skill
{
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Model.BattleAction;
	import Action.Model.BattleEffect;
	import Action.War.BattleDefs;
	import Action.War.Movie.BattleBoutSkillRenderer;
	import Action.War.Report.BattleEffectWrapper;
	import Action.War.Report.BattleUnitManager;
	
	import Action.Core.Util.NumberWrapper;
	
	import flash.display.Graphics;
	import flash.geom.Point;
	
	import flashx.textLayout.factory.TruncationOptions;
	
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
			
			var exceptions:Array = new Array();			
			exceptions[attacker.SID] = attacker;
			graphics.drawBitmap2(attacker.getAttackBitmap(index < 4 ? index : 3), attacker.paintPoint);
			if(index >= 3)
			{
				for each(var effect:BattleEffect in action.effects)
				{
					var bum:BattleUnitManager = frameRenderer.battleReportManager.getBUM(effect.unitSID);
					if(bum != null)
					{
						exceptions[bum.SID] = bum;
						if(effect.type < 2)
							graphics.drawBitmap(bum.getDefendBitmap(), bum.paintPoint);
						else
							graphics.drawBitmap(bum.getHurtBitmap(), bum.paintPoint);
						
						var wrapper:BattleEffectWrapper = BattleEffectWrapper.wrap(effect);
						
						//print effect.type
						var lblPnt:Point = new Point(bum.paintPoint.x + 10, bum.paintPoint.y + 20 - index * wrapper.getTypeUpSpeed());
						graphics.drawText(wrapper.getTypeDesc(), lblPnt, wrapper.getTypeColor(), 15, true);
						
						//print effect.plusHP
						lblPnt = new Point(bum.paintPoint.x + 10, bum.paintPoint.y + 50 - index * 10);
						graphics.drawText(wrapper.getPlusHpDesc(), lblPnt, 0xffff00, 15, true);
					}
				}
			}
			frameRenderer.drawWaitBitmaps(graphics, exceptions);
		}
		
		public function getFrameLength():int
		{
			return 8;
		}
		
		public function create(skill:BattleSkill):ISkillRenderer
		{
			var renderer:CommonSkillRenderer = new CommonSkillRenderer();
			renderer._skill = skill;
			return renderer;
		}
		
		public function get description():String
		{
			return "开始攻击";
		}
	}
}