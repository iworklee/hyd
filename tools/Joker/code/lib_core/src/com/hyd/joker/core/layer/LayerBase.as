package com.hyd.joker.core.layer
{
	import com.hyd.joker.core.util.ObjectEx;
	
	public class LayerBase extends ObjectEx
	{
		public function LayerBase()
		{
			super();
		}
		
		public var name:String;
		public var text:String;
		public var checked:Boolean;
	}
}