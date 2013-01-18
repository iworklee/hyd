package com.svg.parser 
{
	import flash.display.Sprite;
	import com.svg.parser.IParser;
	import com.svg.parser.model.Data;
	import com.svg.parser.style.Style;
	
	public class Group implements IParser
	{
		
		public static var LOCALNAME:String = "g";
		
		public function Group() {}

		public function parse( data:Data ):void {
			var style:Style = new Style( data.currentXml );
			if ( !style.display ) return;
			var group:Sprite = new Sprite();
			group.name = style.id;
			style.applyStyle( group );
			data.currentCanvas.addChild( group );
			var groupXML:XML = data.currentXml.copy();
			groupXML.setLocalName(  "_g" );	
			SvgFactory.parseData( data.copy( groupXML, group ) );
		}
	}

}