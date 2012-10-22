package Action.Login
{
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	
	import flash.events.Event;
	
	public class LoginModule implements IGameModule
	{
		public function LoginModule()
		{
		}
		
		public function get name():String
		{
			return null;
		}
		
		public function onLoad():void
		{
		
		}
		
		public function onUnload():void
		{
			
		}
		
		public function onConnect(client:GameClient, e:Event):void
		{
		}
		
		public function onClose(client:GameClient, e:Event):void
		{
		}
	}
}