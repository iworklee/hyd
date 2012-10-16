package res.data
{
	public class ConfigUrlVO
	{
		private var _configName:String;
		public function get configName():String
		{
			return this._configName;
		}
		
		private var _type:String;
		public function get type():String
		{
			return this._type;
		}
		
		private var _description:String;
		public function get description():String
		{
			return this._description;
		}
		
		private var _url:String;
		public function get url():String
		{
			return this._url;
		}
		
		public function ConfigUrlVO()
		{
		}

		public function initByXML(xmlData:XML):void
		{
			
		}
	}
}