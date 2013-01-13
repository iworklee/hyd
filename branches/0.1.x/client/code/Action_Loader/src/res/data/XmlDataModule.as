package res.data
{
	public class XmlDataModule
	{
		protected var _xmlData:XML;
		public function get xmlData():XML
		{
			return this._xmlData;
		}
		
		public function XmlDataModule()
		{
		}
		
		public function initModule(xmlData:XML):void
		{
			this._xmlData = xmlData;
		}
	}
}