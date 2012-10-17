package res.event
{
	import flash.events.Event;
	
	public class ConfigDataCompleteEvent extends Event
	{
		public static const NAME:String = "ConfigDataCompleteEvent";
		public function ConfigDataCompleteEvent()
		{
			super(NAME, true, false);
		}
	}
}