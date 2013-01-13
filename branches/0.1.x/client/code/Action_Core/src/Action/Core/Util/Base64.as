package Action.Core.Util
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
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
			return myDecode(text);
			var bs:Base64Decoder = new Base64Decoder();
			bs.decode(text);
			return bs.toByteArray();
		}
		
		private static function myDecode(binStr:String):ByteArray
		{
			var key:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
			var index:int = 0;
			var byteArr1:ByteArray = new ByteArray();
			byteArr1.endian = Endian.BIG_ENDIAN;
			for (var i:int = 0; i < binStr.length; i = i + 4)
			{
				var tempByte:uint = (key.indexOf(binStr.charAt(i)) & 255) << 18 | (key.indexOf(binStr.charAt(i + 1)) & 255) << 12 | (key.indexOf(binStr.charAt(i + 2)) & 255) << 6 | key.indexOf(binStr.charAt(i + 3)) & 255;
				byteArr1[index++] = (tempByte & 16711680) >> 16;
				byteArr1[index++] = (tempByte & 65280) >> 8;
				byteArr1[index++] = tempByte & 255;
			}
			var byteArr2:ByteArray = new ByteArray(); // end of for
			byteArr2.endian = Endian.BIG_ENDIAN;
			if (binStr.charCodeAt( -1) == 61)
				byteArr1.readBytes(byteArr2, 0, byteArr1.length - 1);
			else
				byteArr1.readBytes(byteArr2, 0, byteArr1.length - 2);
			return byteArr2;
		}
		
		public function Base64()
		{
			throw new Error("Base64 is a static class.");
		}
	}
}