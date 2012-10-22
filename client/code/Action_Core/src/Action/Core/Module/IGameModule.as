package Action.Core.Module
{
	import Action.Core.Net.GameClient;
	
	import flash.events.Event;

	public interface IGameModule
	{
		function get name():String;
		function onLoad():void;
		function onUnload():void;
		function onConnect(client:GameClient, e:Event):void;
		function onClose(client:GameClient, e:Event):void;
	}
}