package Action.War.Commands
{
	import Action.Core.Command.IGameCommand;
	import Action.Core.Flow.IActivity;
	import Action.Core.Flow.Workflow;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.Serial.IGameDataSerializer;
	import Action.Core.Serial.MessageSerializer;
	import Action.Core.Util.NumberWrapper;
	import Action.Display.Drawing.CanvasGraphics;
	import Action.Model.BattleReport;
	import Action.Model.BattleUnit;
	import Action.Resource.CommonResource;
	import Action.Resource.Flow.LoadImageResourceActivity;
	import Action.Resource.ResourceDefs;
	import Action.War.BattleDefs;
	import Action.War.Report.BattleReportManager;
	import Action.War.Report.BattleUnitManager;
	import Action.War.UI.pgBattle;
	import Action.War.WarModule;
	
	import flash.events.Event;
	
	public class PlayBattleReportCommand implements IGameCommand
	{		
		public function PlayBattleReportCommand()
		{
		}
		
		public function get id():int
		{
			return 9527;
		}
		
		public function get serializer():IGameDataSerializer
		{
			return MessageSerializer.create(new BattleReport());
		}
		
		public function execute(client:GameClient, data:Object):void
		{
			var report:BattleReport = data as BattleReport;
			if(report == null)
				throw new Error("data must be type of BattleReport.");
			
			//先加载loading界面
			var frame:IGameFrame = client.frame;
			frame.changePage(frame.loadingPage);
			
			//准备要加载的资源
			var reportManager:BattleReportManager = new BattleReportManager(report);
			var loadings:Array = [new LoadImageResourceActivity(ResourceDefs.BG_Battle)];
			for each(var act:IActivity in reportManager.createLoadingActivities())
				loadings.push(act);
			
			//加载资源
			var workflow:Workflow = Workflow.create(loadings);
			workflow.addEventListener("Step", workflowSteped(client, workflow));
			workflow.addEventListener(Event.COMPLETE, workflowFinished(client, reportManager));
			workflow.goon();
		}		
		
		private function workflowSteped(client:GameClient, workflow:Workflow):Function{
			var func:Function=function(e:Event):void{
				onWorkflowSteped(client, workflow);
			}
			return func;
		}
		
		private function onWorkflowSteped(client:GameClient, workflow:Workflow):void
		{
			client.frame.loadingPage.setProgress(workflow.currentIndex, workflow.totalCount);
		}
		
		private function workflowFinished(client:GameClient, reportManager:BattleReportManager):Function{
			var func:Function=function(e:Event):void{
				onWorkflowFinished(client, reportManager);
			}
			return func;
		}
		
		private function onWorkflowFinished(client:GameClient, reportManager:BattleReportManager):void
		{
			var page:pgBattle = new pgBattle();
			page.setReportManager(reportManager);
			GameClient.current.frame.changePage(page);
		}
	}
}