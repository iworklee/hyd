package com.action.engine.util;
import haxe.Json;

/**
 * ...
 * @author east
 */

class JsonHelper {

	public static function encode(obj:Dynamic):String {
		return Json.stringify(obj);
	}

	public static function decode<T>(cls:Class<T>, json:String):T	{
		var source = Json.parse(json);
		var target = Type.createInstance(cls, []);
		var fields = Reflect.fields(source);
		for (field in fields)
		{
#if flash
			if (Reflect.hasField(target, field))
#end
			{
				var value = Reflect.field(source, field);
				Reflect.setField(target, field, value);
			}
		}
		return target;
	}
}

