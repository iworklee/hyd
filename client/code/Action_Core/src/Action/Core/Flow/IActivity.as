package Action.Core.Flow
{
	public interface IActivity
	{
		function get workflow():Workflow;
		function set workflow(wf:Workflow):void;
		function run():void;
	}
}