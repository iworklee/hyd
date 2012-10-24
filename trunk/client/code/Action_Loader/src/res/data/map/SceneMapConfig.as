package res.data.map
{
	public class SceneMapConfig
	{
		private var _mapId:int;
		public function get mapId():int
		{
			return this._mapId;
		}
		
		private var _resId:int;
		public function get resId():int
		{
			return this._resId;
		}
		
		private var _mapWidth:Number;
		public function get mapWidth():Number
		{
			return this._mapWidth;
		}
		
		private var _mapHeight:Number;
		public function get mapHeight():Number
		{
			return this._mapHeight;
		}
		
		private var _gridSize:Number;
		public function get gridSize():Number
		{
			return this._gridSize;
		}
		
		private var _gridOffsetX:Number;
		public function get gridOffsetX():Number
		{
			return this._gridOffsetX;
		}
		
		private var _gridOffsetY:Number;
		public function get gridOffsetY():Number
		{
			return this._gridOffsetY;
		}
		
		public function SceneMapConfig()
		{
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._mapId = xmlData.@mapId;
			this._resId = xmlData.@resId;
			this._mapWidth = xmlData.@mapWidth;
			this._mapHeight = xmlData.@mapHeight;
			this._gridSize = xmlData.@gridSize;
			this._gridOffsetX = xmlData.@gridOffsetX;
			this._gridOffsetY = xmlData.@gridOffsetY;
		}
	}
}