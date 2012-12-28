package com.action.engine.network;
import flash.display.BitmapData;

/**
 * ...
 * @author east
 */

class RemoteResource 
{
	private var _bitmaps:Hash<BitmapData>;
	
	public function new()
	{
		_bitmaps = new Hash();
	}
	
	public function getBitmap(key:String):BitmapData
	{
		return _bitmaps.get(key);
	}
	
	public function setBitmap(key:String, bitmap:BitmapData):Void
	{
		_bitmaps.set(key, bitmap);
	}
}