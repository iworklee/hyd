package res.data.animation.bitmap
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
			this._partConfigVOList = new Array();
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._type = xmlData.@type;
			this._maxWidth = xmlData.@maxWidth;
			this._maxHeight = xmlData.@maxHeight;
			
			this._partConfigVOList = new Array();
			for each(var partXml:XML in xmlData.PartConfigVO)
			{
				var partConfigVO:PartConfigVO = new PartConfigVO();
				partConfigVO.initByXML(partXml);
				
				this._partConfigVOList[partXml.@type] = partConfigVO;
			}
		}
	}
}