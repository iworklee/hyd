package com.action.engine.util;
import flash.display.BitmapData;
import flash.geom.Matrix;
import nme.text.TextField;
import nme.text.TextFormat;

/**
 * ...
 * @author east
 */

class DrawHelper 
{
	public static function drawText(text:String, color:Int = 0xff0000, size:Int = 10, bold:Bool = false, font:String = "Arial")
	{
		var label:TextField = new TextField();
		label.text = text;
		var format:TextFormat = new TextFormat();
		format.color = color;
		format.size = 10;
		format.bold = bold;
		format.font = font;
		label.setTextFormat(format);
		
		var bitmap:BitmapData = new BitmapData(label.textWidth + 1000, label.textHeight + 100, true, 0x00000000);
		var matrix:Matrix = new Matrix();
		matrix.scale(size / 10, size /10);
		matrix.translate(-size / 5, -size / 5);
		bitmap.draw(label, matrix);
	}
}