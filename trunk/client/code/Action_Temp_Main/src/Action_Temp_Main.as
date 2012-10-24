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
	
	import game.GameCoreManager;
	
	import res.ResLoaderManager;
	import res.data.ConfigDataManager;
	import res.data.animation.enum.ActionTypeEnum;
	import res.event.ConfigDataCompleteEvent;
	import res.vo.ResXmlVO;
	
	[SWF(backgroundColor="#000000", frameRate="30", width="960", height="720", pageTitle="ActionTemp")]
	public class Action_Temp_Main extends Sprite
	{
		public function Action_Temp_Main()
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;

			ConfigDataManager.getInstance().initConfigData();
			ConfigDataManager.getInstance().addEventListener(ConfigDataCompleteEvent.NAME, configDataComplete);
		}

		private function configDataComplete(event:ConfigDataCompleteEvent):void
		{
			GameCoreManager.getInstance().initGameStage(this);
			//test code
			GameCoreManager.getInstance().initGameScene();
		}
	}
}