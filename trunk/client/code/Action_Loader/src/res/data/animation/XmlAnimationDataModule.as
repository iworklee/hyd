package res.data.animation
{
	import res.data.XmlDataModule;
	import res.data.animation.bitmap.AnimationConfigVO;
	
	public class XmlAnimationDataModule extends XmlDataModule
	{
		private static var _instance:XmlAnimationDataModule;
		public static function getInstance():XmlAnimationDataModule
		{
			if(!_instance)
			{
				_instance = new XmlAnimationDataModule();
			}
			
			return _instance;
		}
		
		private var _animationConfigList:Array;
		public function get animationConfigList():Array
		{
			return this._animationConfigList;
		}
		
		public function XmlAnimationDataModule()
		{
			super();
			this._animationConfigList = new Array();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
			
			this._animationConfigList = new Array();
			for each(var animationXml:XML in this._xmlData.AnimationConfigVO)
			{
				var animationConfigVO:AnimationConfigVO = new AnimationConfigVO();
				animationConfigVO.initByXML(animationXml);
				
				this._animationConfigList[animationXml.@type] = animationConfigVO;
			}
		}
	}
}