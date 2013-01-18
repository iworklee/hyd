﻿package com.svg.parser 
{
	import com.svg.parser.IParser;
	import com.svg.parser.abstract.AbstractPaint;
	import com.svg.parser.model.Data;
	import com.svg.parser.style.Style;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.display.GraphicsPathCommand;
	
	public class Polyline extends AbstractPaint implements IParser
	{
		public static var LOCALNAME:String = "polyline";
		
		private var _commands:Vector.<int>;
		private var _vertices:Vector.<Number>;
		
		public function Polyline() { }
		
		public function parse( data:Data ):void 
		{
			var target:Shape = new Shape();
			var style:Style = new Style( data.currentXml );
			
			var points:Array = data.currentXml.@points.toString()	.replace(/\s+$/, "")
																	.replace(/\s+/g , ",")
																	.split(",");
			_vertices = Vector.<Number>( points );
			
			var comLength:int = (_vertices.length / 2 ) -1;
			_commands  = Vector.<int>([GraphicsPathCommand.MOVE_TO]);
			for ( var i:int = 0 ; i < comLength   ; i++ )
				_commands.push( GraphicsPathCommand.LINE_TO );

			paint( target, style, data );
			data.currentCanvas.addChild( target );
		}
		
		override protected function draw( graphics:Graphics ):void {
			graphics.drawPath( _commands, _vertices );
		}
		
	}

}