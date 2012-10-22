package Action.Login
{
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
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
			trace("LoginModule.onLoad");
			var host:String = "127.0.0.1";
			var port:int = 1808;
			GameClient.create().connect(host, port);
		}
		
		public function onUnload():void
		{
			
		}
		
		public function onConnect(client:GameClient, e:Event):void
		{
			trace("LoginModule.onConnect");
		}
		
		public function onClose(client:GameClient, e:Event):void
		{
			trace("LoginModule.onClose");
		}
		
		public function onIOError(client:GameClient, e:IOErrorEvent):void
		{
			trace("LoginModule.onIOError");
		}
	}
}