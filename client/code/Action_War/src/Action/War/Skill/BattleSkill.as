package Action.War.Skill
{
	import Action.War.Resource.BattleSkillResource;
	
	import flash.display.Bitmap;

	public class BattleSkill
	{
		public var id:int;
		public var name:String;
		public var type:int;
		
		public function BattleSkill()
		{
			
		}
		
		public function get resId():int
		{
			return id;
		}
		
		public function getBitmaps():Array
		{
			return BattleSkillResource.getInstance(resId).effectBitmaps;
		}
		
		public function getBitmap(idx:int):Bitmap
		{
			return getBitmaps()[idx];
		}
		
		public function createRenderer():ISkillRenderer
		{
			var renderer:ISkillRenderer = SkillRendererFactory.current.getSkillRenderer(type);
			if(renderer != null)
				renderer.loadSkill(this);
			return renderer;
		}
	}
}