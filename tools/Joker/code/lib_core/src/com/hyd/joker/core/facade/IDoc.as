package com.hyd.joker.core.facade
{
	public interface IDoc
	{
		function get path():String;
		function get display():IDisplay;
		function load(map:IMap):void;
	}
}