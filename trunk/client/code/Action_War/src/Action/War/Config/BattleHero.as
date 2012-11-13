package Action.War.Config
{
	import Action.Core.Util.JsonObject;
	import Action.Resource.HeroFaceResource;
	import Action.War.WarPlugins;
	
	import flash.display.BitmapData;

	public class BattleHero extends JsonObject
	{		
		public var id:int;
		public var name:String;
		public var face:int;
		public var body:int;
		public var unit:int;
		public var skill:int;
		
		public function BattleHero()
		{
		}
		
		public function getFaceBitmap():BitmapData
		{
			return HeroFaceResource.getInstance(face).bitmap;
		}
	}
}