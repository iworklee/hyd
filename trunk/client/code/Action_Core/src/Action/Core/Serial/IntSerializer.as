package Action.Core.Serial
{
	import flash.utils.ByteArray;
	
	public class IntSerializer implements IGameDataSerializer
	{
		private static var _instance:IntSerializer = null;
		public static function create():IntSerializer
		{
			if(_instance == null)
				_instance = new IntSerializer();
			return _instance;
		}
		
		public function IntSerializer()
		{
		}
		
		public function deserialize(buffer:ByteArray):Object
		{
			return buffer.readInt();
		}
	}
}