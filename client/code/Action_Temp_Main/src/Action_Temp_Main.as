package
{
	import flash.display.Sprite;
	
	import res.ResLoaderManager;
	import res.data.ConfigDataManager;
	import res.vo.ResXmlVO;
	
	public class Action_Temp_Main extends Sprite
	{
		public function Action_Temp_Main()
		{
			ResLoaderManager.getInstance().loadXmlByURL(ConfigDataManager.CONFIG_URL, false, loadXmlFunc);
			ResLoaderManager.getInstance().loadXmlByURL(ConfigDataManager.CONFIG_URL);
			
			ResLoaderManager.getInstance().loadXmlByURL("assets/xml/animation/animationConfig.xml");
			ResLoaderManager.getInstance().loadXmlByURL("assets/xml/animation/actionConfig.xml");
		}
		
		private function loadXmlFunc(xmlData:ResXmlVO):void
		{
			
		}
	}
}