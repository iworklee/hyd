package com.action.engine.workflow;
import com.action.engine.GameContext;

/**
 * ...
 * @author east
 */

class LoadBitmapActivity extends LoadResourceActivity
{
	public function new(key:String)
	{
		super(key);
	}
	
	private override function getReqestUrl():String
	{
		return GameContext.config.global.resRoot + _key;
	}
	
	private override function containsResource():Bool
	{
		return GameContext.remoteResource.getBitmap(_key) != null;
	}
	
	private override function appendResource(content:Dynamic):Void
	{
		GameContext.remoteResource.setBitmap(_key, content.bitmapData);
	}
}