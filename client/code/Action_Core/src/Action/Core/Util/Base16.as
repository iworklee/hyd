package Action.Core.Util
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	public class Base16
	{
		private static var _endian:String = Endian.LITTLE_ENDIAN;
		private static var _codes:String = "0123456789abcdef";
		
		public static function encode(bytes:ByteArray):String
		{
			var text:String = "";
			bytes.endian = _endian;
			bytes.position = 0;
			while(bytes.bytesAvailable != 0)
			{
				var b:int = bytes.readUnsignedByte();
				var m:int = b / 16;
				var n:int = b % 16;
				text += _codes.charAt(m) + _codes.charAt(n);
			}
			return text;
		}
		
		public static function decode(text:String):ByteArray
		{
			text = text.toLowerCase();
			var bytes:ByteArray = new ByteArray();
			bytes.endian = _endian;
			for(var i:int=0; i<text.length; i+=2)
			{
				var m:int = _codes.indexOf(text.charAt(i));
				var n:int = _codes.indexOf(text.charAt(i+1));
				var b:int = m * 16 + n;
				bytes.writeByte(b);
			}
			bytes.position = 0;
			return bytes;
		}
		
		public function Base16()
		{
			throw new Error("Base16 is a static class.");
		}
	}
}