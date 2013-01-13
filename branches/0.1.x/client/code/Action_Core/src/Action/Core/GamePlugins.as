package Action.Core
{
	public class GamePlugins
	{		
		public static var console:IConsole;
		public static var modules:Array;
		public static var commands:Array;
		public static var parameters:Object;
		
		public function GamePlugins()
		{
			throw new Error("Static");
		}
	}
}