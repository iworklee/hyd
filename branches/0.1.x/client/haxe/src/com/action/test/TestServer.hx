package com.action.test;
import com.action.engine.network.GameClient;

/**
 * ...
 * @author east
 */

class TestServer 
{
	public function new() 
	{
		
	}
	
	public function onRecv(client:GameClient, key:Int, data:Dynamic):Void
	{
		client.onReceive(key, data);
	}
}