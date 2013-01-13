package com.action.engine.workflow;

/**
 * ...
 * @author east
 */

interface IFlowActivity 
{
	var workflow:Workflow;
	function run():Void;
	function dispose():Void;
}