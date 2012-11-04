package Action.War
{
	import Action.Core.Flow.Workflow;
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.ReceiveEvent;
	import Action.Resource.Flow.LoadImageActivity;
	import Action.War.UI.pgBattle;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	public class WarModule implements IGameModule
	{
		public function WarModule()
		{
		}
		
		public static const BgUrl:String = "battle/001.JPG?5";
		
		public function get name():String
		{
			return "WarModule";
		}
		
		public function onLoad():void
		{
		}	
		
		private function onWorkflowFinished(e:Event):void
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
		
		public function onReceive(client:GameClient, e:ReceiveEvent):void
		{
		}
		
		public function onIOError(client:GameClient, e:IOErrorEvent):void
		{
		}
	}
}