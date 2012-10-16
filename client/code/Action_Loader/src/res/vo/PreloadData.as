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
		
		public function PreloadData()
		{
		}
		
		public function initPreload(url:String, isSave:Boolean, callbackFunc:Function):void
		{
			this._url = url;
			this._isSave = isSave;
			this._callbackFunc = callbackFunc;
		}
	}
}