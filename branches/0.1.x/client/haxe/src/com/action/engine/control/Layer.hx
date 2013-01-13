package com.action.engine.control;
import nme.display.DisplayObject;
import nme.display.Sprite;

/**
 * ...
 * @author east
 */

class Layer extends Sprite
{
	public function new() 
	{
		super();
	}
	
	public function addControl(control:Control):Void
	{
		super.addChild(control);
		control.init();
	}
	
	public function removeControl(control:Control):Void
	{
		control.dispose();
		super.removeChild(control);
	}
}