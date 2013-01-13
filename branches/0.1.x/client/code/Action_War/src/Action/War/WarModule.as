package Action.War
{
	import Action.Core.Flow.Workflow;
	import Action.Core.GamePlugins;
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.ReceiveEvent;
	import Action.Resource.Flow.LoadImageResourceActivity;
	import Action.War.Config.BattleHero;
	import Action.War.Config.BattleSkill;
	import Action.War.Skill.CommonSkillRenderer;
	import Action.War.Skill.SpecialSkillRenderer;
	import Action.War.UI.pgBattle;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	
	public class WarModule implements IGameModule
	{
		public function WarModule()
		{
		}		
		
		public function get name():String
		{
			return "WarModule";
		}
		
		public function onLoad():void
		{
			WarPlugins.skillRenderers = [
				new CommonSkillRenderer(),
				new SpecialSkillRenderer(1),
				new SpecialSkillRenderer(2),
				new SpecialSkillRenderer(3)
			];
		}
		
		public function onUnload():void
		{
		}
		
		public function onConnect(client:GameClient, e:Event):void
		{
		}
		
		public function onClose(client:GameClient, e:Event):void
		{
		}
		
		public function onReceive(client:GameClient, e:ReceiveEvent):void
		{
		}
		
		public function onIOError(client:GameClient, e:IOErrorEvent):void
		{
		}
	}
}