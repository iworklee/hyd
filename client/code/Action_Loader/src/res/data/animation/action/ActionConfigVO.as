package res.data.animation.action
{
	public class ActionConfigVO
	{
		private var _actionName:String;
		public function get actionName():String
		{
			return this._actionName;
		}
		
		private var _totalFrame:int;
		public function get totalFrame():int
		{
			return this._totalFrame;
		}
		
		private var _actionConfigPartList:Array;
		public function get actionConfigPartList():Array
		{
			return this._actionConfigPartList;
		}
		
		public function ActionConfigVO()
		{
			this._actionConfigPartList = new Array();
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._actionName = xmlData.@actionName;
			this._totalFrame = xmlData.@totalFrame;
			
			this._actionConfigPartList = new Array();
			for each(var partXml:XML in xmlData.ActionConfigPart)
			{
				var actionConfigPart:ActionConfigPart = new ActionConfigPart();
				actionConfigPart.initByXML(partXml);
				
				this._actionConfigPartList.push(actionConfigPart);
			}
		}
	}
}