package com.svg.parser 
{
	import flash.display.DisplayObject;
	import com.svg.parser.IParser;
	import com.svg.parser.model.Data;
	import com.svg.parser.style.Style;
	import flash.display.Sprite;
	
	public class Symbol implements IParser
	{
		public static var LOCALNAME:String = "symbol";
		
		public function Symbol() { }
		public function parse( data:Data ):void {}
	}
}