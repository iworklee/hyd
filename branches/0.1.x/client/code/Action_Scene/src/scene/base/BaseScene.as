package scene.base
{
	import flash.display.Sprite;
	
	import res.data.map.SceneMapConfig;

	public class BaseScene
	{
		private var _sceneView:SceneView;
		protected function get sceneView():SceneView
		{
			return this._sceneView;
		}
		
		private var _currentStage:Sprite;
		
		public function BaseScene()
		{
			this._sceneView = new SceneView;
		}
		
		public function initStage(currentStage:Sprite):void
		{
			this._currentStage = currentStage;
			this._currentStage.addChild(this._sceneView);
		}
		
		public function initMapData(mapData:SceneMapConfig):void
		{
			this._sceneView.initMapData(mapData);
		}
		
		public function enterFrameProcess(passTime:Number = 0):void
		{
			if(this._sceneView)
			{
				this._sceneView.enterFrameProcess(passTime);
			}		
		}
	}
}