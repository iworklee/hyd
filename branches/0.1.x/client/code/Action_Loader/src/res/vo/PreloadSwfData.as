package res.vo
{
	public class PreloadSwfData extends PreloadData
	{
		public function PreloadSwfData()
		{
			super();
		}
		
		override public function initPreload(url:String, isSave:Boolean, callbackFunc:Function, passData:Object):void
		{
			super.initPreload(url, isSave, callbackFunc, passData);
		}
	}
}