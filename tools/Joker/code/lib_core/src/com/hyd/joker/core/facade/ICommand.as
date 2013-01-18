package com.hyd.joker.core.facade
{
	public interface ICommand
	{
		function get name():String;
		function get enabled():Boolean;
		function get icon():Class;
		function click():void;
	}
}