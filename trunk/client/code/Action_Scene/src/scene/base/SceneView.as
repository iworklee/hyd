package scene.base
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	
	import res.ResLoaderManager;
	import res.data.ConfigDataManager;
	import res.data.map.SceneMapConfig;
	import res.data.res.ResUrlVO;
	import res.enum.ResTypeEnum;
	import res.vo.ResSwfVO;
	
	public class SceneView extends Sprite
	{
		private var _sceneMapBitmap:Bitmap;
		public function get sceneMapBitmap():Bitmap
		{
			return this._sceneMapBitmap;
		}
		
		private var _sceneMapConfig:SceneMapConfig;
		
		private var _mouseGridX:int;
		public function get mouseGridX():int
		{
			return this._mouseGridX;
		}
		
		private var _mouseGridY:int;
		public function get mouseGridY():int
		{
			return this._mouseGridY;
		}
		
		private var _cameraMoveSpeedX:Number;
		public function get cameraMoveSpeedX():Number
		{
			return this._cameraMoveSpeedX;
		}
		
		private var _cameraMoveSpeedY:Number;
		public function get cameraMoveSpeedY():Number
		{
			return this._cameraMoveSpeedY;
		}
		
		private var _cameraCenter:Point;
		public function get cameraCenter():Point
		{
			return this._cameraCenter;
		}
		
		private var _targetCenter:Point;
		public function get targetCenter():Point
		{
			return this._targetCenter;
		}
		
		public function SceneView()
		{
			super();
			this._mouseGridX = 0;
			this._mouseGridY = 0;
			
			this._cameraMoveSpeedX = 10;
			this._cameraMoveSpeedY = 10;
			
			this._cameraCenter = new Point();
			this._targetCenter = new Point();
		}
		
		public function initMapData(mapData:SceneMapConfig):void
		{
			var resUrlVO:ResUrlVO = ConfigDataManager.getInstance().getResUrlVOByResClass(ResTypeEnum.RES_TYPE_SCENEMAP);
			if(resUrlVO)
			{
				ResLoaderManager.getInstance().loadSwfByURL(resUrlVO.url + resUrlVO.resClass + "_" + mapData.resId.toString() + "." + resUrlVO.type, false, resMapLoadComplete);
			}
			
			this._sceneMapConfig = mapData;
		}
		
		private function resMapLoadComplete(resSwfVO:ResSwfVO):void
		{
			var resClassName:String = "sceneMap_" + this._sceneMapConfig.resId.toString();
			var resClass:Class = getDefinitionByName(resClassName) as Class;
			
			if(resClass)
			{
				this._sceneMapBitmap = new Bitmap(new resClass, "auto", true);
				this.addChild(this._sceneMapBitmap);
				
				this.addEventListener(MouseEvent.CLICK, mouseClickSceneView);
				this.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveSceneView);
			}
		}
		
		private function mouseClickSceneView(event:MouseEvent):void
		{
			this._mouseGridX = Math.round(this.mouseX/this._sceneMapConfig.gridSize);
			this._mouseGridY = Math.round(this.mouseY/this._sceneMapConfig.gridSize);
			
			this._targetCenter.x = this.mouseX;
			this._targetCenter.y = this.mouseY;
		}
		
		private function mouseMoveSceneView(event:MouseEvent):void
		{
			this._mouseGridX = Math.round(this.mouseX/this._sceneMapConfig.gridSize);
			this._mouseGridY = Math.round(this.mouseY/this._sceneMapConfig.gridSize);
		}
		
		public function enterFrameProcess(passTime:Number = 0):void
		{
			if(this._cameraCenter.x - this.targetCenter.x < - this._cameraMoveSpeedX)
			{
				this._cameraCenter.x += this._cameraMoveSpeedX;
			}
			else if(this._cameraCenter.x - this.targetCenter.x > this._cameraMoveSpeedX)
			{
				this._cameraCenter.x -= this._cameraMoveSpeedX;
			}
			else
			{
				
			}
			
			if(this._cameraCenter.y - this.targetCenter.y < - this._cameraMoveSpeedY)
			{
				this._cameraCenter.y += this._cameraMoveSpeedY;
			}
			else if(this._cameraCenter.y - this.targetCenter.y > this._cameraMoveSpeedY)
			{
				this._cameraCenter.y -= this._cameraMoveSpeedY;
			}
			else
			{
				
			}
			
			var offsetX:Number = this._cameraCenter.x - this.stage.stageWidth/2;
			var offsetY:Number = this._cameraCenter.y - this.stage.stageHeight/2;
			
			trace(offsetX + " - " + offsetY);
			
			if(offsetX < 0)
			{
				offsetX = 0;
			}
			else if(offsetX > this._sceneMapConfig.mapWidth - this.stage.stageWidth)
			{
				offsetX = this._sceneMapConfig.mapWidth - this.stage.stageWidth;
			}
			
			if(offsetY < 0)
			{
				offsetY = 0;
			}
			else if(offsetY > this._sceneMapConfig.mapHeight - this.stage.stageHeight)
			{
				offsetY = this._sceneMapConfig.mapHeight - this.stage.stageHeight;
			}
			
			this.x = - offsetX;
			this.y = - offsetY;
		}
	}
}