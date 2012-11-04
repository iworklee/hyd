package Action.Resource.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Resource.ResourceManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.osmf.events.LoaderEvent;
	
	public class LoadImageActivity extends ActivityBase implements IActivity
	{
		private var _url:String;
				
		public function LoadImageActivity(url:String)
		{
			_url = url;
		}
		
		public function run():void
		{
			if(ResourceManager.imageSection.get(_url) == null)
			{
				var request:URLRequest = new URLRequest();  
				request.url = ResourceManager.parseUrl(_url);
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
			ResourceManager.imageSection.set(_url, e.currentTarget.content);
			this.workflow.goon();
		}
	}
}