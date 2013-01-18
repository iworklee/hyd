package com.hyd.joker.core.util
{
	public class MathEx
	{
		public function MathEx()
		{
			throw new Error("Static");
		}
		
		public static function distance(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return Math.sqrt(Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2));
		}
	}
}