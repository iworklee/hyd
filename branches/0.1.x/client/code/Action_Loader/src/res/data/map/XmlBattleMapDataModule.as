package res.data.map
{
	import res.data.XmlDataModule;
	
	public class XmlBattleMapDataModule extends XmlDataModule
	{
		private static var _instance:XmlBattleMapDataModule;
		public static function getInstance():XmlBattleMapDataModule
		{
			if(!_instance)
			{
				_instance = new XmlBattleMapDataModule();
			}
			
			return _instance;
		}
		
		private var _battleMapConfigList:Array;
		public function get battleMapConfigList():Array
		{
			return this._battleMapConfigList;
		}
		
		public function XmlBattleMapDataModule()
		{
			super();
			this._battleMapConfigList = new Array();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
			
			this._battleMapConfigList = new Array();
			for each(var battleMapXml:XML in this._xmlData.BattleMapConfig)
			{
				var battleMapConfig:BattleMapConfig = new BattleMapConfig();
				battleMapConfig.initByXML(battleMapXml);
				
				this._battleMapConfigList[battleMapXml.@mapId] = battleMapConfig;
			}
		}
		
		public function getBattleMapConfigById(mapId:int):BattleMapConfig
		{
			if(this._battleMapConfigList && this._battleMapConfigList[mapId])
			{
				return  this._battleMapConfigList[mapId];
			}
			
			return null;
		}
	}
}