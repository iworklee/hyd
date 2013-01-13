package scene.base.data
{
	public class BaseSceneInfo
	{
		private var _sceneId:int;
		public function get sceneId():int
		{
			return this._sceneId;
		}
		
		public function BaseSceneInfo()
		{
		}
		
		protected function initSceneInfo(sceneId:int):void
		{
			this._sceneId = sceneId;
		}
	}
}