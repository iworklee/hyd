package Action.Resource.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Resource.ResourceManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	import org.osmf.media.LoadableElementBase;
	
	public class LoadImageActivity extends ActivityBase implements IActivity
	{
		private var _url:String;
		private var _request:URLRequest;
		private var _loader:Loader;
				
		public function LoadImageActivity(url:String)
		{
			_url = url;
			_request = new URLRequest();  
			_request.url = ResourceManager.parseUrl(url);
			_request.method = URLRequestMethod.GET;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		public function run():void
		{
			if(ResourceManager.imageSection.get(_url) == null)
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
			ResourceManager.imageSection.set(_url, e.currentTarget.content);
			this.workflow.goon();
		}
	}
}