package res.data.map
{
	public class BattleMapConfig
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
		
		public function BattleMapConfig()
		{
		}
		
		public function initByXML(xmlData:XML):void
		{
			this._mapId = xmlData.@mapId;
			this._resId = xmlData.@resId;
			this._mapWidth = xmlData.@mapWidth;
			this._mapHeight = xmlData.@mapHeight;
		}
	}
}