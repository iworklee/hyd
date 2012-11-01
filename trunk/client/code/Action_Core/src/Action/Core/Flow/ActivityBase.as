package Action.Core.Flow
{
	public class ActivityBase
	{
		public function ActivityBase()
		{
		}
		
		private var _workflow:Workflow;
		
		public function get workflow():Workflow
		{
			return _workflow;
		}
		
		public function set workflow(wf:Workflow):void
		{
			_workflow = wf;
		}
	}
}