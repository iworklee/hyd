package
{
	import animation.enum.AnimationFaceEnum;
	import animation.template.UnitAnimationTemplate;
	import animation.vo.UnitAnimationVO;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import res.ResLoaderManager;
	import res.data.ConfigDataManager;
	import res.data.animation.enum.ActionTypeEnum;
	import res.event.ConfigDataCompleteEvent;
	import res.vo.ResXmlVO;
	
	[SWF(backgroundColor="#000000", frameRate="30", width="800", height="600", pageTitle="ActionTemp")]
	public class Action_Temp_Main extends Sprite
	{
		public function Action_Temp_Main()
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;

			ConfigDataManager.getInstance().initConfigData();
			ConfigDataManager.getInstance().addEventListener(ConfigDataCompleteEvent.NAME, configDataComplete);
		}

//		private var unitAnimationVO:UnitAnimationVO;
		private var _unitVOList:Array;
		private function configDataComplete(event:ConfigDataCompleteEvent):void
		{
//			unitAnimationVO = new UnitAnimationVO(ConfigDataManager.getInstance().getUnitConfigVOByUnitId(200001));
//			unitAnimationVO.x = 400;
//			unitAnimationVO.y = 300;
//			this.addChild(unitAnimationVO);
//			
//			unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_MOVE);
//			unitAnimationVO.changeFace(AnimationFaceEnum.ANIMATION_FACE_EAST);
//			

			this._unitVOList = new Array();
			for(var i:int = 0; i < 31; i++)
			{
				for(var j:int = 0; j < 21; j++)
				{
					if(i == 15 && j == 10)
					{
						var unitAnimationVO:UnitAnimationVO = new UnitAnimationVO(ConfigDataManager.getInstance().getUnitConfigVOByUnitId(200001));
					}
					else
					{
						if(i > 10 && i < 20 && j > 5 && j < 15)
						{
							unitAnimationVO = new UnitAnimationVO(ConfigDataManager.getInstance().getUnitConfigVOByUnitId(100101));
						}
						else
						{
							unitAnimationVO = new UnitAnimationVO(ConfigDataManager.getInstance().getUnitConfigVOByUnitId(100001));
						}
						
					}
					
					unitAnimationVO.x = i * 24 + 32;
					unitAnimationVO.y = j * 24 + 64;
					
					this.addChild(unitAnimationVO);
					
					unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_MOVE);
					unitAnimationVO.changeFace(AnimationFaceEnum.ANIMATION_FACE_EAST);
					
					this._unitVOList.push(unitAnimationVO);
				}
			}
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameProcess);
		}
		
		private var _randomTickdown:int = 0;
		
		private function enterFrameProcess(event:Event):void
		{
			if(this._unitVOList)
			{
				for(var i:int = 0; i < this._unitVOList.length; i++)
				{
					var unitAnimationVO:UnitAnimationVO = this._unitVOList[i] as UnitAnimationVO;
					unitAnimationVO.enterFrameProcess();
				}
			}
			
//			if(unitAnimationVO)
//			{
//				unitAnimationVO.enterFrameProcess();
//			}
		}
	}
}