package res.data.unit
{
	import res.data.XmlDataModule;
	
	public class XmlUnitDataModule extends XmlDataModule
	{
		private static var _instance:XmlUnitDataModule;
		public static function getInstance():XmlUnitDataModule
		{
			if(!_instance)
			{
				_instance = new XmlUnitDataModule();
			}
			
			return _instance;
		}
		
		private var _unitConfigList:Array;
		public function get unitConfigList():Array
		{
			return this._unitConfigList;
		}
		
		public function XmlUnitDataModule()
		{
			super();
			this._unitConfigList = new Array();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
			
			this._unitConfigList = new Array();
			for each(var unitXml:XML in xmlData.UnitConfigVO)
			{
				var unitConfigVO:UnitConfigVO = new UnitConfigVO();
				unitConfigVO.initByXML(unitXml);
				
				this._unitConfigList[unitXml.@unitId] = unitConfigVO;
			}
		}
		
		public function getUnitConfigVOByUnitId(unitId:int):UnitConfigVO
		{
			if(this._unitConfigList && this._unitConfigList[unitId])
			{
				return  this._unitConfigList[unitId];
			}
			
			return null;
		}
	}
}