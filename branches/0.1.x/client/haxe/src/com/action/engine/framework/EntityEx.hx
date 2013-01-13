package com.action.engine.framework;
import com.action.engine.workflow.Workflow;
import com.haxepunk.Entity;

/**
 * ...
 * @author east
 */

class EntityEx extends Entity
{
	private var _workflow:Workflow;
	
	public function new() 
	{
		super();
	}
	
	private inline function get_scene():Scene
	{
		return cast(_world, Scene);
	}
	public var scene(get_scene, null):Scene;
	
	private function createLoadingFlow():Workflow
	{
		return null;
	}
	
	public function preload():Void
	{
		_workflow = createLoadingFlow();
		if (_workflow != null)
		{
			if (_workflow.loadingForm != null)
				this.scene.add(_workflow.loadingForm);
			_workflow.onComplete = onload;
			_workflow.goon();
		}
		else
			onload();
	}
	
	private function onload():Void
	{
		if (_workflow != null && _workflow.loadingForm != null)
			this.scene.remove(_workflow.loadingForm);
		this.scene.endAdd(this);
	}
}