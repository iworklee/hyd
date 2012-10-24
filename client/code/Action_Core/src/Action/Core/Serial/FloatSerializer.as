package Action.Core.Serial
{
	import flash.utils.ByteArray;
	
	public class FloatSerializer implements IGameDataSerializer
	{
		private static var _instance:FloatSerializer = null;
		public static function create():FloatSerializer
		{
			if(_instance == null)
				_instance = new FloatSerializer();
			return _instance;
		}
		
		public function FloatSerializer()
		{
		}
		
		public function deserialize(buffer:ByteArray):Object
		{
			return buffer.readFloat();
		}
	}
}