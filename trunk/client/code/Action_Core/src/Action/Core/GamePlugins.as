package Action.Core
{
	public class GamePlugins
	{		
		public static var console:IConsole;
		public static var modules:Array;
		public static var commands:Array;		
		
		public function GamePlugins()
		{
			throw new Error("Static");
		}
	}
}