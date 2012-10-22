package Action.Core.Command
{
	import Action.Core.GamePlugins;
	
	import flash.utils.getDefinitionByName;

	public class GameCommandFactory
	{
		private static var _current:GameCommandFactory = null;
		public static function get current():GameCommandFactory
		{
			return _current;
		}
		
		private var _commands:Array = new Array();
		
		public function GameCommandFactory()
		{
			for each(var name:String in GamePlugins.commands)
			{
				var command:IGameCommand = getDefinitionByName(name) as IGameCommand;
				if(command != null)
					_commands[command.id] = command;
			}
		}
		
		public function getCommands():Array
		{
			return _commands
		}
		
		public function getCommand(id:int):IGameCommand
		{
			return _commands[id];
		}
	}
}