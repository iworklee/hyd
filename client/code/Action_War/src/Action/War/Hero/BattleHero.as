package Action.War.Hero
{
	import Action.War.WarPlugins;

	public class BattleHero
	{
		public static function getInstance(id:int):BattleHero
		{
			return WarPlugins.heros[id] as BattleHero;
		}
		
		public var id:int;
		public var name:String;
		public var face:int;
		public var skill:int;
		
		public function BattleHero()
		{
		}
		
		public function from(obj:Object):void
		{
			for(var name:String in obj)
				this[name] = obj[name];
		}
	}
}