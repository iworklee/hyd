package Action.Login.Commands
{
	import Action.Core.Command.IGameCommand;
	import Action.Core.GamePlugins;
	import Action.Core.Net.GameClient;
	import Action.Core.Serial.IGameDataSerializer;
	import Action.Core.Serial.IntSerializer;
	
	import com.netease.protobuf.Message;
	
	public class BackdoorLoginCommand implements IGameCommand
	{
		public function BackdoorLoginCommand()
		{
		}
		
		public function get id():int
		{
			return 1000;
		}
		
		public function get serializer():IGameDataSerializer
		{
			return IntSerializer.create();
		}
		
		public function execute(client:GameClient, data:Object):void
		{
			GamePlugins.console.writeLine("data=" + int(data));
		}
	}
}