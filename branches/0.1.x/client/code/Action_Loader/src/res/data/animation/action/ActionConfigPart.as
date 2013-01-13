package res.data.animation.action
{
	public class ActionConfigPart
	{
		private var _type:String;
		public function get type():String
		{
			return this._type;
		}
		
		private var _frame:int;
		public function get frame():int
		{
			return this._frame;
		}
		
		private var _partFaceList:Array;
		public function get partFaceList():Array
		{
			return this._partFaceList;
		}
		
		public function ActionConfigPart()
		{
			this._partFaceList = new Array();
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._type = xmlData.@type;
			this._frame = xmlData.@frame;
			
			this._partFaceList = new Array();
			for each(var faceXml:XML in xmlData.PartFace)
			{
				var partFace:PartFace = new PartFace();
				partFace.initByXML(faceXml);
				
				this._partFaceList[faceXml.@face] = partFace;
			}
		}
	}
}