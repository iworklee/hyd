package Action.War.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Display.Drawing.BitmapHelper;
	import Action.Resource.ResourceManager;
	import Action.War.BattleResourceEnum;
	import Action.War.Resource.BattleUnitResource;
	import Action.War.Report.BattleUnitManager;
	import Action.War.Strategy.BattleResourceStrategyFactory;
	import Action.War.Strategy.IBattleResourceStrategy;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	
	public class LoadBattleUnitActivity extends ActivityBase implements IActivity
	{
		private var _battleResourceManager:BattleUnitResource;
		private var _battleResourceStrategy:IBattleResourceStrategy;
		private var _battleBitmaps:Array;
		
		private var _request:URLRequest;
		private var _loader:Loader;
		
		public function LoadBattleUnitActivity(brid:int, enum:int)
		{
			_battleResourceStrategy = BattleResourceStrategyFactory.strategies[enum];
			_battleResourceManager = BattleUnitResource.getInstance(brid);
			_battleBitmaps = _battleResourceStrategy.getBitmaps(_battleResourceManager);
			
			_request = new URLRequest();  
			_request.url = ResourceManager.parseUrl(_battleResourceStrategy.getRequestUrl(_battleResourceManager));
			_request.method = URLRequestMethod.GET;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		public function run():void
		{			
			if(_battleBitmaps.length == 0)			
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
			var sourceBmp:Bitmap = Bitmap(e.currentTarget.content);
			_battleResourceStrategy.loadBitmaps(_battleResourceManager, sourceBmp);
			this.workflow.goon();
		}
	}
}