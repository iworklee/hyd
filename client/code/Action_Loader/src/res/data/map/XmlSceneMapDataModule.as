package res.data.map
{
	import res.data.XmlDataModule;
	
	public class XmlSceneMapDataModule extends XmlDataModule
	{
		private static var _instance:XmlSceneMapDataModule;
		public static function getInstance():XmlSceneMapDataModule
		{
			if(!_instance)
			{
				_instance = new XmlSceneMapDataModule();
			}
			
			return _instance;
		}
		
		private var _sceneMapConfigList:Array;
		public function get sceneMapConfigList():Array
		{
			return this._sceneMapConfigList;
		}
		
		public function XmlSceneMapDataModule()
		{
			super();
			this._sceneMapConfigList = new Array();
		}
		
		override public function initModule(xmlData:XML):void
		{
			super.initModule(xmlData);
			
			this._sceneMapConfigList = new Array();
			for each(var sceneMapXml:XML in this._xmlData.SceneMapConfig)
			{
				var sceneMapConfig:SceneMapConfig = new SceneMapConfig();
				sceneMapConfig.initByXML(sceneMapXml);
				
				this._sceneMapConfigList[sceneMapXml.@mapId] = sceneMapConfig;
			}
		}
		
		public function getSceneMapConfigById(mapId:int):SceneMapConfig
		{
			if(this._sceneMapConfigList && this._sceneMapConfigList[mapId])
			{
				return  this._sceneMapConfigList[mapId];
			}
			
			return null;
		}
	}
}