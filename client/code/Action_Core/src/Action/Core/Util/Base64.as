package Action.Core.Util
{
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;

	public class Base64
	{
		public static function encode(bytes:ByteArray):String
		{
			var bs:Base64Encoder = new Base64Encoder();
			bs.encodeBytes(bytes);
			return bs.toString();
		}
		
		public static function decode(text:String):ByteArray
		{
			var bs:Base64Decoder = new Base64Decoder();
			bs.decode(text);
			return bs.toByteArray();
		}
		
		public function Base64()
		{
			throw new Error("Base64 is a static class.");
		}
	}
}