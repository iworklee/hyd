package com.action.engine.network;
import com.haxepunk.HXP;
import flash.display.BitmapData;

/**
 * ...
 * @author east
 */

class LocalResource 
{
	public function new()
	{
		
	}
	
	public function getBitmap(key:String):BitmapData
	{
		return HXP.getBitmap(key);
	}
}