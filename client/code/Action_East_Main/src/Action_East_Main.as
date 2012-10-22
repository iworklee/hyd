package
{
	import Action.Core.GamePlugins;
	import Action.Core.Module.GameModuleFactory;
	import Action.Core.Module.IGameModule;
	import Action.Login.LoginModule;
	
	import flash.display.Sprite;
	
	public class Action_East_Main extends Sprite
	{
		public function Action_East_Main()
		{
			init();
			testConnect();
		}
		
		private function init():void
		{
			GamePlugins.modules = [new LoginModule()];
			GamePlugins.commands = [];
		}
		
		private function testConnect():void
		{			
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onLoad();
		}
	}
}