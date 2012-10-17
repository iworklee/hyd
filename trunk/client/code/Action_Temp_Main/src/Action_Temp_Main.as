package
{
	import animation.template.UnitAnimationTemplate;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import res.ResLoaderManager;
	import res.data.ConfigDataManager;
	import res.event.ConfigDataCompleteEvent;
	import res.vo.ResXmlVO;
	
	[SWF(frameRate="30", width="800", height="600", pageTitle="ActionTemp")]
	public class Action_Temp_Main extends Sprite
	{
		public function Action_Temp_Main()
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			ConfigDataManager.getInstance().initConfigData();
			ConfigDataManager.getInstance().addEventListener(ConfigDataCompleteEvent.NAME, configDataComplete);
		}
		
		private var animationTemplate:UnitAnimationTemplate;
		private function configDataComplete(event:ConfigDataCompleteEvent):void
		{
			animationTemplate = new UnitAnimationTemplate();
			animationTemplate.initUnitAnimationTemplate(100001, "foot");
			
			this.addEventListener(Event.ENTER_FRAME, enterFrameProcess);
		}
		
		private function enterFrameProcess(event:Event):void
		{
			if(animationTemplate.partBitmapDataList["atk"])
			{
				var bitmap:Bitmap = new Bitmap(animationTemplate.partBitmapDataList["move"], "auto", true);
				this.addChild(bitmap);
				
				this.removeEventListener(Event.ENTER_FRAME, enterFrameProcess);
			}
		}
	}
}