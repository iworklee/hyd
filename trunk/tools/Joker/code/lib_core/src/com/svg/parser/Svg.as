package com.svg.parser 
{
	import flash.display.Sprite;
	import com.svg.parser.IParser;
	import com.svg.parser.style.Style;
	
	public class Svg extends Group implements IParser
	{
		
		public static var LOCALNAME:String = "svg";
		
		public function Svg() {}
		
	}

}