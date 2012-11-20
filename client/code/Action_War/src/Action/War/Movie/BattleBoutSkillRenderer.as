package Action.War.Movie
{
	import Action.Core.GamePlugins;
	import Action.Core.Util.NumberWrapper;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Display.Drawing.IMovieFrameRenderer;
	import Action.Display.Drawing.MoviePlayer;
	import Action.Model.BattleAction;
	import Action.Model.BattleEffect;
	import Action.Model.BattleEffectType;
	import Action.War.BattleDefs;
	import Action.War.Config.BattleConfigFactory;
	import Action.War.Config.BattleSkill;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	import Action.War.Skill.ISkillRenderer;
	import Action.War.WarPlugins;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class BattleBoutSkillRenderer extends MovieFrameRendererBase implements IMovieFrameRenderer
	{
		private var _action:BattleAction;
		public function get action():BattleAction
		{
			return _action;
		}
		
		private var _attacker:BattleUnitManager;
		public function get attacker():BattleUnitManager
		{
			return _attacker;
		}
		
		private var _skillRenderer:ISkillRenderer;
		
		public function BattleBoutSkillRenderer(reportMgr:BattleReportManager, action:BattleAction)
		{
			super(reportMgr);
			_action = action;
			_attacker = _battleReportManager.getBUM(_action.unitSID);
			_skillRenderer = BattleConfigFactory.getSkill(_action.param).createRenderer();
		}
		
		public function get description():String
		{
			return descBUM(_attacker) + _skillRenderer.description;
		}
		
		public override function enter(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			var attackerTurned:Boolean = false;
			for each(var effect:BattleEffect in _action.effects)
			{
				if(effect.type > BattleEffectType.None && effect.type < BattleEffectType.Cure)
				{
					if(effect.unitSID != _action.unitSID)
					{
						if(!attackerTurned)
						{
							var bum:BattleUnitManager = _battleReportManager.getBUM(effect.unitSID);
							if(bum != null)
								_attacker.turnTo(bum.POS);
							attackerTurned = true;
						}
						bum = _battleReportManager.getBUM(effect.unitSID);
						if(bum != null && !bum.isWall)
							bum.turnTo(_attacker.POS);
					}					
				}
			}
		}
		
		public function render(graphics:CanvasGraphics, player:MoviePlayer):void
		{			
			var index:int = player.currentFrame - _initialFrame;
			_skillRenderer.render(graphics, index, this);		
		}
		
		public override function leave(graphics:CanvasGraphics, player:MoviePlayer):void
		{
			//GamePlugins.console.writeLine("BoutSkill.OnLeave");
			for each(var effect:BattleEffect in _action.effects)
			{
				var bum:BattleUnitManager = _battleReportManager.getBUM(effect.unitSID);
				if(bum != null)
				{
					bum.HP = Math.min(bum.maxHP, Math.max(0, bum.HP + effect.plusHP));
					bum.MP = Math.max(0, bum.MP + effect.plusMP);
				}
			}
		}
		
		public function getFrameLength():int
		{
			return _skillRenderer.getFrameLength();
		}
	}
}