package
{
	import Action.Core.GamePlugins;
	import Action.Core.Module.GameModuleFactory;
	import Action.Core.Module.IGameModule;
	import Action.Login.LoginModule;
	
	import flash.display.Sprite;
	import flash.text.engine.TextElement;
	
	public class Action_East_Main extends Sprite
	{
		public function Action_East_Main()
		{
			loadPlugins();
			loadUI();
			connectServer();
		}
		
		private function loadPlugins():void
		{
			GamePlugins.modules = [new LoginModule()];
			GamePlugins.commands = [];
		}
		
		
		private function loadUI():void
		{
			var lbl:TextElement = new TextElement();
			lbl.text = "Command测试";
		}
		
		private function connectServer():void
		{			
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onLoad();
		}
	}
}