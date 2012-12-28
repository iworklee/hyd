package com.action.engine.config;
import com.action.engine.GameContext;
import com.action.engine.util.JsonHelper;
import nme.Assets;

/**
 * ...
 * @author east
 */

class GameConfig 
{	
	private var _global:GlobalSection;
	private inline function get_global():GlobalSection 
	{
		return _global; 
	}	
	public var global(get_global, null):GlobalSection;
	
	public function new() 
	{
		_global = createSection(GlobalSection, "cfg/global.json");
		GameContext.createScenes(_global.scenes);
	}
	
	private function createSection<T>(cls:Class<T>, path:String):T
	{
		var json:String = Assets.getText(path);
		return JsonHelper.decode(cls, json);
	}
}