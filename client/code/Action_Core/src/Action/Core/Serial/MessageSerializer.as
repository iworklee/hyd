package Action.Core.Serial
{
	import com.netease.protobuf.Message;
	
	import flash.utils.ByteArray;
	
	public class MessageSerializer implements IGameDataSerializer
	{
		private static var _instance:MessageSerializer = null;
		public static function create(msg:Message):MessageSerializer
		{
			if(_instance == null)
				_instance = new MessageSerializer();
			_instance._message = msg;
			return _instance;
		}
		
		private var _message:Message;
		
		public function MessageSerializer()
		{
		}
		
		public function deserialize(buffer:ByteArray):Object
		{
			_message.mergeFrom(buffer);
			return _message;
		}
	}
}