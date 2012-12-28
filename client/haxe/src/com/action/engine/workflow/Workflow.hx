package com.action.engine.workflow;
import com.action.engine.loading.ILoading;
import com.action.engine.loading.LoadingForm;
import nme.errors.Error;
import nme.events.Event;
import nme.events.EventDispatcher;

/**
 * ...
 * @author east
 */

class Workflow
{	
	public static function create(loading:ILoading, activities:Array<IFlowActivity>):Workflow
	{
		return new Workflow(loading, activities);
	}	
	
	private var _loading:ILoading;
	private var _activities:Array<IFlowActivity>;
	private var _index:Int = 0;
	
	public function new(loading:ILoading, acts:Array<IFlowActivity>)
	{
		_loading = loading;
		_activities = acts;
		if(_activities == null || _activities.length == 0)
			throw new Error("Empty workflow.");
		for(act in _activities)
			act.workflow = this;
	}	
	
	private inline function get_loading():ILoading 
	{
		return _loading;
	}	
	public var loading(get_loading, null):ILoading;
	
	private inline function get_loadingForm():LoadingForm
	{
		return cast(_loading, LoadingForm);
	}
	public var loadingForm(get_loadingForm, null):LoadingForm;
		
	public function getPreviousActivity():IFlowActivity
	{
		var idx:Int = _index - 1;
		return idx < _activities.length ? _activities[idx] : null;
	}

	public function getCurrentActivity():IFlowActivity
	{
		return _index < _activities.length ? _activities[_index] : null;
	}	

	/*public var currentIndex(getCurrentIndex, null):Int;
	private inline function getCurrentIndex():Int
	{
		return _index;
	}

	public var totalCount(getTotalCount, null):Int;
	private inline function getTotalCount():Int
	{
		return _activities.length;
	}*/

	public function goon():Void
	{
		var preAct:IFlowActivity = getPreviousActivity();
		if(preAct != null)
			preAct.dispose();
		var curAct:IFlowActivity = getCurrentActivity();
		if(curAct != null)
		{
			_index++;
			curAct.run();
			onStep(_index, _activities.length);
			if (_loading != null)
				_loading.setProgress(_index, _activities.length);
		}
		else if(_index >= _activities.length)
		{
			_activities = null;
			onComplete();
		}
	}
	
	public dynamic function onStep(index:Int, total:Int):Void
	{
		
	}
	
	public dynamic function onComplete():Void
	{
		
	}
}