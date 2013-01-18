package com.hyd.joker.plugin.command
{
	import assets.IconAssects;
	
	import avmplus.getQualifiedClassName;
	
	import com.hyd.joker.core.Joker;
	import com.hyd.joker.core.facade.ICommand;
	import com.hyd.joker.core.facade.IMap;
	
	public class BaseCommand implements ICommand
	{
		private var _name:String;
		
		public function BaseCommand()
		{
			var text:String = getQualifiedClassName(this);
			var p:int = text.indexOf("::");
			_name = p > -1 ? text.substr(p+2) : text;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get enabled():Boolean
		{
			return Joker.context.enabled;
		}
		
		public function get icon():Class
		{
			return IconAssects[name];
		}
		
		public function click():void
		{
			
		}
	}
}