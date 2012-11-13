package Action.Resource.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Core.GamePlugins;
	import Action.Resource.CommonResource;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	import org.osmf.media.LoadableElementBase;
	
	public class LoadImageResourceActivity extends ActivityBase implements IActivity
	{
		private var _url:String;
		private var _request:URLRequest;
		private var _loader:Loader;
				
		public function LoadImageResourceActivity(url:String)
		{
			_url = url;
			_request = new URLRequest();  
			_request.url = CommonResource.parseUrl(url);
			_request.method = URLRequestMethod.GET;
			GamePlugins.console.writeLine(_request.url);
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		public function run():void
		{
			if(CommonResource.imageSection.get(_url) == null)
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
			/*try
			{
				_loader.content;
			}
			catch(e:SecurityError)
			{
				_loader.loadBytes(_loader.contentLoaderInfo.bytes);
			}*/
			CommonResource.imageSection.set(_url, e.currentTarget.content);
			this.workflow.goon();
		}
	}
}