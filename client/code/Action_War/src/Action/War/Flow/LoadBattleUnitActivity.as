package Action.War.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Display.Drawing.BitmapHelper;
	import Action.Resource.ResourceManager;
	import Action.War.BattleResourceEnum;
	import Action.War.Manager.BattleResourceManager;
	import Action.War.Manager.BattleUnitManager;
	import Action.War.Strategy.BattleResourceStrategyFactory;
	import Action.War.Strategy.IBattleResourceStrategy;
	
	import Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	
	public class LoadBattleUnitActivity extends ActivityBase implements IActivity
	{
		private var _battleResourceManager:BattleResourceManager;
		private var _battleResourceStrategy:IBattleResourceStrategy;
		private var _battleBitmaps:Array;
		
		public function LoadBattleUnitActivity(brid:int, enum:int)
		{
			_battleResourceStrategy = BattleResourceStrategyFactory.strategies[enum];
			_battleResourceManager = BattleResourceManager.getInstance(brid);
			_battleBitmaps = _battleResourceStrategy.getBitmaps(_battleResourceManager);
		}
		
		public function run():void
		{			
			if(_battleBitmaps.length == 0)
			{
				var request:URLRequest = new URLRequest();  
				request.url = ResourceManager.parseUrl(_battleResourceStrategy.getRequestUrl(_battleResourceManager));
				request.method = URLRequestMethod.GET;
				
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
				loader.load(request);
			}
			else
				this.workflow.goon();
		}
		
		private function onImageLoaded(e:Event):void
		{
			var sourceBmp:Bitmap = Bitmap(e.currentTarget.content);
			_battleResourceStrategy.loadBitmaps(_battleResourceManager, sourceBmp);
			this.workflow.goon();
		}
	}
}