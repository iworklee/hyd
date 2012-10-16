package res
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	import res.event.ResXmlLoadEvent;
	import res.loader.ResXmlLoader;
	import res.vo.PreloadXmlData;
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