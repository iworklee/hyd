package Action.War.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Resource.CommonResource;
	import Action.War.Resource.BattleSkillResource;
	import Action.War.Strategy.BattleResourceStrategyFactory;
	import Action.War.Strategy.ISkillResourceStrategy;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	public class LoadBattleSkillResourceActivity extends ActivityBase implements IActivity
	{
		private var _battleSkillResource:BattleSkillResource;
		private var _skillResourceStrategy:ISkillResourceStrategy;
		
		private var _skillResId:int;
		private var _request:URLRequest;
		private var _loader:Loader;
		
		public function LoadBattleSkillResourceActivity(srid:int)
		{
			_battleSkillResource = BattleSkillResource.getInstance(srid);
			_skillResourceStrategy = BattleResourceStrategyFactory.getSkillStrategy(srid);
			
			_skillResId = srid;
			_request = new URLRequest();  
			_request.url = CommonResource.parseUrl("skill/" + srid + ".png");
			_request.method = URLRequestMethod.GET;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		public function run():void
		{
			if(_battleSkillResource.bitmaps.length == 0)
				_loader.load(_request);
			else
				this.workflow.goon();
		}
		
		public function dispose():void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		private function onImageLoaded(e:Event):void
		{
			var sourceBmp:BitmapData = Bitmap(e.currentTarget.content).bitmapData;
			_skillResourceStrategy.loadBitmaps(_battleSkillResource, sourceBmp);
			this.workflow.goon();
		}
	}
}