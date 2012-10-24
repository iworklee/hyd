package Action.Core.Serial
{
	import flash.utils.ByteArray;
	
	public class StringSerializer implements IGameDataSerializer
	{
		private static var _instance:StringSerializer = null;
		public static function create():StringSerializer
		{
			if(_instance == null)
				_instance = new StringSerializer();
			return _instance;
		}
		
		public function StringSerializer()
		{
		}
		
		public function deserialize(buffer:ByteArray):Object
		{
			var len:int = buffer.readInt();
			return buffer.readUTFBytes(len);
		}
	}
}