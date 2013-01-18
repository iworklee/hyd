package com.svg.parser 
{
	import flash.display.*;
	import com.svg.parser.abstract.AbstractPaint;
	import com.svg.parser.model.Data;
	import com.svg.parser.style.Style;
	import com.svg.parser.utils.StyleUtil;
	
	public class Rect extends AbstractPaint implements IParser
	{
		public static var LOCALNAME:String = "rect";
		
		public function Rect() { }
		
		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;
		
		public function parse( data:Data ):void 
		{
			var target:Shape = new Shape();
			var xml:XML = data.currentXml;
			var style:Style = new Style( xml );
			
			_x = StyleUtil.toNumber( xml.@x );
			_y = StyleUtil.toNumber( xml.@y );
			_width = StyleUtil.toNumber( xml.@width.toString() );
			_height = StyleUtil.toNumber( xml.@height.toString() );

			paint( target , style, data );
			data.currentCanvas.addChild( target );
		}
		
		override protected function draw( graphics:Graphics ):void 
		{
			graphics.drawRect( _x, _y, _width, _height );
		}
		
	}

}