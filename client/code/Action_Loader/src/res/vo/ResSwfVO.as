package res.vo
{
	import flash.display.MovieClip;
	
	import res.interfaces.IResVO;
	
	public class ResSwfVO extends ResVO implements IResVO
	{
		private var _swfData:MovieClip;
		public function get swfData():MovieClip
		{
			return this._swfData;
		}
		
		public function ResSwfVO()
		{
		}
		
		public function initXmlVO(swfData:MovieClip, urlName:String, isSave:Boolean, byteTotal:Number, passData:Object):void
		{
			this._swfData = swfData;
			super.initVO(urlName, isSave, byteTotal, passData);
		}
	}
}