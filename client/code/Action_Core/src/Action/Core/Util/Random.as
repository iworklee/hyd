package Action.Core.Util
{
	public class Random
	{
		private var _min:int;
		private var _max:int;
		
		public function Random(min:int, max:int)
		{
			_min = min;
			_max = max;
		}
		
		public function next():int
		{
			return generate(_min, _max);
		}
		
		public static function generate(min:int, max:int):int
		{
			return Math.round(Math.random() * (max - min)) + min;
		}
		
		public static function select(array:Array):Object
		{
			if(array == null || array.length == 0)
				return null;
			return array[generate(0, array.length - 1)];
		}
	}
}