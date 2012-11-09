package Action.War
{
	import Action.Core.Flow.Workflow;
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.ReceiveEvent;
	import Action.Resource.Flow.LoadImageActivity;
	import Action.War.Skill.BattleSkill;
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
		
		public static const BgUrl:String = "battle/001.JPG?5";
		
		public function get name():String
		{
			return "WarModule";
		}
		
		public function onLoad():void
		{
			WarPlugins.skillRenderers = [new CommonSkillRenderer(), new SpecialSkillRenderer(1), new SpecialSkillRenderer(2)];
			WarPlugins.skillResources = [201, 204];
			WarPlugins.skills = new Array();
			
			var skill:BattleSkill = new BattleSkill();
			skill.id = 0;
			skill.name = "普通攻击";
			skill.type = 0;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 1;
			skill.name = "长驱直入";
			skill.type = 1;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 101;
			skill.name = "天火燎原";
			skill.type = 2;
			skill.resCurrent = skill.resPost = 1;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 106;
			skill.name = "天下归心";
			skill.type = 2;
			skill.resPrevious = skill.resCurrent = 2;
			WarPlugins.skills[skill.id] = skill;
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