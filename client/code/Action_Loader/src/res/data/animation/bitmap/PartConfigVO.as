package res.data.animation.bitmap
{
	public class PartConfigVO
	{
		private var _type:String;
		public function get type():String
		{
			return this._type;
		}
		
		private var _partWidth:Number;
		public function get partWidth():Number
		{
			return this._partWidth;
		}
		
		private var _partHeight:Number;
		public function get partHeight():Number
		{
			return this._partHeight;
		}
		
		private var _centerX:Number;
		public function get centerX():Number
		{
			return this._centerX;
		}
		
		private var _centerY:Number;
		public function get centerY():Number
		{
			return this._centerY;
		}
		
		private var _isVertical:int;
		public function get isVertical():int
		{
			return this._isVertical;
		}
		
		public function PartConfigVO()
		{
		}
				
		public function initByXML(xmlData:XML):void
		{
			this._type = xmlData.@type;
			this._partWidth = xmlData.@partWidth;
			this._partHeight = xmlData.@partHeight;
			this._centerX = xmlData.@centerX;
			this._centerY = xmlData.@centerY;
			this._isVertical = xmlData.@isVertical;
		}
	}
}