package Action.Core.Flow
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Timer;

	public class Workflow extends EventDispatcher
	{
		public static function create(activities:Array):Workflow
		{
			return new Workflow(activities);
		}
		
		private var _activities:Array;
		private var _index:int = 0;
				
		public function getCurrentActivity():IActivity
		{
			return _index < _activities.length ? _activities[_index] as IActivity : null;
		}
		
		public function Workflow(acts:Array)
		{
			_activities = acts;
			if(_activities == null || _activities.length == 0)
				throw new Error("Empty workflow.");
			for each(var act:IActivity in _activities)
				act.workflow = this;
		}
		
		public function goon():void
		{
			var act:IActivity = getCurrentActivity();
			if(act != null)
			{
				act.run();
				_index++;
			}
			else if(_index >= _activities.length)
			{
				_activities = null;
				this.dispatchEvent(new Event(Event.COMPLETE));
			}
		}
	}
}