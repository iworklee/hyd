package com.svg.parser 
{
	import flash.display.DisplayObject;
	import com.svg.parser.IParser;
	import com.svg.parser.model.Data;
	import com.svg.parser.style.Style;
	import flash.display.Sprite;

	public class Defs implements IParser
	{
		public static var LOCALNAME:String = "defs";
		
		public function Defs() { }
		
		public function parse( data:Data ):void {
			var style:Style = new Style( data.currentXml );
			var group:Sprite = new Sprite();
			group.name = style.id;
			style.applyStyle( group );
			var groupXML:XML = data.currentXml.copy();
			groupXML.setLocalName(  "_defs" );	
			SvgFactory.parseData( data.copy( groupXML, group ) );
			group = null;
		}
	}

}