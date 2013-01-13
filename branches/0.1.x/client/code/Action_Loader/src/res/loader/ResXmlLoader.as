package res.loader
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ResXmlLoader extends URLLoader
	{
		private var _resUrl:String;
		public function get resUrl():String
		{
			return this._resUrl;
		}

		public function ResXmlLoader(request:URLRequest=null)
		{
			super(request);
			if(request)
			{
				this._resUrl = request.url;
			}
		}
		
		override public function load(request:URLRequest):void
		{
			super.load(request);
			this._resUrl = request.url;
		}
	}
}