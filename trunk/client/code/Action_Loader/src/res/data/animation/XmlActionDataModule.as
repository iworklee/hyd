package res.data.animation
{
	import res.data.XmlDataModule;
	
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
		
		public function XmlActionDataModule()
		{
			super();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
		}
	}
}