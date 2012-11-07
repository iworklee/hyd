package Action.War.Skill
{
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