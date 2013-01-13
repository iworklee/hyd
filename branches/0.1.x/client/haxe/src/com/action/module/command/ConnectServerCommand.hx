package com.action.module.command;
import com.action.engine.command.ICommand;
import com.haxepunk.HXP;

/**
 * ...
 * @author east
 */

class ConnectServerCommand implements ICommand
{	
	public function new()
	{
		
	}
	
	private function get_id():Int 
	{
		return 0;
	}	
	public var id(get_id, null):Int;
	
	public function execute(data:Dynamic):Void 
	{
		
	}
	
}