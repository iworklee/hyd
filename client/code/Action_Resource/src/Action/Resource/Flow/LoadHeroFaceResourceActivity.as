package Action.Resource.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Resource.CommonResource;
	import Action.Resource.HeroFaceResource;
	
	import Action.Core.Util.NumberWrapper;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	public class LoadHeroFaceResourceActivity extends ActivityBase implements IActivity
	{
		private var _heroResource:HeroFaceResource;
		private var _request:URLRequest;
		private var _loader:Loader;
		
		public function LoadHeroFaceResourceActivity(heroId:int)
		{
			_heroResource = HeroFaceResource.getInstance(heroId);
			_request = new URLRequest();  
			_request.url = CommonResource.parseUrl("hero/h" + NumberWrapper.wrap(heroId).toText(3) + ".png");
			_request.method = URLRequestMethod.GET;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		public function run():void
		{
			if(_heroResource.bitmap == null)
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
			_heroResource.bitmap = Bitmap(e.currentTarget.content).bitmapData;
			this.workflow.goon();
		}
	}
}