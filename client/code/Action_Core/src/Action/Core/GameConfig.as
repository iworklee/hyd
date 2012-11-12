package Action.Core
{
	import flash.external.ExternalInterface;

	public class GameConfig
	{
		public static function getValue(name:String):Object
		{
			return ExternalInterface.call("config." + name);
		}
		
		public function GameConfig()
		{
			throw new Error("Static");
		}
	}
}