package Action.Core.Net
{	
	import com.netease.protobuf.Message;
	
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;

	public class GameDataManager
	{
		public function GameDataManager()
		{
			
		}
		
		public function toByteArray(msg:Message):ByteArray
		{
			var buffer:ByteArray = new ByteArray();
			msg.writeTo(buffer);
			return buffer;
		}
		
		public function fromSocket(socket:Socket):GameReceiveData
		{
			var args:GameReceiveData = new GameReceiveData();
			args.key = socket.readInt();
			args.buffer = new ByteArray();
			
			var len:int = socket.readInt();
			if(len > 0)
				socket.readBytes(args.buffer, 0, len);
			
			return args;
		}
	}
}