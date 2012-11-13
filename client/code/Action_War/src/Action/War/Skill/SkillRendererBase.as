package Action.War.Skill
{
	import Action.War.Config.BattleSkill;

	public class SkillRendererBase
	{
		public function SkillRendererBase()
		{
		}
		
		protected var _skill:BattleSkill;
		public function loadSkill(skill:BattleSkill):void
		{
			_skill = skill;
		}
	}
}