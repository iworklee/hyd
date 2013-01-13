package res.data.unit
{
	public class UnitConfigVO
	{
		private var _unitName:String;
		public function get unitName():String
		{
			return this._unitName;
		}
		
		private var _unitId:int;
		public function get unitId():int
		{
			return this._unitId;
		}
		
		private var _unitAction:String;
		public function get unitAction():String
		{
			return this._unitAction;
		}
		
		private var _unitResId:int;
		public function get unitResId():int
		{
			return this._unitResId;
		}
		
		public function UnitConfigVO()
		{
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._unitName = xmlData.@unitName;
			this._unitId = xmlData.@unitId;
			this._unitAction = xmlData.@unitAction;
			this._unitResId = xmlData.@unitResId;
		}
	}
}