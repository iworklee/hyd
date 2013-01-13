package res.vo
{
	import res.interfaces.IResVO;
	
	public class ResXmlVO extends ResVO implements IResVO
	{
		private var _xmlData:XML;
		public function get xmlData():XML
		{
			return this._xmlData;
		}
		
		public function ResXmlVO()
		{
			super();
		}
		
		public function initXmlVO(xmlData:XML, urlName:String, isSave:Boolean, byteTotal:Number, passData:Object):void
		{
			this._xmlData = xmlData;
			super.initVO(urlName, isSave, byteTotal, passData);
		}
	}
}