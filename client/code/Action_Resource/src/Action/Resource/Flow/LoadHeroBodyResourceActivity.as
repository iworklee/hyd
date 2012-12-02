package Action.Resource.Flow
{
	import Action.Core.Flow.ActivityBase;
	import Action.Core.Flow.IActivity;
	import Action.Core.Util.NumberWrapper;
	import Action.Display.Drawing.BitmapHelper;
	import Action.Resource.CommonResource;
	import Action.Resource.HeroBodyResource;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import flashx.textLayout.debug.assert;
	
	import mx.containers.Form;
	
	public class LoadHeroBodyResourceActivity extends ActivityBase implements IActivity
	{
		private var _bodyResource:HeroBodyResource;
		private var _request:URLRequest;
		private var _loader:Loader;
		private var _index:int;
		
		public function LoadHeroBodyResourceActivity(bodyId:int, index:int)
		{
			if(index != 0 && index != 1)
				throw new Error("index must be 0 or 1.");
			_index = index;
			
			var postfix:String = _index == 0 ? "a": "b";
			_bodyResource = HeroBodyResource.getInstance(bodyId);
			_request = new URLRequest();
			_request.url = CommonResource.parseUrl("hero/b" + NumberWrapper.wrap(bodyId).toText(3) + postfix + ".png");
			_request.method = URLRequestMethod.GET;
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, retry);
		}
		
		public function run():void
		{
			if(_bodyResource.bitmaps.length <= _index * 40)
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
			for(var i:int=0; i<20; i++)
			{
				var targetBmp:BitmapData = BitmapHelper.cutBitmap(sourceBmp, 0, i * 64, 48, 64);
				_bodyResource.bitmaps.push(targetBmp);
				_bodyResource.bitmaps.push(BitmapHelper.reverseBitmap(targetBmp));
			}
			this.workflow.goon();
		}
	}
}