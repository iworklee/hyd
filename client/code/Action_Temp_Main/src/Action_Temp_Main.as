package
{
	import animation.enum.AnimationFaceEnum;
	import animation.template.UnitAnimationTemplate;
	import animation.vo.UnitAnimationVO;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
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
			
			this.graphics.beginFill(0xffffff, 1);
			this.graphics.drawRect(400 - 32, 300 - 64, 64, 64);
			this.graphics.endFill();
			
			ConfigDataManager.getInstance().initConfigData();
			ConfigDataManager.getInstance().addEventListener(ConfigDataCompleteEvent.NAME, configDataComplete);
		}

		private var unitAnimationVO:UnitAnimationVO;
		private function configDataComplete(event:ConfigDataCompleteEvent):void
		{
			unitAnimationVO = new UnitAnimationVO(ConfigDataManager.getInstance().getUnitConfigVOByUnitId(100001));
			unitAnimationVO.x = 400;
			unitAnimationVO.y = 300;
			this.addChild(unitAnimationVO);
			
			unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_MOVE);
			unitAnimationVO.changeFace(AnimationFaceEnum.ANIMATION_FACE_EAST);
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameProcess);
		}
		
		private var _randomTickdown:int = 0;
		
		private function enterFrameProcess(event:Event):void
		{
			if(unitAnimationVO)
			{
				unitAnimationVO.enterFrameProcess();
			}
			
			if(_randomTickdown < 30 * 2)
			{
				_randomTickdown ++;
			}
			else
			{
				_randomTickdown = 0;
				var randomFace:int = Math.floor(Math.random() * 4) * 2;
				unitAnimationVO.changeFace(randomFace);
			}
		}
	}
}