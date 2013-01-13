package Action.Core.Command
{
	import Action.Core.Net.GameClient;
	import Action.Core.Serial.IGameDataSerializer;

	public interface IGameCommand
	{
		function get id():int;
		function get serializer():IGameDataSerializer;
		function execute(client:GameClient, data:Object):void;
	}
}