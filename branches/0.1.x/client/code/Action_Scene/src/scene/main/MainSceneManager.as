package scene.main
{
	import flash.display.Sprite;
	
	import res.data.ConfigDataManager;
	import res.data.map.SceneMapConfig;
	
	import scene.main.data.MainRoleInfo;
	import scene.main.data.MainSceneInfo;

	public class MainSceneManager
	{
		private static var _instance:MainSceneManager;
		public static function getInstance():MainSceneManager
		{
			if(!_instance)
			{
				_instance = new MainSceneManager();
			}
			
			return _instance;
		}
		
		private var _mainScene:MainScene;
		public function get mainScene():MainScene
		{
			return this._mainScene;
		}
		
		private var _currentStage:Sprite;
		
		private var _sceneMapConfig:SceneMapConfig;
		public function get sceneMapConfig():SceneMapConfig
		{
			return this._sceneMapConfig;
		}
		
		public function MainSceneManager()
		{
			this._mainScene = new MainScene();
		}
		
		public function initStage(currentStage:Sprite):void
		{
			this._currentStage = currentStage;
			this._mainScene.initStage(this._currentStage);
		}

		public function initMainRoleInfo(mainRoleInfo:MainRoleInfo):void
		{
			
		}
		
		public function initMainSceneInfo(mainSceneInfo:MainSceneInfo):void
		{
			if(mainSceneInfo)
			{
				var sceneMapConfig:SceneMapConfig = ConfigDataManager.getInstance().getSceneMapConfigById(mainSceneInfo.sceneId);
				if(sceneMapConfig)
				{
					this._sceneMapConfig = sceneMapConfig;
					this._mainScene.initMapData(this._sceneMapConfig);
				}
			}
		}
	}
}