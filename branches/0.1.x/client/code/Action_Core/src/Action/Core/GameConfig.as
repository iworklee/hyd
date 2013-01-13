package Action.Core
{
	import flash.external.ExternalInterface;

	public class GameConfig
	{
		public static function getValue(name:String):Object
		{
			return ExternalInterface.call("config.getValue", name);
		}
		
		public static function getString(name:String):String
		{
			var obj:Object = getValue(name);
			return obj != null ? obj.toString() : null;
		}
		
		public function GameConfig()
		{
			throw new Error("Static");
		}
	}
}