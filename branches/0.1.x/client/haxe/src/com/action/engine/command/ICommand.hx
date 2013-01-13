package com.action.engine.command;
interface ICommand
{
	var id(get_id, null):Int;
	function execute(data:Dynamic):Void;
}