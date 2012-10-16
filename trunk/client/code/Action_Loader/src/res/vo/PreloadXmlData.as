package res.vo
{
	public class PreloadXmlData extends PreloadData
	{			
		public function PreloadXmlData()
		{
		}
		
		override public function initPreload(url:String, isSave:Boolean, callbackFunc:Function, passData:Object):void
		{
			super.initPreload(url, isSave, callbackFunc, passData);
		}
	}
}