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
			ConfigDataManager.getInstance().initConfigData();
		}
	}
}