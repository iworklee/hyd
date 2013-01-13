package Action.War.Config
{	
	import flash.external.ExternalInterface;

	public class BattleConfigFactory
	{
		private static var _heros:Array;
		private static var _skills:Array;
		
		public static function getHero(id:int):BattleHero
		{
			return _heros[id] as BattleHero;
		}
		
		public static function findHero(name:String):BattleHero
		{
			for each(var hero:BattleHero in _heros)
			{
				if(hero.name == name)
					return hero;
			}
			return null;
		}
		
		public static function getSkill(id:int):BattleSkill
		{
			return _skills[id] as BattleSkill;
		}
		
		public static function loadConfig():void
		{
			//init heros
			_heros = new Array();
			var objHeros:Object = ExternalInterface.call("heroFactory.getHeros");
			for each(var objHero:Object in objHeros)
			{
				var hero:BattleHero = new BattleHero();
				hero.fromObject(objHero);
				_heros[hero.id] = hero;
			}
			
			//init skills
			_skills = new Array();
			var objSkills:Object = ExternalInterface.call("skillFactory.getSkills");
			for each(var objSkill:Object in objSkills)
			{
				var skill:BattleSkill = new BattleSkill();
				skill.fromObject(objSkill);
				_skills[skill.id] = skill;
			}
		}
		loadConfig();
		
		public function BattleConfigFactory()
		{
			throw new Error("Static");
		}
	}
}