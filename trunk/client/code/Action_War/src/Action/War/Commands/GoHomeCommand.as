package Action.War.Commands
{
	import Action.Core.Command.IGameCommand;
	import Action.Core.Flow.Workflow;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.Serial.IGameDataSerializer;
	import Action.Resource.Flow.LoadHeroBodyResourceActivity;
	import Action.Resource.Flow.LoadHeroFaceResourceActivity;
	import Action.Resource.Flow.LoadImageResourceActivity;
	import Action.Resource.HeroBodyResource;
	import Action.Resource.HeroFaceResource;
	import Action.Resource.ResourceDefs;
	import Action.War.BattleDefs;
	import Action.War.Config.BattleConfigFactory;
	import Action.War.Config.BattleHero;
	import Action.War.Flow.LoadBattleUnitResourceActivity;
	import Action.War.Resource.BattleUnitResource;
	import Action.War.UI.pgHome;
	
	import flash.events.Event;
	
	public class GoHomeCommand implements IGameCommand
	{
		public function GoHomeCommand()
		{
		}
		
		public function get id():int
		{
			return 0;
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
				new LoadImageResourceActivity(ResourceDefs.BG_Home),
				new LoadImageResourceActivity(ResourceDefs.UI_CopyList),
				new LoadImageResourceActivity(ResourceDefs.UI_Lock),
				new LoadImageResourceActivity(ResourceDefs.UI_Win_Title),
				new LoadImageResourceActivity(ResourceDefs.UI_Win_Close),
				new LoadImageResourceActivity(ResourceDefs.SWF_Test)
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
					
					if(HeroBodyResource.getInstance(hero.body) == null)
						HeroBodyResource.createInstance(hero.body);
					loadings.push(new LoadHeroBodyResourceActivity(hero.body, 0));
					loadings.push(new LoadHeroBodyResourceActivity(hero.body, 1));
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
			var page:pgHome = new pgHome();
			GameClient.current.frame.changePage(page);
		}
	}
}