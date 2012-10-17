package res.data.res
{
	public class ResUrlVO
	{
		private var _resClass:String;
		public function get resClass():String
		{
			return this._resClass;
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
		
		public function ResUrlVO()
		{
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._resClass = xmlData.@resClass;
			this._type = xmlData.@type;
			this._description = xmlData.@description;
			this._url = xmlData.@url;
		}
	}
}