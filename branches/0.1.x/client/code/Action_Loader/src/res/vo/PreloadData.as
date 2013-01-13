package res.vo
{
	public class PreloadData
	{
		private var _url:String;
		public function get url():String
		{
			return this._url;
		}
		
		private var _isSave:Boolean;
		public function get isSave():Boolean
		{
			return this._isSave;
		}
		
		private var _callbackFunc:Function;
		public function get callbackFunc():Function
		{
			return this._callbackFunc;
		}
		
		private var _passData:Object;
		public function get passData():Object
		{
			return this._passData;
		}
		
		public function PreloadData()
		{
		}
		
		public function initPreload(url:String, isSave:Boolean, callbackFunc:Function, passData:Object):void
		{
			this._url = url;
			this._isSave = isSave;
			this._callbackFunc = callbackFunc;
			this._passData = passData;
		}
	}
}