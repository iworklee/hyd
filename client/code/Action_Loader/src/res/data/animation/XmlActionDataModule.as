package res.data.animation
{
	import res.data.XmlDataModule;
	import res.data.animation.action.ActionUnitConfig;
	
	public class XmlActionDataModule extends XmlDataModule
	{
		private static var _instance:XmlActionDataModule;
		public static function getInstance():XmlActionDataModule
		{
			if(!_instance)
			{
				_instance = new XmlActionDataModule();
			}
			
			return _instance;
		}
		
		private var _actionConfigList:Array;
		public function get actionConfigList():Array
		{
			return this._actionConfigList;
		}
		
		public function XmlActionDataModule()
		{
			super();
			this._actionConfigList = new Array();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
			
			this._actionConfigList = new Array();
			for each(var actionXml:XML in this._xmlData.ActionUnitConfig)
			{
				var actionUnitConfig:ActionUnitConfig = new ActionUnitConfig();
				actionUnitConfig.initByXML(actionXml);
				
				this._actionConfigList[actionXml.@actionClass] = actionUnitConfig;
			}
		}
	}
}