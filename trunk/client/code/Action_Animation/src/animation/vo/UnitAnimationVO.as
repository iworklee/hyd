package animation.vo
{
	import animation.AnimationTemplateManager;
	import animation.enum.AnimationFaceEnum;
	import animation.template.UnitAnimationTemplate;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import res.data.animation.action.ActionConfigPart;
	import res.data.animation.action.ActionConfigVO;
	import res.data.animation.action.PartFace;
	import res.data.animation.bitmap.PartConfigVO;
	import res.data.animation.enum.ActionTypeEnum;
	import res.data.unit.UnitConfigVO;

	public class UnitAnimationVO extends AnimationVO
	{
		private var _unitAnimationTemplate:UnitAnimationTemplate
		public function get unitAnimationTemplate():UnitAnimationTemplate
		{
			return this._unitAnimationTemplate;
		}
		
		private var _canvasBitmap:Bitmap;
		private var _canvasBitmapData:BitmapData;
		private var _canvasRectangle:Rectangle;
		
		private var _defaultAction:String;
		private var _currentActionVO:ActionConfigVO;
		private var _currentActionPart:ActionConfigPart;
		
		private var _defaultFace:int;
		private var _currentFace:int;
		private var _lastFaceChangeFlag:Boolean;
		
		private var _currentPartIndex:int;
		private var _currentPlayFrame:int;

		public function UnitAnimationVO(unitConfigVO:UnitConfigVO)
		{
			super();
			this.initUnitAnimationVO(unitConfigVO.unitResId, unitConfigVO.unitAction);
			
			this._defaultAction = ActionTypeEnum.ACTION_TYPE_WAIT;
			this.changeAction(this._defaultAction);
			
			this._defaultFace = AnimationFaceEnum.ANIMATION_FACE_SOUTH;
			this.changeFace(this._defaultFace);
			this._lastFaceChangeFlag = false;
			
			this._currentPartIndex = 0;
			this._currentPlayFrame = 0;
		}
		
		public function changeAction(actionName:String):void
		{
			if(this._unitAnimationTemplate && this._unitAnimationTemplate.actionUnitConfig.actionConfigVOList[actionName])
			{
				var actionConfigVO:ActionConfigVO = this._unitAnimationTemplate.actionUnitConfig.actionConfigVOList[actionName];
				if(actionConfigVO)
				{
					this._currentActionVO = actionConfigVO;
					this._currentActionPart = this._currentActionVO.actionConfigPartList[0];
					
					this._currentPartIndex = 0;
					this._currentPlayFrame = 0;
				}
				else
				{
					this.changeAction(this._defaultAction);
				}
			}
		}
		
		public function changeFace(face:int):void
		{
			this._currentFace = face;
			this._lastFaceChangeFlag = true;
		}
		
		private function initUnitAnimationVO(unitResId:int, unitAction:String):void
		{
			this._unitAnimationTemplate = AnimationTemplateManager.getInstance().createUnitAnimationTemplate(unitResId, unitAction);
			if(this._unitAnimationTemplate)
			{
				this._canvasBitmapData = new BitmapData(this._unitAnimationTemplate.animationConfigVO.maxWidth, this._unitAnimationTemplate.animationConfigVO.maxHeight,
					true, 0x00000000);
				this._canvasBitmap = new Bitmap(this._canvasBitmapData, "auto", true);
				this._canvasRectangle = new Rectangle(0, 0, this._unitAnimationTemplate.animationConfigVO.maxWidth, this._unitAnimationTemplate.animationConfigVO.maxHeight);
				
				this._canvasBitmap.x = - this._unitAnimationTemplate.animationConfigVO.maxWidth/2;
				this._canvasBitmap.y = - this._unitAnimationTemplate.animationConfigVO.maxHeight;
				
				this.addChild(this._canvasBitmap);
			}
		}
		
		public function enterFrameProcess(passTime:Number = 0):void
		{
			if(passTime > 0)
			{
				
			}
			else
			{
				
			}
			
			if(this._unitAnimationTemplate && this._unitAnimationTemplate.isInitComplete)
			{
				if(this._currentPlayFrame == 0 || this._lastFaceChangeFlag)
				{
					this._lastFaceChangeFlag = false;
					this._canvasBitmapData.fillRect(this._canvasRectangle, 0x00000000);

					var currentPartFace:PartFace = this._currentActionPart.partFaceList[this._currentFace];
					var currentPartConfigVO:PartConfigVO = this._unitAnimationTemplate.animationConfigVO.partConfigVOList[this._currentActionPart.type];
					
					this._canvasBitmapData.lock();
					this._canvasBitmapData.copyPixels(this._unitAnimationTemplate.partBitmapDataList[this._currentActionPart.type], 
						new Rectangle(currentPartFace.xOffset * currentPartConfigVO.partWidth, 
							currentPartFace.yOffset * currentPartConfigVO.partHeight, 
							currentPartConfigVO.partWidth, currentPartConfigVO.partHeight),
						new Point(this._unitAnimationTemplate.animationConfigVO.maxWidth/2 - currentPartConfigVO.centerX,
							this._unitAnimationTemplate.animationConfigVO.maxHeight - currentPartConfigVO.centerY));
					this._canvasBitmapData.unlock();
					
					if(currentPartFace.reverse > 0)
					{
						this._canvasBitmap.scaleX = -1;
						this._canvasBitmap.x = this._unitAnimationTemplate.animationConfigVO.maxWidth/2;
						this._canvasBitmap.y = - this._unitAnimationTemplate.animationConfigVO.maxHeight;
						
					}
					else
					{
						this._canvasBitmap.scaleX = 1;
						this._canvasBitmap.x = - this._unitAnimationTemplate.animationConfigVO.maxWidth/2;
						this._canvasBitmap.y = - this._unitAnimationTemplate.animationConfigVO.maxHeight;
					}
				}
			}
			
			
			if(this._currentActionPart)
			{
				if(this._currentPlayFrame < this._currentActionPart.frame)
				{
					this._currentPlayFrame ++;
				}
				else
				{
					this._currentPlayFrame = 0;
					
					if(this._currentPartIndex < this._currentActionVO.actionConfigPartList.length - 1)
					{
						this._currentPartIndex ++;
					}
					else
					{
						this._currentPartIndex = 0;
					}
					
					this._currentActionPart = this._currentActionVO.actionConfigPartList[this._currentPartIndex];
				}
			}
		}
	}
}