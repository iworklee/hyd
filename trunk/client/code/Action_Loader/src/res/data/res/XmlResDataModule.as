package res.data.res
{
	import res.data.XmlDataModule;
	
	public class XmlResDataModule extends XmlDataModule
	{
		private static var _instance:XmlResDataModule;
		public static function getInstance():XmlResDataModule
		{
			if(!_instance)
			{
				_instance = new XmlResDataModule();
			}
			
			return _instance;
		}
		
		private var _resUrlList:Array;
		public function get resUrlList():Array
		{
			return this._resUrlList;
		}
		
		public function XmlResDataModule()
		{
			super();
			this._resUrlList = new Array();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
			
			this._resUrlList = new Array();
			for each(var resUrlXml:XML in xmlData.resURL)
			{
				var resUrlVO:ResUrlVO = new ResUrlVO();
				resUrlVO.initByXML(resUrlXml);
				
				this._resUrlList[resUrlXml.@resClass] = resUrlVO;
			}
		}
		
		public function getResUrlVOByResClass(resClass:String):ResUrlVO
		{
			if(this._resUrlList && this._resUrlList[resClass])
			{
				return  this._resUrlList[resClass];
			}
			
			return null;
		}
	}
}