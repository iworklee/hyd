package res
{
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import res.event.ResSwfLoadEvent;
	import res.event.ResXmlLoadEvent;
	import res.loader.ResSwfLoader;
	import res.loader.ResXmlLoader;
	import res.vo.PreloadSwfData;
	import res.vo.PreloadXmlData;
	import res.vo.ResSwfVO;
	import res.vo.ResXmlVO;

	public class ResLoaderManager extends EventDispatcher
	{
		private static var _instance:ResLoaderManager;
		public static function getInstance():ResLoaderManager
		{
			if(!_instance)
			{
				_instance = new ResLoaderManager();
			}
			
			return _instance;
		}
		
		private var _bitmapPreloadQueue:Array;
		private var _swfPreloadQueue:Array;
		private var _xmlPreloadQueue:Array;
		
		private var _currentBitmapLoadingQueue:Array;
		private var _currentSwfLoadingQueue:Array;
		private var _currentXmlLoadingQueue:Array;

		private var _currentBitmapLoadingNum:int;
		private var _currentSwfLoadingNum:int;
		private var _currentXmlLoadingNum:int;
		
		private var _bitmapLoadLimit:int;
		private var _swfLoadLimit:int;
		private var _xmlLoadLimit:int;
		
		public function ResLoaderManager()
		{
			this._bitmapPreloadQueue = new Array();
			this._swfPreloadQueue = new Array();
			this._xmlPreloadQueue = new Array();
			
			this._currentBitmapLoadingQueue = new Array();
			this._currentSwfLoadingQueue = new Array();
			this._currentXmlLoadingQueue = new Array();
			
			this._currentBitmapLoadingNum = 0;
			this._currentSwfLoadingNum = 0;
			this._currentXmlLoadingNum = 0;
			
			this._bitmapLoadLimit = 1;
			this._swfLoadLimit = 1;
			this._xmlLoadLimit = 1;
		}
		
		public function setLoadLimit(bitmapLimit:int = 0, swfLimit:int = 0, xmlLimit:int = 0):void
		{
			if(bitmapLimit > 0)
			{
				this._bitmapLoadLimit = bitmapLimit;
			}
			
			if(swfLimit > 0)
			{
				this._swfLoadLimit = swfLimit;
			}
			
			if(xmlLimit > 0)
			{
				this._xmlLoadLimit = xmlLimit;
			}
		}
		
		
		public function loadSwfByURL(url:String, isSave:Boolean = false, callbackFunc:Function = null, passData:Object = null):ResSwfVO
		{
			var resSwfVO:ResSwfVO = ResDataPool.getInstance().getSwfVOByURL(url);
			if(resSwfVO)
			{
				if(callbackFunc != null)
				{
					callbackFunc(resSwfVO);
				}
				
				this.dispatchEvent(new ResSwfLoadEvent(resSwfVO));
				
				return resSwfVO;
			}
			
			if(this._currentSwfLoadingQueue[url] && this._currentSwfLoadingQueue[url].url == url)
			{
				return null;
			}
			
			var preloadSwfData:PreloadSwfData = new PreloadSwfData();
			preloadSwfData.initPreload(url, isSave, callbackFunc, passData);
			
			if(this._currentSwfLoadingNum < this._swfLoadLimit)
			{
				var swfLoader:ResSwfLoader = new ResSwfLoader();
				var swfUrlRequest:URLRequest = new URLRequest(url);
				var swfLoaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
				
				swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, swfLoadComplete);
				swfLoader.contentLoaderInfo.addEventListener(Event.INIT, swfLoadInit);
				swfLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, swfLoadProgress);
				swfLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, swfLoadIOError);
				
				this._currentSwfLoadingNum ++;
				this._currentSwfLoadingQueue[url] = preloadSwfData;
				
				swfLoader.load(swfUrlRequest, swfLoaderContext);
			}
			else
			{
				this._swfPreloadQueue.push(preloadSwfData);
			}
			
			return null;
		}
		
		public function loadXmlByURL(url:String, isSave:Boolean = false, callbackFunc:Function = null, passData:Object = null):ResXmlVO
		{
			var resXmlVO:ResXmlVO = ResDataPool.getInstance().getXmlVOByURL(url);
			if(resXmlVO)
			{
				if(callbackFunc != null)
				{
					callbackFunc(resXmlVO);
				}
				
				this.dispatchEvent(new ResXmlLoadEvent(resXmlVO));
				
				return resXmlVO;
			}
			
			if(this._currentXmlLoadingQueue[url] && this._currentXmlLoadingQueue[url].url == url)
			{
				return null;
			}
			
			var preloadXmlData:PreloadXmlData = new PreloadXmlData();
			preloadXmlData.initPreload(url, isSave, callbackFunc, passData);
			
			if(this._currentXmlLoadingNum < this._xmlLoadLimit)
			{
				var xmlLoader:ResXmlLoader = new ResXmlLoader();
				var xmlUrlRequest:URLRequest = new URLRequest(url);
				
				xmlLoader.dataFormat = URLLoaderDataFormat.TEXT;
				xmlLoader.addEventListener(Event.COMPLETE, xmlLoadComplete);
				
				this._currentXmlLoadingNum ++;
				this._currentXmlLoadingQueue[url] = preloadXmlData;
				
				xmlLoader.load(xmlUrlRequest);
			}
			else
			{
				this._xmlPreloadQueue.push(preloadXmlData);
			}
			
			return null;
		}
		
		private function swfLoadComplete(event:Event):void
		{
			var swfLoaderInfo:LoaderInfo = event.currentTarget as LoaderInfo;
			var swfMovieClip:MovieClip = swfLoaderInfo.content as MovieClip;
			
			if(this._currentSwfLoadingQueue[ResSwfLoader(swfLoaderInfo.loader).resUrl])
			{
				var preloadSwfData:PreloadSwfData = this._currentSwfLoadingQueue[ResSwfLoader(swfLoaderInfo.loader).resUrl];
				ResDataPool.getInstance().addResSwfVO(swfMovieClip, preloadSwfData.url, preloadSwfData.isSave, swfLoaderInfo.bytesTotal, preloadSwfData.passData);
				
				ResSwfLoader(swfLoaderInfo.loader).contentLoaderInfo.removeEventListener(Event.COMPLETE, swfLoadComplete);
				ResSwfLoader(swfLoaderInfo.loader).contentLoaderInfo.removeEventListener(Event.INIT, swfLoadInit);
				ResSwfLoader(swfLoaderInfo.loader).contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, swfLoadProgress);
				ResSwfLoader(swfLoaderInfo.loader).contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, swfLoadIOError);
				
				if(preloadSwfData.callbackFunc != null)
				{
					preloadSwfData.callbackFunc(ResDataPool.getInstance().getSwfVOByURL(ResSwfLoader(swfLoaderInfo.loader).resUrl));
				}
				
				this.dispatchEvent(new ResSwfLoadEvent(ResDataPool.getInstance().getSwfVOByURL(ResSwfLoader(swfLoaderInfo.loader).resUrl)));
				
				this._currentSwfLoadingQueue[ResSwfLoader(swfLoaderInfo.loader).resUrl] = null;
				delete this._currentSwfLoadingQueue[ResSwfLoader(swfLoaderInfo.loader).resUrl];
				
				this._currentSwfLoadingNum --;
			}
			
			if(this._currentSwfLoadingNum < this._swfLoadLimit && this._swfPreloadQueue.length > 0)
			{
				var shiftLoadData:PreloadSwfData = this._swfPreloadQueue.shift();
				this.loadSwfByURL(shiftLoadData.url, shiftLoadData.isSave, shiftLoadData.callbackFunc, shiftLoadData.passData);
			}
		}
		
		private function swfLoadInit(event:Event):void
		{
			
		}
		
		private function swfLoadProgress(event:ProgressEvent):void
		{
			trace("loading swf progress:" + event.bytesLoaded + "/" + event.bytesTotal);
		}
		
		private function swfLoadIOError(event:IOErrorEvent):void
		{
			
		}
		
		private function xmlLoadComplete(event:Event):void
		{
			var completeXmlLoader:ResXmlLoader = event.target as ResXmlLoader;
			var xmlData:XML = new XML(completeXmlLoader.data);
			
			if(this._currentXmlLoadingQueue[completeXmlLoader.resUrl])
			{
				var preloadXmlData:PreloadXmlData = this._currentXmlLoadingQueue[completeXmlLoader.resUrl];
				ResDataPool.getInstance().addResXmlVO(xmlData, preloadXmlData.url, preloadXmlData.isSave, completeXmlLoader.bytesTotal, preloadXmlData.passData);
				completeXmlLoader.removeEventListener(Event.COMPLETE, xmlLoadComplete);
				
				if(preloadXmlData.callbackFunc != null)
				{
					preloadXmlData.callbackFunc(ResDataPool.getInstance().getXmlVOByURL(completeXmlLoader.resUrl));
				}

				this.dispatchEvent(new ResXmlLoadEvent(ResDataPool.getInstance().getXmlVOByURL(completeXmlLoader.resUrl)));

				this._currentXmlLoadingQueue[completeXmlLoader.resUrl] = null;
				delete this._currentXmlLoadingQueue[completeXmlLoader.resUrl];
				
				this._currentXmlLoadingNum --;
			}
			
			if(this._currentXmlLoadingNum < this._xmlLoadLimit && this._xmlPreloadQueue.length > 0)
			{
				var shiftLoadData:PreloadXmlData = this._xmlPreloadQueue.shift();
				this.loadXmlByURL(shiftLoadData.url, shiftLoadData.isSave, shiftLoadData.callbackFunc, shiftLoadData.passData);
			}
		}
	}
}