package com.action.engine.util;
import com.hxjson2.JSON;

/**
 * ...
 * @author east
 */

class JsonHelper {

	public static function encode(obj:Dynamic):String {
		return JSON.encode(obj);
	}

	public static function decode<T>(cls:Class<T>, json:String):T	{
		var source = JSON.decode(json);
		var target = Type.createInstance(cls, []);
		var fields = Reflect.fields(source);
		for (field in fields)
		{
			if (Reflect.hasField(target, field))
			{
				var value = Reflect.field(source, field);
				Reflect.setField(target, field, value);
			}
		}
		return target;
	}
}

