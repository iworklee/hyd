package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import game.layer.SceneLayer;
	
	import scene.main.MainSceneManager;
	import scene.main.data.MainRoleInfo;
	import scene.main.data.MainSceneInfo;

	public class GameCoreManager
	{
		private static var _instance:GameCoreManager;
		public static function getInstance():GameCoreManager
		{
			if(!_instance)
			{
				_instance = new GameCoreManager();
			}
			
			return _instance;
		}
		
		private var _gameStage:Sprite;
		private var _sceneLayer:SceneLayer;
		
		public function GameCoreManager()
		{
		}
		
		public function initGameStage(gameStage:Sprite):void
		{
			this._gameStage = gameStage;
			this._gameStage.addEventListener(Event.ENTER_FRAME, enterFrameProcess);
			
			this.initGameLayer();
		}
		
		
		private function enterFrameProcess(event:Event):void
		{
			MainSceneManager.getInstance().mainScene.enterFrameProcess();
		}
		
		public function initGameScene():void
		{
			//test code;
			MainSceneManager.getInstance().initStage(this._gameStage);
			
			var testSceneInfo:MainSceneInfo = new MainSceneInfo();
			testSceneInfo.initMainSceneInfo(1001);
			
			MainSceneManager.getInstance().initMainSceneInfo(testSceneInfo);
		}
		
		private function initGameLayer():void
		{
			if(this._gameStage)
			{
				this._sceneLayer = new SceneLayer();
				this._gameStage.addChild(this._sceneLayer);
			}
		}
	}
}