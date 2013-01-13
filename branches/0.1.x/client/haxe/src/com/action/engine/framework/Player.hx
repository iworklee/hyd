package com.action.engine.framework;

/**
 * ...
 * @author east
 */

class Player 
{
	private var _account:String;
	private var _name:String;
	
	public function new(account:String, name:String)
	{
		_account = account;
		_name = name;
	}
	
	private function get_account():String
	{
		return _account;
	}
	public var account(get_account, null):String;
	
	private function get_name():String 
	{
		return _name;
	}	
	public var name(get_name, null):String;
	
	
}