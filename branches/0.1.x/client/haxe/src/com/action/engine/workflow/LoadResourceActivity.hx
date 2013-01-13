package com.action.engine.workflow;
import com.action.engine.GameContext;
import com.action.engine.workflow.BaseActivity;
import nme.events.Event;
import haxe.Http;
import nme.display.Loader;
import nme.events.IOErrorEvent;
import nme.net.URLRequest;
import nme.net.URLRequestMethod;

/**
 * ...
 * @author east
 */

class LoadResourceActivity extends BaseActivity
{
	private var _key:Dynamic;	
	private var _request:URLRequest;
	private var _loader:Loader;
	
	public function new(key:Dynamic) 
	{
		super();
		_key = key;
		_request = new URLRequest();  
		_request.url = getReqestUrl();
		_request.method = URLRequestMethod.GET;
		
		_loader = new Loader();
		_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
		_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
	}
	
	public override function run():Void
	{
		if(!containsResource())
			_loader.load(_request);
		else
			this.workflow.goon();
	}
	
	public override function dispose():Void
	{
		_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoad);
		_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
	}
	
	private function onLoad(e:Event):Void
	{
		appendResource(e.target.content);
		this.workflow.goon();
	}
	
	private function getReqestUrl():String
	{
		return "";
	}
	
	private function containsResource():Bool
	{
		return true;
	}
	
	private function appendResource(content:Dynamic):Void
	{
		
	}
}