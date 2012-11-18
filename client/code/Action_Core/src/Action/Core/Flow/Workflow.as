package Action.Core.Flow
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Timer;
	
	import mx.messaging.AbstractConsumer;

	public class Workflow extends EventDispatcher
	{
		public static function create(activities:Array):Workflow
		{
			return new Workflow(activities);
		}
		
		private var _activities:Array;
		private var _index:int = 0;
				
		public function getPreviousActivity():IActivity
		{
			var idx:int = _index - 1;
			return idx < _activities.length ? _activities[idx] as IActivity : null;
		}
		
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
		
		public function get currentIndex():int
		{
			return _index;
		}
		
		public function get totalCount():int
		{
			return _activities.length;
		}
		
		public function goon():void
		{
			var preAct:IActivity = getPreviousActivity();
			if(preAct != null)
				preAct.dispose();
			var curAct:IActivity = getCurrentActivity();
			if(curAct != null)
			{
				_index++;
				curAct.run();
				this.dispatchEvent(new Event("Step"));
			}
			else if(_index >= _activities.length)
			{
				_activities = null;
				this.dispatchEvent(new Event(Event.COMPLETE));
			}
		}
	}
}