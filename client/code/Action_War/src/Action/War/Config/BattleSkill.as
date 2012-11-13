package Action.War.Config
{
	import Action.Core.Util.JsonObject;
	import Action.War.BattleDefs;
	import Action.War.Resource.BattleSkillResource;
	import Action.War.Skill.ISkillRenderer;
	import Action.War.Skill.SkillRendererFactory;
	import Action.War.WarPlugins;
	
	import flash.display.BitmapData;
	
	public class BattleSkill extends JsonObject
	{		
		public var id:int;
		public var name:String;
		public var type:int;
		public var resPrevious:int;
		public var resCurrent:int;
		public var resPost:int;
		
		public function get resources():Array
		{
			var items:Array = new Array();
			if(resPrevious > 0)
				items.push(resPrevious);
			if(resCurrent > 0)
				items.push(resCurrent);
			if(resPost > 0)
				items.push(resPost);
			return items;
		}
		
		public function BattleSkill()
		{
			
		}
		
		public function getPreviousBitmap(idx:int):BitmapData
		{
			var resource:BattleSkillResource = BattleSkillResource.getInstance(resPrevious);
			return resource != null ? resource.bitmaps[idx] : null;
		}
		
		public function getCurrentBitmap(idx:int):BitmapData
		{
			var resource:BattleSkillResource = BattleSkillResource.getInstance(resCurrent);
			return resource != null ? resource.bitmaps[idx] : null;
		}
		
		public function getPostBitmap(idx:int):BitmapData
		{
			var resource:BattleSkillResource = BattleSkillResource.getInstance(resPost);
			return resource != null ? resource.bitmaps[idx] : null;
		}
		
		public function getBitmap(phs:int, idx:int):BitmapData
		{
			switch(phs)
			{
				case BattleDefs.SKILL_PHASE_PREVIOUS:
					return getPreviousBitmap(idx);
				case BattleDefs.SKILL_PHASE_CURRENT:
					return getCurrentBitmap(idx);
				case BattleDefs.SKILL_PHASE_POST:
					return getPostBitmap(idx);
				default:
					return null;
			}
		}
		
		public function createRenderer():ISkillRenderer
		{
			var renderer:ISkillRenderer = SkillRendererFactory.current.getSkillRenderer(type);
			return renderer != null ? renderer.create(this) : null;
		}
	}
}