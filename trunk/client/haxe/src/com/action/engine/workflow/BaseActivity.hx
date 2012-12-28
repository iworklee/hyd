package com.action.engine.workflow;
import nme.errors.Error;
import nme.events.Event;
import nme.events.IOErrorEvent;

/**
 * ...
 * @author east
 */

class BaseActivity implements IFlowActivity
{
	private var _retryCount:Int = 0;
	
	public function new() 
	{
		
	}
	
	public var workflow:Workflow;
	
	public function run():Void
	{
		
	}
	
	public function dispose():Void
	{
		
	}
	
	private function onError(e:IOErrorEvent):Void
	{
		if(++_retryCount > 5)
			throw new Error("Failed for 5 times.\n" + e.toString());
		run();
	}	
}