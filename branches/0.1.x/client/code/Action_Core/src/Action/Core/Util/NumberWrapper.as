package Action.Core.Util
{
	public class NumberWrapper
	{		
		private static var _current:NumberWrapper = new NumberWrapper();
		
		public static function wrap(num:Number):NumberWrapper
		{
			_current.wrap(num);
			return _current;
		}
		
		private var _num:Number;
		
		public function NumberWrapper()
		{
			
		}
		
		private function wrap(num:Number):void
		{
			_num = num;
		}
		
		public function toText(len1:int=1, len2:int=0):String
		{
			var text:String = _num.toString();
			var arr:Array = text.split(".");
			var num1:String = arr[0].toString();
			var num2:String = arr.length > 1 ? arr[1].toString() : "";
			
			var i:int;
			var n:int = len1 - num1.length;
			for(i=0; i< n; i++)
				num1 = "0" + num1;
			n = len2 - num2.length;
			for(i=0; i< n; i++)
				num2 += "0";
			
			return num2.length > 0 ? num1 + "." + num2 : num1;
		}
		
		public function toText2():String
		{
			if(_num == 0)
				return "";
			if(_num > 0)
				return "+" + _num.toString();
			return _num.toString();
		}
	}
}