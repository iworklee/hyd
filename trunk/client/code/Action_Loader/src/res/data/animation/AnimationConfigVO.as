package res.data.animation
{
	public class AnimationConfigVO
	{
		private var _type:String;
		public function get type():String
		{
			return this._type;
		}
		
		private var _maxWidth:Number;
		public function get maxWidth():Number
		{
			return this._maxWidth;
		}
		
		private var _maxHeight:Number;
		public function get maxHeight():Number
		{
			return this._maxHeight;
		}
		
		private var _partConfigVOList:Array;
		public function get partConfigVOList():Array
		{
			return this._partConfigVOList;
		}
		
		public function AnimationConfigVO()
		{
		}
		
		public function initByXML(xmlData:XML):void
		{
			
		}
	}
}