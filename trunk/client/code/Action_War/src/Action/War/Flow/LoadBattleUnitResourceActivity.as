package Action.War.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Display.Drawing.BitmapHelper;
	import Action.Resource.CommonResource;
	import Action.War.BattleResourceEnum;
	import Action.War.Report.BattleUnitManager;
	import Action.War.Resource.BattleUnitResource;
	import Action.War.Strategy.BattleResourceStrategyFactory;
	import Action.War.Strategy.IUnitResourceStrategy;
	
	import Action.Core.Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	
	public class LoadBattleUnitResourceActivity extends ActivityBase implements IActivity
	{
		private var _battleUnitResource:BattleUnitResource;
		private var _unitResourceStrategy:IUnitResourceStrategy;
		private var _battleBitmaps:Array;
		
		private var _request:URLRequest;
		private var _loader:Loader;
		
		public function LoadBattleUnitResourceActivity(brid:int, enum:int)
		{
			_battleUnitResource = BattleUnitResource.getInstance(brid);
			_unitResourceStrategy = BattleResourceStrategyFactory.getUnitStrategy(enum);
			_battleBitmaps = _unitResourceStrategy.getBitmaps(_battleUnitResource);
			
			_request = new URLRequest();  
			_request.url = CommonResource.parseUrl(_unitResourceStrategy.getRequestUrl(_battleUnitResource));
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
			var sourceBmp:BitmapData = Bitmap(e.currentTarget.content).bitmapData;
			_unitResourceStrategy.loadBitmaps(_battleUnitResource, sourceBmp);
			this.workflow.goon();
		}
	}
}