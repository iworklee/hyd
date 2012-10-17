package res.data.animation.action
{
	public class ActionUnitConfig
	{
		private var _actionClass:String;
		public function get actionClass():String
		{
			return this._actionClass;
		}
		
		private var _animationType:String;
		public function get animationType():String
		{
			return this._animationType;
		}
		
		private var _actionConfigVOList:Array;
		public function get actionConfigVOList():Array
		{
			return this._actionConfigVOList;
		}
		
		public function ActionUnitConfig()
		{
			this._actionConfigVOList = new Array();
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._actionClass = xmlData.@actionClass;
			this._animationType = xmlData.@animationType;
			
			this._actionConfigVOList = new Array();
			for each(var configXml:XML in xmlData.ActionConfigVO)
			{
				var actionConfigVO:ActionConfigVO = new ActionConfigVO();
				actionConfigVO.initByXML(configXml);
				
				this._actionConfigVOList[configXml.@actionName] = actionConfigVO;
			}
		}
	}
}