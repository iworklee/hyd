package Action.Core.Command
{
	import Action.Core.GamePlugins;
	
	import flash.utils.getDefinitionByName;

	public class GameCommandFactory
	{
		private static var _current:GameCommandFactory = null;
		public static function get current():GameCommandFactory
		{
			if(_current == null)
				_current = new GameCommandFactory();
			return _current;
		}
		
		private var _commands:Array = new Array();
		
		public function GameCommandFactory()
		{
			for each(var command:IGameCommand in GamePlugins.commands)
				_commands[command.id] = command;
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