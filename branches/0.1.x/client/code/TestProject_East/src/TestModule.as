package
{
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	import Action.Core.ReceiveEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	public class TestModule extends EventDispatcher implements IGameModule
	{
		public function TestModule()
		{
		}
		
		public function get name():String
		{
			return "TestModule";
		}
		
		public function onLoad():void
		{
		}
		
		public function onUnload():void
		{
		}
		
		public function onConnect(client:GameClient, e:Event):void
		{
			dispatchEvent(new Event("onConnect"));
		}
		
		public function onClose(client:GameClient, e:Event):void
		{
			dispatchEvent(new Event("onClose"));
		}
		
		public function onReceive(client:GameClient, e:ReceiveEvent):void
		{
			dispatchEvent(e);
		}
		
		public function onIOError(client:GameClient, e:IOErrorEvent):void
		{
			dispatchEvent(new Event("onIOError"));
		}
	}
}