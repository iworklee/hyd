package Action.War.Skill
{
	import Action.Core.GamePlugins;
	import Action.War.WarPlugins;

	public class SkillRendererFactory
	{		
		private static var _current:SkillRendererFactory = null;
		public static function get current():SkillRendererFactory
		{
			if(_current == null)
				_current = new SkillRendererFactory();
			return _current;
		}
		
		private var _skillRenderers:Array = new Array();
		
		public function SkillRendererFactory()
		{
			for each(var renderer:ISkillRenderer in WarPlugins.skillRenderers)
				_skillRenderers[renderer.type] = renderer;
		}
		
		public function getSkillRenderer(type:int):ISkillRenderer
		{
			return _skillRenderers[type] as ISkillRenderer;
		}
	}
}