﻿package com.svg.parser 
{
	import flash.display.*;
	import flash.geom.Point;
	import com.svg.parser.model.Data;

	public class ComplexTree implements IParser
	{
	
		public function ComplexTree() {}
		
		public function parse( data:Data ):void 
		{
			var xmllist:XMLList = data.currentXml.children();
			if ( xmllist.length() <= 0 ) return;
			for each ( var xmlItem:XML in xmllist ) {
				data.currentXml = xmlItem;
				SvgFactory.parseData( data );
			}
		}
	}
	
}