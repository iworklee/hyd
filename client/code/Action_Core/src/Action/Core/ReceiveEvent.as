package Action.Core
{
	import flash.events.Event;
	
	public class ReceiveEvent extends Event
	{
		public function ReceiveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var cmdId:int;
		public var cmdName:String;
		public var cmdArgs:Object;
	}
}