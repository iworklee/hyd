package com.svg.parser 
{
	
	import com.svg.parser.IParser;
	import com.svg.parser.model.Data;
		
	public class FlowRoot implements IParser
	{
		public static var LOCALNAME:String = "flowRoot";
		
		public function FlowRoot() {}
		
		public function parse( data:Data ):void {}
	}

}