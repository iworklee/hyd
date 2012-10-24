package Action.Core.Net
{	
	import com.netease.protobuf.Message;
	
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.getDefinitionByName;

	public class GameDataManager
	{
		private var _key:int = -1;
		private var _len:int = -1;
		
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
			if(socket.bytesAvailable < 8)
				return null;			
			if(_key == -1)
			{
				_key = socket.readInt();
				_len = socket.readInt();
			}
			if(socket.bytesAvailable < _len)
				return null;
			
			var args:GameReceiveData = new GameReceiveData();
			args.key = _key;
			args.buffer = new ByteArray();
			args.buffer.endian = Endian.LITTLE_ENDIAN;			
			if(_len > 0)
				socket.readBytes(args.buffer, 0, _len);
			
			_key = _len = -1;			
			return args;
		}
	}
}