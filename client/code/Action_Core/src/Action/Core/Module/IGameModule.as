package Action.Core.Module
{
	import Action.Core.Net.GameClient;
	import Action.Core.ReceiveEvent;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	public interface IGameModule
	{
		function get name():String;
		function onLoad():void;
		function onUnload():void;
		function onConnect(client:GameClient, e:Event):void;
		function onClose(client:GameClient, e:Event):void;
		function onReceive(client:GameClient, e:ReceiveEvent):void;
		function onIOError(client:GameClient, e:IOErrorEvent):void;
	}
}