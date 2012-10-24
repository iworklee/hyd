package Action.Core.Serial
{
	import flash.utils.ByteArray;
	
	public class BoolSerializer implements IGameDataSerializer
	{
		private static var _instance:BoolSerializer = null;
		public static function create():BoolSerializer
		{
			if(_instance == null)
				_instance = new BoolSerializer();
			return _instance;
		}
		
		public function BoolSerializer()
		{
		}
		
		public function deserialize(buffer:ByteArray):Object
		{
			return buffer.readBoolean();
		}
	}
}