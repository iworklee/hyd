package scene.main
{

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
		
		public function MainSceneManager()
		{
		}
		
		public function initMainRoleInfo():void
		{
			
		}
		
		public function initMainSceneInfo():void
		{
			
		}
	}
}