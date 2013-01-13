package res.loader
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	public class ResSwfLoader extends Loader
	{
		private var _resUrl:String;
		public function get resUrl():String
		{
			return this._resUrl;
		}
		
		public function ResSwfLoader()
		{
			super();
		}
		
		override public function load(request:URLRequest, context:LoaderContext=null):void
		{
			super.load(request, context);	
			this._resUrl = request.url;
		}
	}
}