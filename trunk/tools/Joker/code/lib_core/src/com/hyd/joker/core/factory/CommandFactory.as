package com.hyd.joker.core.factory
{
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.ICommand;

	public class CommandFactory
	{
		public function CommandFactory()
		{
			throw new Error("Static");
		}
		
		private static var _commands:Array = new Array();
		
		private static function initialize():void
		{
			for each(var cmd:ICommand in Joker.commands)
				_commands[cmd.name] = cmd;
		}
		initialize();
		
		public static function getCommands():Array
		{
			return _commands;
		}
		
		public static function getCommand(name:String):ICommand
		{
			return _commands[name] as ICommand;
		}
	}
}