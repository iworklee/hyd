package com.hyd.joker.plugin.command
{
	import assets.IconAssects;
	
	import avmplus.getQualifiedClassName;
	
	import flashx.textLayout.debug.assert;
	
	import mx.controls.Alert;
	
	public class HelloCommand extends BaseCommand
	{
		public function HelloCommand()
		{
			super();
		}
		
		public override function click():void
		{			
			Alert.show(name);
		}
	}
}