package Action.Core.Module
{
	import Action.Core.GamePlugins;
	
	import flash.utils.getDefinitionByName;

	public class GameModuleFactory
	{
		private static var _current:GameModuleFactory = null;
		public static function get current():GameModuleFactory
		{
			if(_current == null)
				_current = new GameModuleFactory();
			return _current;
		}
		
		private var _modules:Array = new Array();
		
		public function GameModuleFactory()
		{
			for each(var module:IGameModule in GamePlugins.modules)			
				_modules[module.name] = module;			
		}
		
		public function getAllModules():Array
		{
			return _modules;
		}
		
		public function getModule(name:String):IGameModule
		{
			return _modules[name];
		}
	}
}