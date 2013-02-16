package com.hyd.joker.core.util
{
	import mx.collections.ArrayCollection;

	public class ObjectEx
	{
		public function ObjectEx()
		{
		}
		
		public function copyFrom(source:Object):void
		{
			for(var name:String in source)
				this[name] = source[name];
		}
	}
}