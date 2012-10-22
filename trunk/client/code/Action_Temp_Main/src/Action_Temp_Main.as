package
{
	import Action.Core.Module.GameModuleFactory;
	import Action.Core.Module.IGameModule;
	
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

		private var unitAnimationVO:UnitAnimationVO;
		private function configDataComplete(event:ConfigDataCompleteEvent):void
		{
			unitAnimationVO = new UnitAnimationVO(ConfigDataManager.getInstance().getUnitConfigVOByUnitId(200001));
			unitAnimationVO.x = 400;
			unitAnimationVO.y = 300;
			this.addChild(unitAnimationVO);
			
			unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_MOVE);
			unitAnimationVO.changeFace(AnimationFaceEnum.ANIMATION_FACE_EAST);
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameProcess);
			
			//load all modules
			for each(var module:IGameModule in GameModuleFactory.current.getAllModules())
				module.onLoad();
		}
		
		private var _randomTickdown:int = 0;
		
		private function enterFrameProcess(event:Event):void
		{
			if(unitAnimationVO)
			{
				unitAnimationVO.enterFrameProcess();
			}
			
			if(_randomTickdown < 30)
			{
				_randomTickdown ++;
			}
			else
			{
				_randomTickdown = 0;
				var randomFace:int = Math.floor(Math.random() * 4) * 2;
				unitAnimationVO.changeFace(randomFace);
				
//				public static const ACTION_TYPE_WAIT:String = "wait";
//				public static const ACTION_TYPE_MOVE:String = "move";
//				public static const ACTION_TYPE_ATTACK:String = "attack";
//				public static const ACTION_TYPE_DEFEAT:String = "defeat";
//				public static const ACTION_TYPE_PARRY:String = "parry";
//				public static const ACTION_TYPE_HIT:String = "hit";
//				public static const ACTION_TYPE_BUFF:String = "buff";
				
//				var randomAction:int = Math.floor(Math.random() * 7);
//				switch(randomAction)
//				{
//					case 0:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_ATTACK);
//						break;
//					case 1:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_BUFF);
//						break;
//					case 2:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_DEFEAT);
//						break;
//					case 3:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_HIT);
//						break;
//					case 4:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_MOVE);
//						break;
//					case 5:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_PARRY);
//						break;
//					case 6:
//						unitAnimationVO.changeAction(ActionTypeEnum.ACTION_TYPE_WAIT);
//						break;
//				}
			}
		}
	}
}