package Action.War
{
	import Action.Core.Flow.Workflow;
	import Action.Core.GamePlugins;
	import Action.Core.Module.IGameModule;
	import Action.Core.Net.GameClient;
	import Action.Core.Page.IGameFrame;
	import Action.Core.ReceiveEvent;
	import Action.Resource.Flow.LoadImageActivity;
	import Action.War.Hero.BattleHero;
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
			WarPlugins.skillRenderers = [
				new CommonSkillRenderer(),
				new SpecialSkillRenderer(1),
				new SpecialSkillRenderer(2),
				new SpecialSkillRenderer(3)
			];
			WarPlugins.skillResources = [201, 204];
			initHeros();
			initSkills();
			//test();
		}
		
		private function test():void
		{
			for(var key:String in WarPlugins.skills)
			{
				GamePlugins.console.writeLine(key + "," + WarPlugins.skills[key].id + "," + WarPlugins.skills[key].name);
			}
		}
		
		private function initHeros():void
		{
			WarPlugins.heros = new Array();
			
			var hero:BattleHero = new BattleHero();
			hero.id = 1;
			hero.name = "曹操";
			hero.skill = 106;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 2;
			hero.name = "关羽";
			hero.skill = 2;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 3;
			hero.name = "张飞";
			hero.skill = 1;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 4;
			hero.name = "司马懿";
			hero.skill = 101;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 5;
			hero.name = "吕布";
			hero.skill = 3;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 102;
			hero.name = "骑兵";
			hero.skill = 0;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 103;
			hero.name = "步兵";
			hero.skill = 0;
			WarPlugins.heros[hero.id] = hero;
			
			hero = new BattleHero();
			hero.id = 104;
			hero.name = "弓兵";
			hero.skill = 0;
			WarPlugins.heros[hero.id] = hero;
		}
		
		private function initSkills():void
		{
			WarPlugins.skills = new Array();
			
			var skill:BattleSkill = new BattleSkill();
			skill.id = 0;
			skill.name = "";
			skill.type = 0;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 1;
			skill.name = "长驱直入";
			skill.type = 3;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 2;
			skill.name = "横扫千军";
			skill.type = 3;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 3;
			skill.name = "无双乱舞";
			skill.type = 3;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 101;
			skill.name = "天火燎原";
			skill.type = 2;
			skill.resCurrent = 1;
			WarPlugins.skills[skill.id] = skill;
			
			skill = new BattleSkill();
			skill.id = 106;
			skill.name = "天下归心";
			skill.type = 2;
			skill.resPrevious = 2;
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