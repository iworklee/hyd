package Action.Core.Command
{
	import Action.Core.Net.GameClient;
	
	import com.netease.protobuf.Message;

	public interface IGameCommand
	{
		function get id():int;
		function createMessage():Message;
		function execute(client:GameClient, data:Message):void;
	}
}