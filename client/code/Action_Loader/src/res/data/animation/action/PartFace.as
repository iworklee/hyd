package res.data.animation.action
{
	public class PartFace
	{
		private var _face:int;
		public function get face():int
		{
			return this._face;
		}
		
		private var _xOffset:int;
		public function get xOffset():int
		{
			return this._xOffset;
		}
		
		private var _yOffset:int;
		public function get yOffset():int
		{
			return this._yOffset;
		}
		
		private var _reverse:int;
		public function get reverse():int
		{
			return this._reverse;
		}
		
		public function PartFace()
		{
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._face = xmlData.@face;
			this._xOffset = xmlData.@xOffset;
			this._yOffset = xmlData.@yOffset;
			this._reverse = xmlData.@reverse;
		}
	}
}