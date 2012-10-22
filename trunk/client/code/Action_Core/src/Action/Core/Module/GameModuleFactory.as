package Action.Core.Module
{
	import Action.Core.GamePlugins;
	
	import flash.utils.getDefinitionByName;

	public class GameModuleFactory
	{
		private static var _current:GameModuleFactory = null;
		public static function get current():GameModuleFactory
		{
			return _current;
		}
		
		private var _modules:Array = new Array();
		
		public function GameModuleFactory()
		{
			for each(var name:String in GamePlugins.modules)
			{
				var module:IGameModule = getDefinitionByName(name) as IGameModule;
				if(module != null)
					_modules[module.name] = module;
			}
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