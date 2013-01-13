package Action.War.Commands
{
	import Action.Core.Command.GameCommandFactory;
	import Action.Core.Command.IGameCommand;
	import Action.Core.Flow.Workflow;
	import Action.Core.GamePlugins;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.Serial.IGameDataSerializer;
	import Action.Model.BattleReport;
	import Action.Resource.Flow.LoadHeroFaceResourceActivity;
	import Action.Resource.Flow.LoadImageResourceActivity;
	import Action.Resource.HeroFaceResource;
	import Action.Resource.ResourceDefs;
	import Action.War.BattleReportProvider;
	import Action.War.Config.BattleConfigFactory;
	import Action.War.Config.BattleHero;
	import Action.War.Flow.LoadBattleUnitResourceActivity;
	import Action.War.Resource.BattleUnitResource;
	import Action.War.UI.pgCopy;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	
	public class EnterCopyCommand implements IGameCommand
	{
		public function EnterCopyCommand()
		{
		}
		
		public function get id():int
		{
			return 1;
		}
		
		public function get serializer():IGameDataSerializer
		{
			return null;
		}
		
		public function execute(client:GameClient, data:Object):void
		{
			//先加载loading界面
			var frame:IGameFrame = client.frame;
			frame.changePage(frame.loadingPage);
			
			var loadings:Array = [
				new LoadImageResourceActivity(ResourceDefs.BG_Copy),
				new LoadImageResourceActivity(ResourceDefs.UI_Win_Title),
				new LoadImageResourceActivity(ResourceDefs.UI_Win_Close)
			];
			addHeroToLoading(loadings, [635,289,98,432,395,660,424,802]);
			
			//加载资源
			var workflow:Workflow = Workflow.create(loadings);
			workflow.addEventListener("Step", workflowSteped(client, workflow));
			workflow.addEventListener(Event.COMPLETE, workflowFinished(client));
			workflow.goon();
		}	
		
		private function addHeroToLoading(loadings:Array, heroIds:Array):void
		{
			for each(var id:int in heroIds)
			{
				var hero:BattleHero = BattleConfigFactory.getHero(id);
				if(hero != null)
				{
					if(HeroFaceResource.getInstance(hero.face) == null)
						HeroFaceResource.createInstance(hero.face);
					loadings.push(new LoadHeroFaceResourceActivity(hero.face));
					
					if(BattleUnitResource.getInstance(hero.unit) == null)
						BattleUnitResource.createInstance(hero.unit);
					for(var i:int = 1; i<4; i++)
						loadings.push(new LoadBattleUnitResourceActivity(hero.unit, i));
				}
			}
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
		
		private function workflowFinished(client:GameClient):Function{
			var func:Function=function(e:Event):void{
				onWorkflowFinished(client);
			}
			return func;
		}
		
		private function onWorkflowFinished(client:GameClient):void
		{
			var page:pgCopy = new pgCopy();
			GameClient.current.frame.changePage(page);
		}
		
		private function playBattleReport():void
		{
			var buString:String = GamePlugins.parameters.battleReport;
			var report:BattleReport = buString != null && buString.length > 5
				? BattleReportProvider.current.createBattleReport(buString)
				: BattleReportProvider.current.createTestReport();
			if(report != null)
				GameCommandFactory.current.getCommand(9527).execute(GameClient.current,	report);
			else
				Alert.show("战报格式错误！");
		}
	}
}