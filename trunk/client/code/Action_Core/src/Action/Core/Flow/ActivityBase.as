package Action.Core.Flow
{
	public class ActivityBase
	{
		public function ActivityBase()
		{
		}
		
		private var _workflow:Workflow;
		private var _retryCount:int = 0;
		
		public function get workflow():Workflow
		{
			return _workflow;
		}
		
		public function set workflow(wf:Workflow):void
		{
			_workflow = wf;
		}
		
		protected function retry():void
		{
			if(++_retryCount > 5)
				throw new Error("Failed for 5 times.");
			if(this is IActivity)
				IActivity(this).run();
		}
	}
}