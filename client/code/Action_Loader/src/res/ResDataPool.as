package res
{
	import res.vo.ResXmlVO;

	public class ResDataPool
	{
		private static var _instance:ResDataPool;
		public static function getInstance():ResDataPool
		{
			if(!_instance)
			{
				_instance = new ResDataPool();
			}
			
			return _instance;
		}
		
		private var _resBitmapVOList:Array;
		private var _resSwfVOList:Array;
		private var _resXmlVOList:Array;
		
		public function ResDataPool()
		{
			this._resBitmapVOList = new Array();
			this._resSwfVOList = new Array();
			this._resXmlVOList = new Array();
		}
		
		public function addResXmlVO(xmlData:XML, urlName:String, isSave:Boolean, byteTotal:Number):void
		{
			if(getXmlVOByURL(urlName) == null)
			{
				var resXmlVO:ResXmlVO = new ResXmlVO();
				resXmlVO.initXmlVO(xmlData, urlName, isSave, byteTotal);
				
				this._resXmlVOList[urlName] = resXmlVO;
			}
		}
		
		public function getXmlVOByURL(url:String):ResXmlVO
		{
			for each(var resXmlVO:ResXmlVO in this._resXmlVOList)
			{
				if(resXmlVO.urlName == url)
				{
					return resXmlVO;
				}
			}
			
			return null;
		}
	}
}